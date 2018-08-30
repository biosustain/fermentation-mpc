import warnings
warnings.filterwarnings("ignore", message="numpy.dtype size changed")
warnings.filterwarnings("ignore", message="numpy.ufunc size changed")

import pandas as pd
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
from models import batch_model
from experiments import data
from parest_copasi import parameter_estimation
from parest_copasi import parameter_estimation_online
import os
import sys
import time
from plotly import tools
import plotly
import plotly.graph_objs as go
from models import batch_model_mu


#  Simulate the model

# Choose either batch_model or fed_batch
r = batch_model()
r.exportToSBML('models/batch.xml')

# We can set the lists so it has the same order as the data
r.timeCourseSelections = ['time', 'glucose', 'serine', 'biomass', 'V']

results = r.simulate(2, 23.5, 100)

#print(results)


#  Load the experimental data set

# Set filename of the two experimental datasets
filename_experimental_data1 = "parameter_estimation/R1_data_in_moles.csv"
# filename_experimental_data2 = "parameter_estimation/R2_data_in_moles.csv"
#
# # Experimental data set 1
experimental_data = pd.read_csv(filename_experimental_data1)
experimental_data = data(experimental_data)
#
# # Experimental data set 2
# experimental_data2 = pd.read_csv(filename_experimental_data2)
# experimental_data2 = data(experimental_data2)


# Plot of the results from the model and the experimental data
plt.figure(num=None, figsize=(11, 7), dpi=90, facecolor='w', edgecolor='k')
plt.suptitle('Plot of compounds', fontsize=16)

plt.subplot(2, 2, 1)
plt.plot(results[:, 0], (results[:, 3]))
plt.scatter(experimental_data['Time (hours)'], experimental_data['C-mol-Biomass'])
#plt.scatter(experimental_data2['Time (hours)'], experimental_data2['C-mol-Biomass'])
plt.legend(['Biomass from model', 'Biomass from data'], loc='upper left')
plt.xlabel('Time (hours)')
plt.ylabel('Biomass (c-mole)')

plt.subplot(2, 2, 2)
plt.plot(results[:, 0], results[:, 2])
plt.scatter(experimental_data['Time (hours)'], experimental_data['mol-Serine'])
#plt.scatter(experimental_data2['Time (hours)'], experimental_data2['mol-Serine'])
plt.legend(['Serine from model', 'Serine from data'], loc='upper left')
plt.xlabel('Time (hours)')
plt.ylabel('Serine (mole)')

plt.subplot(2, 2, 3)
plt.plot(results[:, 0], results[:, 1])
plt.scatter(experimental_data['Time (hours)'], experimental_data['mol-Glucose'])
#plt.scatter(experimental_data2['Time (hours)'], experimental_data2['mol-Glucose'])
plt.legend(['Glucose from model', 'Glucose from data'], loc='upper left')
plt.xlabel('Time (hours)')
plt.ylabel('Glucose (mole)')

plt.show()

#
# #  Parameter estimation
#
# # Set lower and upper bounds
# alpha_lower_bound = "0"
# alpha_upper_bound = "10000"
# beta_lower_bound = "0"
# beta_upper_bound = "10000"
# kc_lower_bound = "0"
# kc_upper_bound = "100"
# mu_max_lower_bound = "0"
# mu_max_upper_bound = "100"
#
# alpha, beta, kc, mu_max = parameter_estimation(filename_experimental_data1, filename_experimental_data2,
#                                                alpha_lower_bound, alpha_upper_bound,
#                                                beta_lower_bound, beta_upper_bound,
#                                                kc_lower_bound, kc_upper_bound,
#                                                mu_max_lower_bound, mu_max_upper_bound)
#
# #  Update model with optimized parameters
# r = batch_model()
# r.alpha = float(alpha)
# r.beta = float(beta)
# r.kc = float(kc)
# r.mu_max = float(mu_max)
# r.timeCourseSelections = ['time', 'glucose', 'serine', 'biomass', 'mu']
# results = r.simulate(2, 23.5, 100)
#
#
# #  Plot of the results from the model and the experimental data
# plt.figure(num=None, figsize=(10, 7), dpi=80, facecolor='w', edgecolor='k')
# plt.suptitle('Plot of compounds with updated optimized parameters', fontsize=16)
#
# plt.subplot(2, 2, 1)
# plt.plot(results[:, 0], (results[:, 3]))
# plt.scatter(experimental_data['Time (hours)'], experimental_data['C-mol-Biomass'])
# plt.scatter(experimental_data2['Time (hours)'], experimental_data2['C-mol-Biomass'])
# plt.legend(['Biomass from model', 'Biomass from data'], loc='upper left')
# plt.xlabel('Time (hours)')
# plt.ylabel('Biomass (c-mole)')
#
# plt.subplot(2, 2, 2)
# plt.plot(results[:, 0], results[:, 2])
# plt.scatter(experimental_data['Time (hours)'], experimental_data['mol-Serine'])
# plt.scatter(experimental_data2['Time (hours)'], experimental_data2['mol-Serine'])
# plt.legend(['Serine from model', 'Serine from data'], loc='upper left')
# plt.xlabel('Time (hours)')
# plt.ylabel('Serine (mole)')
#
# plt.subplot(2, 2, 3)
# plt.plot(results[:, 0], results[:, 1])
# plt.scatter(experimental_data['Time (hours)'], experimental_data['mol-Glucose'])
# plt.scatter(experimental_data2['Time (hours)'], experimental_data2['mol-Glucose'])
# plt.legend(['Glucose from model', 'Glucose from data'], loc='upper left')
# plt.xlabel('Time (hours)')
# plt.ylabel('Glucose (mole)')
#
# plt.show()

#
# Online data and real time simulation

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

    mu = CER / tCER
    mu = (mu*60)  # [1/h]

    selected_time_decimals_hours = selected_time_decimals/60

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

    # Some of the inputs for the parameter_estimation_online function
    model_for_parest = 'parameter_estimation/model_mu_1'
    filename_experimental_data1 = "R1_data_in_moles.csv"
    filename_experimental_data2 = "R2_data_in_moles.csv"

    for i in range(0, (len(mu) - 2)):
        r.reset()
        r.mu = mu[i+1]
        glucose = data_frame['glucose'].iloc[-1]
        serine = data_frame['serine'].iloc[-1]
        biomass = data_frame['biomass'].iloc[-1]
        alpha_online, beta_online = parameter_estimation_online(filename_experimental_data1,
                                                                filename_experimental_data2,
                                                                alpha_lower_bound, alpha_upper_bound,
                                                                beta_lower_bound, beta_upper_bound,
                                                                str(mu[i+1]), str(glucose), str(serine),
                                                                str(biomass), model_for_parest)
        r.alpha = float(alpha_online)
        r.beta = float(beta_online)
        start_time = selected_time_decimals_hours[i]
        end_time = selected_time_decimals_hours[i + 1]
        results = r.simulate(start_time, end_time, 2)
        simulated_row = results[-1:]
        new_dataframe = pd.DataFrame(simulated_row)
        new_dataframe.columns = ['time', 'glucose', 'serine', 'biomass', 'mu']
        data_frame = data_frame.append(new_dataframe, ignore_index=True)

    trace1 = go.Scatter(
        x=selected_time_decimals_hours,
        y=selected_data['CO2 (Vol.%)'],
        name='CO2'
    )

    trace2 = go.Scatter(
        x=selected_time_decimals_hours,
        y=mu,
        name='mu'
    )

    trace3 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['mu'],
        name='mu'
    )

    trace4 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['biomass'],
        name='Biomass'
    )

    trace5 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['serine'],
        name='Serine'
    )

    trace6 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['glucose'],
        name='Glucose'
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

    fig['layout'].update(height=820, width=1420, title='Model prediction',
    margin=dict(
            l=110,
            r=1,
            b=100,
            t=110,
            pad=10
        ),
    titlefont=dict(
        family='Arial, sans-serif',
        size=30,
        color='black'
    ))


    fig['layout']['yaxis1'].update(showgrid=True, title='CO2 (%)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0.65, 1])
    fig['layout']['yaxis2'].update(showgrid=True, title='Mu (1/h)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0.65, 1])
    fig['layout']['yaxis3'].update(showgrid=True, title='Mu (1/h)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0.65, 1])
    fig['layout']['yaxis4'].update(showgrid=True, title='Biomass (moles)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])
    fig['layout']['yaxis5'].update(showgrid=True, title='Serine (moles)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])
    fig['layout']['yaxis6'].update(showgrid=True, title='Glucose (moles)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])

    fig['layout']['xaxis1'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0, 0.27])
    fig['layout']['xaxis2'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.36, 0.63])
    fig['layout']['xaxis3'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.72, 0.99])
    fig['layout']['xaxis4'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0, 0.27])
    fig['layout']['xaxis5'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.36, 0.63])
    fig['layout']['xaxis6'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.72, 0.99])

    plotly.offline.plot(fig)


watch_file = 'data/MUX_09-03-2018_18-38-27.XLS'
watcher = Watcher(watch_file, custom_action, text=watch_file)  # also call custom action function
watcher.watch()  # start the watch going





