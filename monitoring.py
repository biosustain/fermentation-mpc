import warnings
warnings.filterwarnings("ignore", message="numpy.dtype size changed")
warnings.filterwarnings("ignore", message="numpy.ufunc size changed")

import matplotlib
matplotlib.use('TkAgg')
import pandas as pd
import matplotlib
matplotlib.use('TkAgg')
from parest_copasi import parameter_estimation_online
import os
import sys
import time
from models import batch_model_mu
from datetime import datetime


def watcher(output, filename_experimental_data1,filename_experimental_data2,alpha_lower_bound,
            alpha_upper_bound, beta_lower_bound,beta_upper_bound, model_for_parest, Sheet):

    class Watcher(object):
        running = True
        refresh_delay_secs = 1

        # Constructor
        def __init__(self, watch_file, call_func_on_change=None, *args, **kwargs):
            self._cached_stamp = 0
            self.filename = watch_file
            self.call_func_on_change = call_func_on_change
            self.args = args
            self.kwargs = kwargs

        # Look for changes
        def look(self):
            stamp = os.stat(self.filename).st_mtime
            if stamp != self._cached_stamp:
                self._cached_stamp = stamp
                # File has changed, so do something...
                print('File changed')
                if self.call_func_on_change is not None:
                    self.call_func_on_change(*self.args, **self.kwargs)

        # Keep watching in a loop
        def watch(self):
            while self.running:
                try:
                    # Look for changes
                    time.sleep(self.refresh_delay_secs)
                    self.look()
                except KeyboardInterrupt:
                    print('\nDone')
                    break
                except FileNotFoundError:
                    # Action on file not found
                    pass
                except:
                    print('Unhandled error: %s' % sys.exc_info()[0])


    def custom_action(text):

        online_data = pd.ExcelFile(watch_file)
        online_data = online_data.parse(Sheet)


        # Calculate the difference in time, so we can select all the data that corresponds to 1 reactor

        time = pd.to_timedelta(online_data['Time      '])
        shifted_time = time.shift(periods=-1)
        delta = shifted_time - time
        online_data['delta'] = delta

        # Select the rows with difference in time between 46 and 47 minutes
        # and create new dataframe that we will be working with
        selected_data = online_data[(online_data['delta'] >= '00:46:00') & (online_data['delta'] <= '00:47:00')]

        # Calculation of the CO2 evolution rate
        CER = selected_data['CO2 (Vol.%)'] * 10 - 0.04 * 10  # unit [(mol_co2/mol_totalgas)/min] / [%CO2/min]

        # Reset the selected time so it starts from time = 0, convert it and then use it to calculate tCER
        selected_time = pd.to_timedelta(selected_data['Time      '])
        selected_time.reset_index(inplace=True, drop=True)
        reset_selected_time = selected_time - selected_time[0]
        selected_datetimes = pd.to_datetime(reset_selected_time)
        selected_time = selected_datetimes.dt.time

        # convert time to decimals and in minutes
        selected_time_decimals = pd.DataFrame(columns=['Time'])
        for i in range(0, len(selected_time)):
            h = selected_time[i].strftime('%H')
            m = selected_time[i].strftime('%M')
            s = selected_time[i].strftime('%S')
            result = int(h) * 60 + int(m) + int(s) / 60.0  # [min]
            selected_time_decimals.loc[
                i, ['Time']] = result  # This puts the results in the iterated indexes in the Time column

        # Calculate tCER
        CER.reset_index(inplace=True, drop=True)

        selected_time_decimals = selected_time_decimals.iloc[:, 0]

        tCER = []
        tCER.append(0)  # Here set the initial value of tCER if we have that.

        for i in range(0, (len(selected_time_decimals) - 1)):

            tCER_i = ((CER[i] + CER[i + 1]) / 2) * (selected_time_decimals[i + 1] - selected_time_decimals[i]) + tCER[i]
            tCER.append(tCER_i)

        mu = CER / tCER  # [1/min]
        mu = (mu*60)  # [1/h]

        selected_time_decimals_hours = selected_time_decimals / 60

        r = batch_model_mu()
        r.timeCourseSelections = ['time', 'glucose', 'serine', 'biomass', 'mu']

        start_time = selected_time_decimals_hours[0]
        end_time = selected_time_decimals_hours.iloc[1]
        results = r.simulate(start_time, end_time, 2)

        # we probably did'nt have to simulate since we just want the first row.
        # But it makes it easier to make the data frame
        initial_values = results[0:1]
        data_frame = pd.DataFrame(initial_values)
        data_frame.columns = ['time', 'glucose', 'serine', 'biomass', 'mu']


        for i in range(0, (len(mu) - 1)):
            r.reset()
            r.mu = mu[i + 1]
            glucose = data_frame['glucose'].iloc[-1]
            serine = data_frame['serine'].iloc[-1]
            biomass = data_frame['biomass'].iloc[-1]
            start_time = datetime.now()
            alpha_online, beta_online = parameter_estimation_online(filename_experimental_data1,
                                                                    filename_experimental_data2,
                                                                    alpha_lower_bound, alpha_upper_bound,
                                                                    beta_lower_bound, beta_upper_bound,
                                                                    str(mu[i + 1]), str(glucose), str(serine),
                                                                    str(biomass), model_for_parest)
            end_time = datetime.now()
            print('Duration: {}'.format(end_time - start_time))

            r.glucose = glucose
            r.biomass = biomass
            r.serine = serine
            r.alpha = float(alpha_online)
            r.beta = float(beta_online)
            start_time = selected_time_decimals_hours[i]
            end_time = selected_time_decimals_hours[i + 1]
            results = r.simulate(start_time, end_time, 2)
            simulated_row = results[-1:]
            print(simulated_row)
            new_dataframe = pd.DataFrame(simulated_row)
            new_dataframe.columns = ['time', 'glucose', 'serine', 'biomass', 'mu']
            data_frame = data_frame.append(new_dataframe, ignore_index=True)

        data_frame['CO2'] = selected_data['CO2 (Vol.%)'].values
        data_frame.to_csv('output/' + output, index=False)

        print(data_frame)

        #global data_frame

    watch_file = 'data/MUX_09-03-2018_18-38-27.XLS'
    watcher = Watcher(watch_file, custom_action, text=watch_file)  # also call custom action function
    watcher.watch()  # start the watch going


