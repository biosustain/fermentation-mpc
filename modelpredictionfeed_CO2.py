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
from mpfCO2_functions import model_feed_settings
from mpfCO2_functions import model_feed_settings_loop
from pathlib import Path

##### For the automatic feeding approach
# my_file = Path("mu_set.csv")
# mu_set_file = 'mu_set.csv'
#
# try:
#     my_abs_path = my_file.resolve()
#     os.remove(mu_set_file)
# except OSError:
#     pass

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

    # Time from online data is converted to decimals so calculations are possible to make
    online_data = (time_to_decimals(online_data))
    online_data['Time (hours)'] = online_data['Time (min)']/60

    # Set filename of the two experimental datasets
    #R23_amounts = pd.read_csv("Preprocess/estimation/fedbatch_amounts/R23_amounts.csv")
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

    # Remember to change the ones below to be the first and the second first value of fed batch phase
    start_time = data_frame_selected_values['Time (hours)'][25]
    end_time = data_frame_selected_values['Time (hours)'][26]


    # Make fake data

    # Simulate the data with using growth rate from CER
    r.timeCourseSelections = ['time','glucose','biomass','serine','mu', 'V']
    results = r.simulate(start_time, end_time, 2)

    # make the structure of the data frame with initial values, and multiply mu by the scale factor
    initial_values = results[0:1]
    data_frame = pd.DataFrame(initial_values)
    data_frame.columns = ['time', 'glucose', 'biomass', 'serine', 'mu', 'V']
    mu = mu*1.1043
    r.mu = 1.1043*mu[25]

    ##### For the automatic feeding approach
    # try:
    #     my_abs_path = my_file.resolve()
    #     mu_set_opdated = pd.read_csv('mu_set.csv')
    #     print(mu_set_opdated)
    #     #print(mu_set_opdated['mu_set'].values, 'hello')
    #
    #     mu_set_opdated = float(mu_set_opdated['mu_set'].values)
    #     r.mu_set = mu_set_opdated
    #     print(r.mu_set)
    #
    # except OSError:
    #     pass

    # Simulates all the compounds from the growth rates
    for i in range(25, len(mu)-1): # lav 30 om til 66

        r.mu = mu[25:][i + 1]

        start_time = data_frame_selected_values['Time (hours)'][25:][i]
        end_time = data_frame_selected_values['Time (hours)'][25:][i + 1]
        results = r.simulate(start_time, end_time, 2)

        simulated_row = results[-1:]
        new_dataframe = pd.DataFrame(simulated_row)
        new_dataframe.columns = ['time', 'glucose', 'biomass', 'serine', 'mu', 'V']
        data_frame = data_frame.append(new_dataframe, ignore_index=True)

    # The simulated data gets written to a file, which is then used for the model prediction to estimate parameters
    data_frame.columns = ['Time (hours)','Glucose (g)','Biomass (g)','Serine (g)','mu', 'V']
    data_frame[['Time (hours)','Glucose (g)','Biomass (g)','Serine (g)']].to_csv('parameter_estimation/output_test.csv')

    # Set the path of the file, so the copasi model can read the data
    experimental_data1 = 'parameter_estimation/output_test.csv'

    # Set bounds for the parameters
    parameter_1_lower_bound = "0"
    parameter_1_upper_bound = "10"
    parameter_2_lower_bound = "0"
    parameter_2_upper_bound = "10"
    parameter_3_lower_bound = "0"
    parameter_3_upper_bound = "100"
    parameter_4_lower_bound = "0"
    parameter_4_upper_bound = "10"
    parameter_5_lower_bound = "0"
    parameter_5_upper_bound = "10000000"
    parameter_6_lower_bound = "0"
    parameter_6_upper_bound = "10"
    parameter_7_lower_bound = "0"
    parameter_7_upper_bound = "10"

    model_for_parest = 'online_fedmodel'


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

    # Update model with optimized parameters
    # Input the estimated parameters into the fed batch model
    print(alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max)

    # Simulate the model into future time points
    f = fed_batch_model()

    f.alpha = float(alpha)
    f.beta = float(beta)
    f.Ks_qs = float(Ks_qs)
    f.qs_max = float(qs_max)
    f.Ki = float(Ki)
    f.Ks = float(Ks)
    f.mu_max = float(mu_max)

    f.timeCourseSelections = ['time','glucose','biomass','serine','mu','V']
    fresults = f.simulate(data_frame_selected_values['Time (hours)'][25], data_frame_selected_values['Time (hours)'].iloc[-1]+5, 100)

    fig = tools.make_subplots(rows=2, cols=3,
                              subplot_titles=('Biomass from model', 'Serine from model', 'Glucose from model', 'Serine prediction, varying mu_set', 'qp prediction, varying mu_set', 'Serine titer prediction, varying mu_set'),
                              )


    trace1 = go.Scatter(
        x=data_frame['Time (hours)'],
        y=data_frame['Biomass (g)'],
        name='Biomass from model',
        mode='markers'
    )

    trace2 = go.Scatter(
        x=data_frame['Time (hours)'],
        y=data_frame['Serine (g)'],
        name='Serine from model',
        mode='markers'
    )

    trace3 = go.Scatter(
        x=data_frame['Time (hours)'],
        y=data_frame['Glucose (g)'],
        name='Glucose from model',
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
        name='Serine from predictive model',
        mode='lines'
    )

    trace6 = go.Scatter(
        x=fresults[:,0],
        y=fresults[:,1],
        name='Glucose from predictive model',
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


    # Simulate predictive models with different feeding parameters
    fp = fed_batch_model()

    model_feed_settings(fp, data_frame, alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max)

    m = fp.simulate(data_frame_selected_values['Time (hours)'].iloc[-1],
                   data_frame_selected_values['Time (hours)'].iloc[-1] + 5, 50, ['time', 'serine'])

    fprate = fed_batch_model()
    model_feed_settings(fprate, data_frame, alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max)

    simser = fprate.simulate(data_frame_selected_values['Time (hours)'].iloc[-1],
                   data_frame_selected_values['Time (hours)'].iloc[-1] + 5, 50, ['time', 'qpbio'])

    fptiter = fed_batch_model()
    model_feed_settings(fptiter, data_frame, alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max)

    simtiter = fptiter.simulate(data_frame_selected_values['Time (hours)'].iloc[-1],
                   data_frame_selected_values['Time (hours)'].iloc[-1] + 5, 50, ['time', 'sertiter'])


    # The varying parameters
    par1 = np.linspace(0, fp.mu_set, num=4)
    par2 = np.linspace(fp.mu_set, 0.1112, num=4)
    par = np.concatenate((par1, par2), axis=None)
    par = np.unique(par)

    colors = ["blue", "black", "yellow", "pink", "green", "purple", "orange"]

    print(data_frame)

    production_values = []

    # Here the actual simulation starts
    for i, j, k in zip([1, 3, 5, 7, 9, 11, 13], par, colors):


        model_feed_settings_loop(fp, data_frame, alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max, j)

        m = np.hstack([m,fp.simulate(data_frame_selected_values['Time (hours)'].iloc[-1],
                   data_frame_selected_values['Time (hours)'].iloc[-1] + 5, 50, ['time', 'serine'])])

        model_feed_settings_loop(fprate, data_frame, alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max, j)

        simser = np.hstack([simser,fprate.simulate(data_frame_selected_values['Time (hours)'].iloc[-1],
                   data_frame_selected_values['Time (hours)'].iloc[-1] + 5, 50, ['time', 'qpbio'])])

        model_feed_settings_loop(fptiter, data_frame, alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max, j)

        simtiter = np.hstack([simtiter,fptiter.simulate(data_frame_selected_values['Time (hours)'].iloc[-1],
                   data_frame_selected_values['Time (hours)'].iloc[-1] + 5, 50, ['time', 'sertiter'])])


        simsergrams = pd.DataFrame(m)
        simserdf = pd.DataFrame(simser)
        simtiterdf = pd.DataFrame(simtiter)

        # Drop the first 2 columns since they are the original ones
        simsergrams.drop([0,1], axis=1, inplace=True)
        simserdf.drop([0, 1], axis=1, inplace=True)
        simtiterdf.drop([0, 1], axis=1, inplace=True)

        ##### For the automatic feeding approach
        # end_productionrates = simserdf.tail(1)
        # end_productionrates = end_productionrates.iloc[:, 1::2]
        # add_end_pvalues = pd.DataFrame(end_productionrates.iloc[:,-1].values)
        #
        #
        # production_values.append((add_end_pvalues))

        trace10 = go.Scatter(
            x=simsergrams.iloc[:, i - 1],
            y=simsergrams.iloc[:, i],
            mode='lines',
            name= 'mu_set =' + "{:.4f}".format(fp.mu_set),
            marker = dict(color = k)
        )

        trace12 = go.Scatter(
            x=simserdf.iloc[:, i - 1],
            y=simserdf.iloc[:, i],
            mode='lines',
            name= 'mu_set =' + ' = ' + "{:.4f}".format(fp.mu_set),
            marker=dict(color = k)
        )

        trace13 = go.Scatter(
            x=simtiterdf.iloc[:, i - 1],
            y=simtiterdf.iloc[:, i],
            mode='lines',
            name='mu_set = ' + "{:.4f}".format(fp.mu_set),
            marker=dict(color=k)
        )


        fig.append_trace(trace10, 2, 1)
        fig.append_trace(trace12, 2, 2)
        fig.append_trace(trace13, 2, 3)

    ##### For the automatic feeding approach
    # production_values = pd.DataFrame(production_values)
    # par = pd.DataFrame(par)
    # resultqp = pd.concat([production_values, par], axis=1, sort=False)
    # resultqp.columns = ['qp', 'mu_set']
    # maxqp = resultqp.loc[resultqp['qp'].idxmax()]
    #
    # maxqp = pd.DataFrame(maxqp).T
    # #pd.reset.index(maxqp)
    # maxqp.to_csv('mu_set.csv')



    fig.append_trace(trace1, 1, 1)
    fig.append_trace(trace4, 1, 1)
    fig.append_trace(trace7, 1, 1)

    fig.append_trace(trace2, 1, 2)
    fig.append_trace(trace5, 1, 2)
    fig.append_trace(trace8, 1, 2)

    fig.append_trace(trace3, 1, 3)
    fig.append_trace(trace6, 1, 3)
    fig.append_trace(trace9, 1, 3)



    fig['layout'].update(height=820, width=1420, title='Model prediction control',
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
                                   tickfont=dict(size=15), domain=[0.65, 1])

    fig['layout']['yaxis2'].update(showgrid=True, title='Serine (g)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=15), domain=[0.65, 1], titlefont = dict(size = 18))
    fig['layout']['yaxis3'].update(showgrid=True, title='Glucose (g)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=15), domain=[0.65, 1], titlefont = dict(size = 18))

    fig['layout']['yaxis4'].update(showgrid=True, title='Serine (g)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=15), domain=[0, 0.35], titlefont = dict(size = 18))
    fig['layout']['yaxis5'].update(showgrid=True, title='qp*X (g product/h)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=15), domain=[0, 0.35], titlefont = dict(size = 18))
    fig['layout']['yaxis6'].update(showgrid=True, title='Serine titer (g/L)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=15), domain=[0, 0.35], titlefont = dict(size = 18))


    fig['layout']['xaxis1'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=15),
                                   domain=[0, 0.27], titlefont = dict(size = 18))
    fig['layout']['xaxis2'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=15),
                                   domain=[0.36, 0.63], titlefont = dict(size = 18))
    fig['layout']['xaxis3'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=15),
                                   domain=[0.72, 0.99], titlefont = dict(size = 18))

    fig['layout']['xaxis4'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=15),
                                   domain=[0, 0.27], titlefont = dict(size = 18))
    fig['layout']['xaxis5'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=15),
                                   domain=[0.36, 0.63], titlefont = dict(size = 18))
    fig['layout']['xaxis6'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=15),
                                   domain=[0.72, 0.99], titlefont = dict(size = 18))

    fig['layout'].update(font = dict(size = 15))

    plotly.offline.plot(fig)


watch_file = 'data/SER_C016_Reactor24_4g-LGlycine_0,02FeedRate.csv'
watcher = Watcher(watch_file, custom_action, text=watch_file)  # also call custom action function
watcher.watch()  # start the watch going