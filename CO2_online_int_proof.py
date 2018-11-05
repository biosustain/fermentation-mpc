import pandas as pd
from time_converter_function import time_to_decimals
import numpy as np
from models import fed_batch_model_mu
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
from parest_copasi import parameter_estimation
from parest_copasi import parameter_estimation_online
import os
import sys
import time
from plotly import tools
import plotly
import plotly.graph_objs as go
from models import fed_batch_model
from parest_copasi import parameter_estimation_online_fedbatch

#
#
#
# watch_file = pd.read_csv('data/SER_C016_Reactor24_4g-LGlycine_0,02FeedRate.csv')
# online_data = watch_file
#
# online_data = (time_to_decimals(online_data))
# online_data['Time (hours)'] = online_data['Time (min)']/60
#
# # Set filename of the two experimental datasets
# R23_amounts = pd.read_csv("Preprocess/estimation/fedbatch_amounts/R23_amounts.csv")
# R24_amounts = pd.read_csv("Preprocess/estimation/fedbatch_amounts/R24_amounts.csv")
#
#
# print(online_data)
#
#
# data_frame_selected_values = online_data[np.isfinite(online_data['Bioreactor 24 - CER'])]
# data_frame_selected_values.reset_index(inplace=True, drop=True)
#
# # Reset the time, so the first values corresponds to time 0
# data_frame_selected_values = data_frame_selected_values.copy()
# data_frame_selected_values['Time (hours)'] = data_frame_selected_values['Time (hours)'] - \
#                                            data_frame_selected_values['Time (hours)'][0]
#
# tCER = []
# tCER.append(0)  # Here set the initial value of tCER if you have that.
#
# for i in range(0, (len(data_frame_selected_values['Time (hours)']) - 1)):
#     tCER_i = ((data_frame_selected_values['Bioreactor 24 - CER'][i] +
#                data_frame_selected_values['Bioreactor 24 - CER'][i + 1]) / 2) * (
#                          data_frame_selected_values['Time (hours)'][i + 1] - data_frame_selected_values['Time (hours)'][
#                      i]) + tCER[i]  # [CO2 %]
#     tCER.append(tCER_i)
#
# mu = data_frame_selected_values['Bioreactor 24 - CER'] / tCER  # [1/h]
#
#
# print(mu)
# print(data_frame_selected_values)
#
# r = fed_batch_model_mu()
#
#
# start_time = data_frame_selected_values['Time (hours)'][25:67][25]
# end_time = data_frame_selected_values['Time (hours)'][25:67][26]
#
# r.timeCourseSelections = ['time','glucose','biomass','serine','mu']
#
# results = r.simulate(start_time, end_time, 2)
#
#
# initial_values = results[0:1]
# data_frame = pd.DataFrame(initial_values)
# data_frame.columns = ['time', 'glucose', 'biomass', 'serine', 'mu']
# mu[25:67] = mu[25:67]*1.0157664644714879
#
# for i in range(25, 66):
#     r.mu = mu[25:][i + 1]
#     glucose = data_frame['glucose'].iloc[-1]
#     serine = data_frame['serine'].iloc[-1]
#     biomass = data_frame['biomass'].iloc[-1]
#
#     start_time = data_frame_selected_values['Time (hours)'][25:][i]
#     end_time = data_frame_selected_values['Time (hours)'][25:][i + 1]
#     results = r.simulate(start_time, end_time, 2)
#
#     simulated_row = results[-1:]
#     new_dataframe = pd.DataFrame(simulated_row)
#     new_dataframe.columns = ['time', 'glucose', 'biomass', 'serine', 'mu']
#     data_frame = data_frame.append(new_dataframe, ignore_index=True)
#
# print(data_frame)
# data_frame.to_csv('output/output_test.csv')
#
#
# # Plot of the results from the model and the experimental data
# plt.figure(num=None, figsize=(11, 7), dpi=90, facecolor='w', edgecolor='k')
# plt.suptitle('Plot of compounds', fontsize=16)
#
# plt.subplot(2, 2, 1)
# plt.plot(data_frame['time'], data_frame['biomass'])
# plt.scatter(R23_amounts['Time (hours)'][:5], R23_amounts['Biomass (g)'][:5])
# plt.scatter(R24_amounts['Time (hours)'][:5], R24_amounts['Biomass (g)'][:5])
# plt.legend(['Biomass from model', 'Biomass from data'], loc='upper left')
# plt.xlabel('Time (hours)')
# plt.ylabel('Biomass (g)')
#
# plt.subplot(2, 2, 2)
# plt.plot(data_frame['time'], data_frame['serine'])
# plt.scatter(R23_amounts['Time (hours)'][:5], R23_amounts['Serine (g)'][:5])
# plt.scatter(R24_amounts['Time (hours)'][:5], R24_amounts['Serine (g)'][:5])
# plt.legend(['Serine from model', 'Serine from data'], loc='upper left')
# plt.xlabel('Time (hours)')
# plt.ylabel('Serine (mole)')
#
# plt.subplot(2, 2, 3)
# plt.plot(data_frame['time'], data_frame['glucose'])
# plt.scatter(R23_amounts['Time (hours)'][:5], R23_amounts['Glucose (g)'][:5])
# plt.scatter(R24_amounts['Time (hours)'][:5], R24_amounts['Glucose (g)'][:5])
# plt.legend(['Glucose from model', 'Glucose from data'], loc='upper right')
# plt.xlabel('Time (hours)')
# plt.ylabel('Glucose (g)')
#
# plt.show()





# Online data and real time simulation
#
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
    online_data = pd.read_csv(watch_file)

    online_data = (time_to_decimals(online_data))
    online_data['Time (hours)'] = online_data['Time (min)']/60

    # Set filename of the two experimental datasets
    R23_amounts = pd.read_csv("Preprocess/estimation/fedbatch_amounts/R23_amounts.csv")
    R24_amounts = pd.read_csv("Preprocess/estimation/fedbatch_amounts/R24_amounts.csv")



    data_frame_selected_values = online_data[np.isfinite(online_data['Bioreactor 24 - CER'])]
    data_frame_selected_values.reset_index(inplace=True, drop=True)

    # Reset the time, so the first values corresponds to time 0
    data_frame_selected_values = data_frame_selected_values.copy()
    data_frame_selected_values['Time (hours)'] = data_frame_selected_values['Time (hours)'] - \
                                               data_frame_selected_values['Time (hours)'][0]

    tCER = []
    tCER.append(0)  # Here set the initial value of tCER if you have that.

    for i in range(0, (len(data_frame_selected_values['Time (hours)']) - 1)):
        tCER_i = ((data_frame_selected_values['Bioreactor 24 - CER'][i] +
                   data_frame_selected_values['Bioreactor 24 - CER'][i + 1]) / 2) * (
                             data_frame_selected_values['Time (hours)'][i + 1] - data_frame_selected_values['Time (hours)'][
                         i]) + tCER[i]  # [CO2 %]
        tCER.append(tCER_i)

    mu = data_frame_selected_values['Bioreactor 24 - CER'] / tCER  # [1/h]


    r = fed_batch_model_mu()


    start_time = data_frame_selected_values['Time (hours)'][25:67][25]
    end_time = data_frame_selected_values['Time (hours)'][25:67][26]

    # Make fake data

    r.timeCourseSelections = ['time','glucose','biomass','serine','mu']

    results = r.simulate(start_time, end_time, 2)


    initial_values = results[0:1]
    data_frame = pd.DataFrame(initial_values)
    data_frame.columns = ['time', 'glucose', 'biomass', 'serine', 'mu']
    mu[25:67] = mu[25:67]*1.0157664644714879


    # Some of the inputs for the parameter_estimation_online function
    for i in range(25, 66): # lav 30 om til 66
        r.mu = mu[25:][i + 1]
        glucose = data_frame['glucose'].iloc[-1]
        serine = data_frame['serine'].iloc[-1]
        biomass = data_frame['biomass'].iloc[-1]

        start_time = data_frame_selected_values['Time (hours)'][25:][i]
        end_time = data_frame_selected_values['Time (hours)'][25:][i + 1]
        results = r.simulate(start_time, end_time, 2)

        simulated_row = results[-1:]
        new_dataframe = pd.DataFrame(simulated_row)
        new_dataframe.columns = ['time', 'glucose', 'biomass', 'serine', 'mu']
        data_frame = data_frame.append(new_dataframe, ignore_index=True)

    data_frame.columns = ['Time (hours)','Glucose (g)','Biomass (g)','Serine (g)','mu']
    data_frame[['Time (hours)','Glucose (g)','Biomass (g)','Serine (g)']].to_csv('parameter_estimation/output_test.csv')

    print(data_frame)
    experimental_data1 = 'parameter_estimation/output_test.csv'

    parameter_1_lower_bound = "0"
    parameter_1_upper_bound = "10"
    parameter_2_lower_bound = "0"
    parameter_2_upper_bound = "10"
    parameter_3_lower_bound = "0"
    parameter_3_upper_bound = "10"
    parameter_4_lower_bound = "0"
    parameter_4_upper_bound = "10"
    parameter_5_lower_bound = "0"
    parameter_5_upper_bound = "10000000"
    parameter_6_lower_bound = "0"
    parameter_6_upper_bound = "10"
    parameter_7_lower_bound = "0"
    parameter_7_upper_bound = "10"

    model_for_parest = 'online_fedmodel'

    #  mu_max
    alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max = parameter_estimation_online_fedbatch(experimental_data1,
                                             parameter_1_lower_bound, parameter_1_upper_bound,
                                             parameter_2_lower_bound, parameter_2_upper_bound,
                                             parameter_3_lower_bound, parameter_3_upper_bound,
                                             parameter_4_lower_bound, parameter_4_upper_bound,
                                             parameter_5_lower_bound, parameter_5_upper_bound,
                                             parameter_6_lower_bound, parameter_6_upper_bound,
                                             parameter_7_lower_bound, parameter_7_upper_bound,
                                             model_for_parest, '1', str(len(data_frame)))

    # Model simulation (change the time to be from the end of time [-1] and then just + 10 hours or something
    # Update model with optimized parameters

    print(alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max, "YEEES")

    f = fed_batch_model()

    f.alpha = float(alpha)
    f.beta = float(beta)
    f.Ks_qs = float(Ks_qs)
    f.qs_max = float(qs_max)
    f.Ki = float(Ki)
    f.Ks = float(Ks)
    f.mu_max = float(mu_max)
    f.reset()
    f.timeCourseSelections = ['time','glucose','biomass','serine','mu']
    fresults = f.simulate(data_frame_selected_values['Time (hours)'][25:67][25], data_frame_selected_values['Time (hours)'][66 + 10], 100)


    trace1 = go.Scatter(
        x=data_frame['Time (hours)'],
        y=data_frame['Biomass (g)'],
        name='Biomass',
        mode='markers'
    )

    trace2 = go.Scatter(
        x=data_frame['Time (hours)'],
        y=data_frame['Serine (g)'],
        name='Serine',
        mode='markers'
    )

    trace3 = go.Scatter(
        x=data_frame['Time (hours)'],
        y=data_frame['Glucose (g)'],
        name='Glucose',
        mode='markers'
    )

    trace4 = go.Scatter(
        x=fresults[:,0],
        y=fresults[:,2],
        name='Biomass',
        mode='lines'
    )

    trace5 = go.Scatter(
        x=fresults[:,0],
        y=fresults[:,3],
        name='Serine',
        mode='lines'
    )

    trace6 = go.Scatter(
        x=fresults[:,0],
        y=fresults[:,1],
        name='Glucose',
        mode='lines'
    )


    fig = tools.make_subplots(rows=2, cols=3, subplot_titles=('Biomass from model', 'Serine from model', 'Glucose from model'))


    fig.append_trace(trace1, 1, 1)
    fig.append_trace(trace4, 1, 1)

    fig.append_trace(trace2, 1, 2)
    fig.append_trace(trace5, 1, 2)

    fig.append_trace(trace3, 1, 3)
    fig.append_trace(trace6, 1, 3)


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


    fig['layout']['yaxis1'].update(showgrid=True, title='Biomass (g)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])
    fig['layout']['yaxis2'].update(showgrid=True, title='Serine (g)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])
    fig['layout']['yaxis3'].update(showgrid=True, title='Glucose (g)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])


    fig['layout']['xaxis1'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0, 0.27])
    fig['layout']['xaxis2'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.36, 0.63])
    fig['layout']['xaxis3'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.72, 0.99])

    plotly.offline.plot(fig)


watch_file = 'data/SER_C016_Reactor24_4g-LGlycine_0,02FeedRate.csv'
watcher = Watcher(watch_file, custom_action, text=watch_file)  # also call custom action function
watcher.watch()  # start the watch going