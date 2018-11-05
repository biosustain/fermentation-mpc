import pandas as pd

watch_file = pd.read_csv('data/SER_C016_Reactor24_4g-LGlycine_0,02FeedRate.csv')
online_data = watch_file


print(online_data)

# # Calculate the difference in time, so we can select all the data that corresponds to 1 reactor
#
# time = pd.to_timedelta(online_data['Time      '])
# shifted_time = time.shift(periods=-1)
# delta = shifted_time - time
# online_data['delta'] = delta
#
# # Select the rows with difference in time between 46 and 47 minutes
# # and create new dataframe that we will be working with
# selected_data = online_data[(online_data['delta'] >= '00:46:00') & (online_data['delta'] <= '00:47:00')]
#
# # Calculation of the CO2 evolution rate
# CER = selected_data['CO2 (Vol.%)'] * 10 - 0.04 * 10  # unit [(mol_co2/mol_totalgas)/min] / [%CO2/min]
#
# # Reset the selected time so it starts from time = 0, convert it and then use it to calculate tCER
# selected_time = pd.to_timedelta(selected_data['Time      '])
# selected_time.reset_index(inplace=True, drop=True)
# reset_selected_time = selected_time - selected_time[0]
# selected_datetimes = pd.to_datetime(reset_selected_time)
# selected_time = selected_datetimes.dt.time
#
# # convert time to decimals and in minutes
# selected_time_decimals = pd.DataFrame(columns=['Time'])
# for i in range(0, len(selected_time)):
#     h = selected_time[i].strftime('%H')
#     m = selected_time[i].strftime('%M')
#     s = selected_time[i].strftime('%S')
#     result = int(h) * 60 + int(m) + int(s) / 60.0  # [min]
#     selected_time_decimals.loc[
#         i, ['Time']] = result  # This puts the results in the iterated indexes in the Time column
#
# # Calculate tCER
# CER.reset_index(inplace=True, drop=True)
#
# selected_time_decimals = selected_time_decimals.iloc[:, 0]


#     tCER = []
#     tCER.append(0)  # Here set the initial value of tCER if we have that.
#
#     for i in range(0, (len(selected_time_decimals) - 1)):
#
#         tCER_i = ((CER[i] + CER[i + 1]) / 2) * (selected_time_decimals[i + 1] - selected_time_decimals[i]) + tCER[i]
#         tCER.append(tCER_i)
#
#     mu = CER / tCER
#     mu = (mu*60)  # [1/h]
#
#     selected_time_decimals_hours = selected_time_decimals/60
#
#     r = batch_model_mu()
#     r.timeCourseSelections = ['time', 'glucose', 'serine', 'biomass', 'mu']
#
#     start_time = selected_time_decimals_hours[0]
#     end_time = selected_time_decimals_hours.iloc[1]
#     results = r.simulate(start_time, end_time, 2)
#
#     # we probably did'nt have to simulate since we just want the first row.
#     # But it makes it easier to make the data frame
#     initial_values = results[0:1]
#     data_frame = pd.DataFrame(initial_values)
#     data_frame.columns = ['time', 'glucose', 'serine', 'biomass', 'mu']
#
#
#     # Some of the inputs for the parameter_estimation_online function
#     model_for_parest = 'parameter_estimation/model_mu_1'
#     filename_experimental_data1 = "parameter_estimation/R1_data_in_moles.csv"
#     filename_experimental_data2 = "parameter_estimation/R2_data_in_moles.csv"
#
#     for i in range(0, (len(mu) - 2)):
#         r.reset()
#         r.mu = mu[i+1]
#         glucose = data_frame['glucose'].iloc[-1]
#         serine = data_frame['serine'].iloc[-1]
#         biomass = data_frame['biomass'].iloc[-1]
#
#         alpha_online, beta_online = parameter_estimation_online(filename_experimental_data1,
#                                                                 filename_experimental_data2,
#                                                                 alpha_lower_bound, alpha_upper_bound,
#                                                                 beta_lower_bound, beta_upper_bound,
#                                                                 str(mu[i+1]), str(glucose), str(serine),
#                                                                 str(biomass), model_for_parest)
#
#         r.alpha = float(alpha_online)
#         r.beta = float(beta_online)
#         start_time = selected_time_decimals_hours[i]
#         end_time = selected_time_decimals_hours[i + 1]
#         results = r.simulate(start_time, end_time, 2)
#         simulated_row = results[-1:]
#         new_dataframe = pd.DataFrame(simulated_row)
#         new_dataframe.columns = ['time', 'glucose', 'serine', 'biomass', 'mu']
#         data_frame = data_frame.append(new_dataframe, ignore_index=True)