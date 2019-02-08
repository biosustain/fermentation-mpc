import pandas as pd
from time_converter_function import time_to_decimals
import numpy as np
from models import fed_batch_model_mu
import matplotlib
matplotlib.use('TkAgg')
import os
import sys
import time
from plotly import tools
import plotly
import plotly.graph_objs as go
from models import fed_batch_model
from parest_copasi import parameter_estimation_online_fedbatch



# watch_file = 'data/test.csv'
# online_data = pd.read_csv(watch_file)
# print(online_data)



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
    online_data = pd.read_csv(watch_file)

    print(online_data)

    # Time from online data is converted to decimals so calculations are possible to make
    online_data = (time_to_decimals(online_data))
    online_data['Time (hours)'] = online_data['Time (min)']/60

    R24_amounts = pd.read_csv("Preprocess/estimation/fedbatch_amounts/R24_amounts.csv")

    # Use only data from which CER begins
    data_frame_selected_values = online_data[np.isfinite(online_data['Bioreactor 24 - CER'])]
    data_frame_selected_values.reset_index(inplace=True, drop=True)

    # Reset the time, so the first values corresponds to time 0
    data_frame_selected_values = data_frame_selected_values.copy()
    data_frame_selected_values['Time (hours)'] = data_frame_selected_values['Time (hours)'] - \
                                               data_frame_selected_values['Time (hours)'][0]

    tCER = []
    tCER.append(0)  # Here set the initial value of tCER if you have that.

    # Calculations of the integrated CER = tCER.
    for i in range(0, (len(data_frame_selected_values['Time (hours)']) - 1)):
        tCER_i = ((data_frame_selected_values['Bioreactor 24 - CER'][i] +
                   data_frame_selected_values['Bioreactor 24 - CER'][i + 1]) / 2) * (
                             data_frame_selected_values['Time (hours)'][i + 1] - data_frame_selected_values['Time (hours)'][
                         i]) + tCER[i]  # [CO2 %]
        tCER.append(tCER_i)

    # Online growth rate calculations from CER and tCER
    mu = data_frame_selected_values['Bioreactor 24 - CER'] / tCER  # [1/h]

    # Load model
    r = fed_batch_model_mu()

    # Remember to change the ones below to be the index of the first and the second first value of fed batch phase
    start_time = data_frame_selected_values['Time (hours)'][25]
    end_time = data_frame_selected_values['Time (hours)'][26]

    # Simulate the data with using growth rate from CER
    r.timeCourseSelections = ['time','glucose','biomass','serine','mu']
    results = r.simulate(start_time, end_time, 2)

    # make the structure of the data frame with initial values, and multiply mu by the scale factor
    initial_values = results[0:1]
    data_frame = pd.DataFrame(initial_values)
    data_frame.columns = ['time', 'glucose', 'biomass', 'serine', 'mu']
    mu = mu*1.1043
    r.mu = 1.1043*mu[25]

    print(mu[25])

    # Simulates all the compounds from the growth rates
    for i in range(25, len(mu)-1):
        r.mu = mu[25:][i + 1]

        start_time = data_frame_selected_values['Time (hours)'][25:][i]
        end_time = data_frame_selected_values['Time (hours)'][25:][i + 1]
        results = r.simulate(start_time, end_time, 2)

        simulated_row = results[-1:]
        new_dataframe = pd.DataFrame(simulated_row)
        new_dataframe.columns = ['time', 'glucose', 'biomass', 'serine', 'mu']
        data_frame = data_frame.append(new_dataframe, ignore_index=True)

    # The simulated data gets written to a file, which is then used for the model prediction to estimate parameters
    data_frame.columns = ['Time (hours)','Glucose (g)','Biomass (g)','Serine (g)','mu']
    data_frame[['Time (hours)','Glucose (g)','Biomass (g)','Serine (g)']].to_csv('parameter_estimation/output.csv')


    # Set the path of the file, so the copasi model can read the data
    experimental_data1 = 'parameter_estimation/output.csv'
    print(experimental_data1)

    # Set bounds for the parameters
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

    model_for_parest = 'online_fedmodel2'


    alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max = parameter_estimation_online_fedbatch(experimental_data1,
                                             parameter_1_lower_bound, parameter_1_upper_bound,
                                             parameter_2_lower_bound, parameter_2_upper_bound,
                                             parameter_3_lower_bound, parameter_3_upper_bound,
                                             parameter_4_lower_bound, parameter_4_upper_bound,
                                             parameter_5_lower_bound, parameter_5_upper_bound,
                                             parameter_6_lower_bound, parameter_6_upper_bound,
                                             parameter_7_lower_bound, parameter_7_upper_bound,
                                             model_for_parest, '1', str(len(data_frame)))


    # Update model with optimized parameters

    print(alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max)

    # Input the estimated parameters into the fed batch model
    f = fed_batch_model()

    f.alpha = float(alpha)
    f.beta = float(beta)
    f.Ks_qs = float(Ks_qs)
    f.qs_max = float(qs_max)
    f.Ki = float(Ki)
    f.Ks = float(Ks)
    f.mu_max = float(mu_max)

    f.timeCourseSelections = ['time','glucose','biomass','serine','mu']

    # Simulate the model into future time points
    print(data_frame_selected_values['Time (hours)'])
    fresults = f.simulate(data_frame_selected_values['Time (hours)'][25], data_frame_selected_values['Time (hours)'].iloc[-1]+5, 100)


    trace1 = go.Scatter(
        x=data_frame['Time (hours)'],
        y=data_frame['Biomass (g)'],
        name='Biomass estimated from model based on CER',
        mode='markers'
    )

    trace2 = go.Scatter(
        x=data_frame['Time (hours)'],
        y=data_frame['Serine (g)'],
        name='Serine estimated from model based on CER',
        mode='markers'
    )

    trace3 = go.Scatter(
        x=data_frame['Time (hours)'],
        y=data_frame['Glucose (g)'],
        name='Glucose estimated from model based on CER',
        mode='markers'
    )

    trace4 = go.Scatter(
        x=fresults[:,0],
        y=fresults[:,2],
        name='Biomass from predictive model',
        mode='lines'
    )

    trace5 = go.Scatter(
        x=fresults[:,0],
        y=fresults[:,3],
        name='Serine estimated from predictive model',
        mode='lines'
    )

    trace6 = go.Scatter(
        x=fresults[:,0],
        y=fresults[:,1],
        name='Glucose estimated from predictive model',
        mode='lines'
    )

    trace7 = go.Scatter(
        x=R24_amounts['Time (hours)'],
        y=R24_amounts['Biomass (g)'],
        name='Biomass from experiment R24',
        mode='markers'
    )

    trace8 = go.Scatter(
        x=R24_amounts['Time (hours)'],
        y=R24_amounts['Serine (g)'],
        name='Serine from experiment R24',
        mode='markers'
    )

    trace9 = go.Scatter(
        x=R24_amounts['Time (hours)'],
        y=R24_amounts['Glucose (g)'],
        name='Glucose from experiment R24',
        mode='markers'
    )

    trace10 = go.Scatter(
        x=data_frame_selected_values['Time (hours)'],
        y=data_frame_selected_values['Bioreactor 24 - CER'],
        name='CER (online data)',
        mode='markers'
    )


    fig = tools.make_subplots(rows=2, cols=2, subplot_titles=('CER data', 'Biomass from model', 'Serine from model', 'Glucose from model'))

    fig.append_trace(trace10, 1, 1)

    fig.append_trace(trace1, 1, 2)
    fig.append_trace(trace4, 1, 2)
    fig.append_trace(trace7, 1, 2)

    fig.append_trace(trace2, 2, 1)
    fig.append_trace(trace5, 2, 1)
    fig.append_trace(trace8, 2, 1)

    fig.append_trace(trace3, 2, 2)
    fig.append_trace(trace6, 2, 2)
    fig.append_trace(trace9, 2, 2)


    fig['layout'].update(title='Model prediction', #height=820, width=1420,
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


    fig['layout']['yaxis1'].update(showgrid=True, title='CER (CO2 % per hour)', exponentformat='power')
    fig['layout']['yaxis2'].update(showgrid=True, title='Biomass (g)', exponentformat='power')
    fig['layout']['yaxis3'].update(showgrid=True, title='Serine (g)', exponentformat='power')
    fig['layout']['yaxis4'].update(showgrid=True, title='Glucose (g)', exponentformat='power')
    fig['layout']['xaxis1'].update(showgrid=True, title='Time (hours)')
    fig['layout']['xaxis2'].update(showgrid=True, title='Time (hours)')
    fig['layout']['xaxis3'].update(showgrid=True, title='Time (hours)')
    fig['layout']['xaxis4'].update(showgrid=True, title='Time (hours)')

    fig['layout'].update(font=dict(size=16))

    plotly.offline.plot(fig)


watch_file = 'data/out.csv'
watcher = Watcher(watch_file, custom_action, text=watch_file)  # also call custom action function
watcher.watch()  # start the watch going