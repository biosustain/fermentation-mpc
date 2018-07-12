import pandas as pd
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
from functions_onlinedata import online
from models import batch_model
from models import fed_batch_model
from experiments import data
from parest_copasi import parameter_estimation
import os
import sys
import time
import datetime
#from datetime import datetime, date
import numpy as np
from plotly import tools
import plotly
import plotly.graph_objs as go
import tellurium as te
from models import batch_model_mu


# #Simulate the model
#
# #Choose either batch_model or fed_batch
# r = batch_model()
#
# # We can set the lists so it has the same order as the data
# r.timeCourseSelections = ['time', 'glucose', 'serine', 'biomass', 'mu']
#
# results = r.simulate(2, 23.5, 100)
# print(results)
#
# print(results)
#
# # Load the experimental dataset
#
# #Experimental dataset 1
#
# experimental_data = pd.read_csv('R2_data_in_moles.csv')
# experimental_data = data(experimental_data)
#
# experimental_data2 = pd.read_csv('R1_data_in_moles.csv')
# experimental_data2 = data(experimental_data2)
#
# print(experimental_data)
# print(experimental_data2)
#
#
# # # Plot of the results from the model and the experimental data
# plt.figure(num=None, figsize=(10, 7), dpi=80, facecolor='w', edgecolor='k')
#
# plt.subplot(3, 2, 1)
# plt.plot(results[:, 0], (results[:, 3]))
# plt.scatter(experimental_data['Time (hours)'], experimental_data['C-mol-Biomass'])
# plt.scatter(experimental_data2['Time (hours)'], experimental_data2['C-mol-Biomass'])
# plt.legend(['Biomass from model', 'Biomass from data'], loc='upper left')
#
# plt.subplot(2, 2, 2)
# plt.plot(results[:, 0], results[:, 2])
# plt.scatter(experimental_data['Time (hours)'], experimental_data['mol-Serine'])
# plt.scatter(experimental_data2['Time (hours)'], experimental_data2['mol-Serine'])
# plt.legend(['Serine from model', 'Serine from data'], loc='upper left')
#
# plt.subplot(2, 2, 3)
# plt.plot(results[:, 0], results[:, 1])
# plt.scatter(experimental_data['Time (hours)'], experimental_data['mol-Glucose'])
# plt.scatter(experimental_data2['Time (hours)'], experimental_data2['mol-Glucose'])
# plt.legend(['Glucose from model', 'Glucose from data'], loc='upper left')
#
#
# plt.show()
#
#
# # Parameter estimation
#
# # Set filename of the two experimental datasets
# filename_experimental_data1 = "R1_data_in_moles.csv"
# filename_experimental_data2 = "R2_data_in_moles.csv"
#
# # Set lower and upper bounds
# alpha_lower_bound = "0"
# alpha_upper_bound = "100"
# beta_lower_bound = "0"
# beta_upper_bound = "100"
# kc_lower_bound = "0"
# kc_upper_bound = "100"
# mu_max_lower_bound = "0"
# mu_max_upper_bound = "100"
#
#
# alpha, beta, kc, mu_max = parameter_estimation(filename_experimental_data1, filename_experimental_data2,
#                                                alpha_lower_bound, alpha_upper_bound,
#                                                beta_lower_bound, beta_upper_bound,
#                                                kc_lower_bound, kc_upper_bound,
#                                                mu_max_lower_bound, mu_max_upper_bound)
#
# print(alpha, beta, kc, mu_max)
#
# r = batch_model()
# r.alpha = float(alpha)
# r.beta = float(beta)
# r.kc = float(kc)
# r.mu_max = float(mu_max)
# #r.mu = 10 #np.random.uniform(1,50,100)
# r.timeCourseSelections = ['time', 'glucose', 'serine', 'biomass', 'mu']
# results = r.simulate(2, 23.5, 100)
# print(results)
# # Update model with optimized parameters
#
#
# # Plot of the results from the model and the experimental data
# plt.figure(num=None, figsize=(10, 7), dpi=80, facecolor='w', edgecolor='k')
#
# plt.subplot(3, 2, 1)
# plt.plot(results[:, 0], (results[:, 3]))
# plt.scatter(experimental_data['Time (hours)'], experimental_data['C-mol-Biomass'])
# plt.scatter(experimental_data2['Time (hours)'], experimental_data2['C-mol-Biomass'])
# plt.legend(['Biomass from model', 'Biomass from data'], loc='upper left')
#
# plt.subplot(2, 2, 2)
# plt.plot(results[:, 0], results[:, 2])
# plt.scatter(experimental_data['Time (hours)'], experimental_data['mol-Serine'])
# plt.scatter(experimental_data2['Time (hours)'], experimental_data2['mol-Serine'])
# plt.legend(['Serine from model', 'Serine from data'], loc='upper left')
#
# plt.subplot(2, 2, 3)
# plt.plot(results[:, 0], results[:, 1])
# plt.scatter(experimental_data['Time (hours)'], experimental_data['mol-Glucose'])
# plt.scatter(experimental_data2['Time (hours)'], experimental_data2['mol-Glucose'])
# plt.legend(['Glucose from model', 'Glucose from data'], loc='upper left')
#
#
# plt.show()

# print(np.random.uniform(-1, 0, 1))
# print(type(np.random.uniform(-1, 0, 1)))
# print(2)
# print(type(2))
#
#
# a = batch_model_mu()
# #values = np.random.uniform(-1, 0, 1) # np.linspace(start=10, stop=11, num=1) #1
# a.mu = 1.5 #values
# a.timeCourseSelections = ['time', 'glucose', 'serine', 'biomass']
# aresults = a.simulate(2, 23.5, 100)
# print(aresults)


#a = batch_model_mu()
#mu = np.random.uniform(-1, 0, 1)
#a.mu = mu.astype(float)
#a.timeCourseSelections = ['time', 'glucose', 'serine', 'biomass', 'mu']
#aresults = a.simulate(2, 23.5, 1)

# a = batch_model_mu()
# a.mu = np.random.uniform(-1,0,2)
# a.timeCourseSelections = ['time', 'glucose', 'serine', 'biomass', 'mu']
# aresults = a.simulate(2, 23.5, 2)
# print(aresults)


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


# Call this function each time a change happens
def custom_action(text):

    online_data = pd.ExcelFile(watch_file)
    online_data = online_data.parse('Sheet1')

    # Figure out the timedifference, so we can select all the data that corresponds to 1 reactor
    time = pd.to_timedelta(online_data['Time      '])
    shifted_time = time.shift(periods=-1)
    delta = shifted_time - time
    online_data['delta'] = delta

    # Select the rows and create new dataframe that we will be working with
    selected_data = online_data[(online_data['delta'] >= '00:46:00') & (online_data['delta'] <= '00:47:00')]

    # Calculation of the CO2 evolution rate
    CER = selected_data['CO2 (Vol.%)'] * 10 - 0.04 * 10  # unit [(mol_co2/mol_totalgas)/h]

    # Reset the selected time, convert it and then use it to calculate tCER
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
        result = int(h) * 60 + int(m) + int(s) / 60.0 # [min]
        selected_time_decimals.loc[
            i, ['Time']] = result  # This puts the results in the iterated indexes in the Time column

    # Calculate tCER

    # Shift the values so it corresponds to "next value" of selected_time_decimals
    shifted_selected_time_decimals = selected_time_decimals.shift(periods=-1)

    # Same with CO2 so it corresponds to "next value" of CER
    CER.reset_index(inplace=True, drop=True)
    shifted_CER = CER.shift(periods=-1)

    # Convert to series
    shifted_selected_time_decimals = shifted_selected_time_decimals.T.squeeze()
    selected_time_decimals = selected_time_decimals.T.squeeze()

    tCER = ((CER + shifted_CER) / 2) * (shifted_selected_time_decimals - selected_time_decimals)
    mu = CER / tCER
    mu = (mu / 60) #[1/h]


    selected_time_decimals_hours = selected_time_decimals/60


    r = batch_model_mu()
    r.mu = mu[0]
    r.timeCourseSelections = ['time', 'glucose', 'serine', 'biomass', 'mu']

    starttime = selected_time_decimals_hours[0]
    endtime = selected_time_decimals_hours.iloc[1]
    results = r.simulate(starttime, endtime, 2)

    print(results)
    # we probably didnt have to simulate since we just want the first row. But it makes it easier to make the dataframe
    initialvalues = results[0:1]
    dataframe = pd.DataFrame(initialvalues)
    dataframe.columns = ['time', 'glucose', 'serine', 'biomass', 'mu']

    print(dataframe)
    print(selected_time_decimals_hours)

    for i in range(0, (len(mu) - 2)):
        r.reset()
        r.mu = mu[i+1]
        starttime = selected_time_decimals_hours[i]
        endtime = selected_time_decimals_hours[i + 1]
        results = r.simulate(starttime, endtime, 2)
        simulated_row = results[-1:]
        print(simulated_row)
        new_dataframe = pd.DataFrame(simulated_row)
        new_dataframe.columns = ['time', 'glucose', 'serine', 'biomass', 'mu']
        dataframe = dataframe.append(new_dataframe, ignore_index=True)
        print(mu)
        print(results)
        print(simulated_row)
        print(dataframe)
        print(i)


    print(dataframe)




    trace1 = go.Scatter(
        x=selected_time_decimals / 60,
        y=selected_data['CO2 (Vol.%)']
    )

    trace2 = go.Scatter(
        x=selected_time_decimals / 60,
        y=mu
    )

    trace3 = go.Scatter(
        x=dataframe['time'],
        y=dataframe['mu']
    )

    trace4 = go.Scatter(
        x=dataframe['time'],
        y=dataframe['biomass']
    )

    trace5 = go.Scatter(
        x=dataframe['time'],
        y=dataframe['serine']
    )

    trace6 = go.Scatter(
        x=dataframe['time'],
        y=dataframe['glucose']
    )

    fig = tools.make_subplots(rows=2, cols=3, subplot_titles=('CO2 online data', 'mu from CO2',
                                                              'mu from model', 'Biomass from model',
                                                              'Serine from model', 'Glucose from model'))

    fig.append_trace(trace1, 1, 1)
    fig.append_trace(trace2, 1, 2)
    fig.append_trace(trace3, 1, 3)
    fig.append_trace(trace4, 2, 1)
    fig.append_trace(trace5, 2, 2)
    fig.append_trace(trace6, 2, 3)

    fig['layout'].update(height=800, width=1400, title='Model prediction')

    plotly.offline.plot(fig)



watch_file = 'MUX_09-03-2018_18-38-27.XLS'

# watcher = Watcher(watch_file)  # simple
watcher = Watcher(watch_file, custom_action, text=watch_file)  # also call custom action function
watcher.watch()  # start the watch going






