import copy
import os
import sys
import numpy as np
import pandas as pd
import subprocess as SP
import multiprocessing as MP
from importlib import import_module


class DLA(object):
    def __init__(self, hw_param_dicts, dataflow, home_path) -> None:
        super(DLA, self).__init__()
        self.hw_param_dicts = hw_param_dicts
        self.dataflow = dataflow
        self.home_path = home_path
        self.dla_dicts = self.set_dla()
        self.DSE_indicator = 0

    def set_dla(self):
        dla_dicts = {}
        dla_dicts['pes'] = self.hw_param_dicts['dla_pes']
        dla_dicts['glb_size'] = self.hw_param_dicts['glb_size']
        # dla_dicts['l1_size'] = self.hw_param_dicts['dla_l1_size']
        dla_dicts['noc_bw'] = self.hw_param_dicts['dla_noc_bw']
        # dla_dicts['offchip_bw'] = self.hw_param_dicts['offchip_bw']
        dla_dicts['dataflow'] = self.dataflow
        return dla_dicts

    def set_dse_param(self, pes, noc_bw, indicator):
        self.dla_dicts['pes'] = pes
        self.dla_dicts['noc_bw'] = noc_bw
        self.DSE_indicator = indicator

    def invoke_maestro(self, model):
        mapping_path = os.path.abspath(os.path.join(self.home_path, 'model/' + model + '/' + model + '-dla_' + self.dataflow + '.m'))
        maestro_result_csv_path = os.path.abspath(os.path.join(self.home_path, 'output/' + model + '/' + model + '-dla_' + self.dataflow + '.csv'))
        maestro_path = os.path.abspath(os.path.join(self.home_path, 'maestro'))

        # if os.path.exists(output_csv_path):
        #   print("dla outfile conflict.")
        #   raise AttributeError
        if os.path.exists(maestro_result_csv_path):
            os.remove(maestro_result_csv_path)

        print("[maestro] invoked", self.dla_dicts)
        params = [self.dla_dicts['pes'], self.dla_dicts['glb_size'], self.dla_dicts['noc_bw'], mapping_path]
        command = "./maestro --num_pes={0[0]} --l2_size_cstr={0[1]} --noc_bw_cstr={0[2]} --Mapping_file='{0[3]}' --print_res=false --print_res_csv_file=true --print_log_file=false".format(
            params)
        process = SP.Popen(command, stdout=SP.PIPE, stderr=SP.PIPE, cwd=maestro_path, shell=True)
        '''
        command = [
            "./maestro", "--num_pes={}".format(self.dla_dicts['pes']), "--l2_size_cstr={}".format(self.dla_dicts['glb_size']),
            "--noc_bw_cstr={}".format(self.dla_dicts['noc_bw']), "--Mapping_file='{}'".format(mapping_path), "--print_res=false", "--print_res_csv_file=true",
            "--print_log_file=false"
        ]
        process = SP.Popen(command, stdout=SP.PIPE, stderr=SP.PIPE, cwd=maestro_path)
        '''
        stdout, stderr = process.communicate()
        process.wait()

    def export(self, model, on_DLA_layer_index=None):
        output_csv_path = os.path.abspath(os.path.join(self.home_path, 'output/' + model + '/' + model + '-dla.csv'))
        maestro_result_csv_path = os.path.abspath(os.path.join(self.home_path, 'output/' + model + '/' + model + '-dla_' + self.dataflow + '.csv'))
        # maestro original maestro_result csv pisition: maestro/.
        output_csv_dicts = {}
        try:
            maestro_result_df = pd.read_csv(maestro_result_csv_path)
            layers = maestro_result_df.shape[0]
            if self.DSE_indicator == 0:
                on_DLA_layer_index = range(layers)
            elif on_DLA_layer_index is None:
                raise AttributeError
                sys.exit(1)
            runtime_nd = maestro_result_df[' Runtime (Cycles)'].to_numpy().reshape(-1, 1)[on_DLA_layer_index]
            energy_nd = maestro_result_df[' Activity count-based Energy (nJ)'].to_numpy().reshape(-1, 1)[on_DLA_layer_index]
            area = maestro_result_df.at[0, ' Area']
            power_nd = maestro_result_df[' Power'].to_numpy().reshape(-1, 1)[on_DLA_layer_index]
            l2_size_nd = maestro_result_df["  L2 SRAM Size Req (Bytes)"].to_numpy().reshape(-1, 1)[on_DLA_layer_index]
            if np.median(l2_size_nd) > self.dla_dicts['glb_size']:
                print('maestro glb size exeed.')
                return
            output_csv_dicts['DSE index'] = self.DSE_indicator
            output_csv_dicts['layers'] = len(on_DLA_layer_index)
            output_csv_dicts['latency'] = runtime_nd.sum()
            output_csv_dicts['energy'] = energy_nd.sum()
            output_csv_dicts['area'] = area
            output_csv_dicts['power'] = power_nd.mean()  # wrong
            output_csv_dicts['restraint'] = 'unexamined' if self.DSE_indicator != 0 else 'pass'
            csv = pd.DataFrame(output_csv_dicts, index=[self.DSE_indicator])
            if os.path.exists(output_csv_path):
                csv.to_csv(output_csv_path, mode='a', header=False, index=False)
            else:
                csv.to_csv(output_csv_path, index=False)
        except FileNotFoundError:
            print('maestro invoke fatal.')
        print('       DLA Latency:', output_csv_dicts['latency'], 'ns')
        print('       DLA Area:', output_csv_dicts['latency'], 'um2')
        print('       DLA Energy:', output_csv_dicts['latency'], 'nJ')

        return


class RRAM(object):
    def __init__(self, hw_param_dicts, home_path) -> None:
        super(RRAM, self).__init__()
        self.hw_param_dicts = hw_param_dicts
        self.rram_dicts = self.set_rram()
        self.mem_capacity = self.get_memory_capacity()
        self.home_path = home_path
        self.rram_config_path = os.path.abspath(os.path.join(home_path, "rram_config.ini"))
        self.DSE_indicator = 0

    def set_rram(self):
        rram_dicts = {}
        rram_dicts['tile_row'] = self.hw_param_dicts['rram_tile_size']
        rram_dicts['tile_col'] = self.hw_param_dicts['rram_tile_size']
        rram_dicts['glb_size'] = self.hw_param_dicts['glb_size']
        rram_dicts['tile_bw'] = self.hw_param_dicts['rram_tile_bw']
        return rram_dicts

    def set_dse_param(self, row, col, tile_bw, indicator):
        self.rram_dicts['tile_row'] = row
        self.rram_dicts['tile_col'] = col
        self.rram_dicts['tile_bw'] = tile_bw
        self.mem_capacity = self.get_memory_capacity()
        self.DSE_indicator = indicator

    def get_memory_capacity(self):
        return self.rram_dicts['tile_row'] * self.rram_dicts['tile_col'] * 16 * 8 * 2 * 128**2 * 2  # bit

    def invoke_MNSIM(self, model, on_RRAM_layer_index=[]):
        output_csv_path = os.path.abspath(os.path.join(self.home_path, 'output/' + model + '/' + model + '-rram.csv'))
        # if os.path.exists(output_csv_path):
        #    print("rram outfile conflict.")
        #    raise AttributeError
        print("[MNSIM] invoked", self.rram_dicts)
        import_module("MNSIM_main").main(model, [self.rram_dicts['tile_row'], self.rram_dicts['tile_col']], self.rram_dicts['tile_bw'], self.DSE_indicator,
                                         on_RRAM_layer_index)
        '''
        command = [
            "python", "../MNSIM.py", "--model {}".format(model), "--tile_size {} {}".format(self.rram_dicts['tile_row'], self.rram_dicts['tile_col']),
            "--tile_noc_bw {}".format(self.rram_dicts['tile_bw'])
        ]
        process = SP.Popen(command, stdout=SP.PIPE, stderr=SP.PIPE)
        stdout, stderr = process.communicate()
        process.wait()
        '''
        if os.path.exists(output_csv_path) is False:
            print('MNSIM invoke fatal.')
            raise FileNotFoundError
        return
