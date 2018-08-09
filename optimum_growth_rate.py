import warnings
warnings.filterwarnings("ignore", message="numpy.dtype size changed")
warnings.filterwarnings("ignore", message="numpy.ufunc size changed")
import pandas as pd
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
from datetime import datetime
import datetime


R1 = pd.read_csv('data/SER_C016_Reactor1_0,5g-LGlucose.csv')
R2 = pd.read_csv('data/SER_C016_Reactor2_1,0g-LGlucose.csv')
R3 = pd.read_csv('data/SER_C016_Reactor3_2,0g-LGlucose.csv')
R4 = pd.read_csv('data/SER_C016_Reactor4_3,0g-LGlucose.csv')
R5 = pd.read_csv('data/SER_C016_Reactor5_5,0g-LGlucose.csv')
R6 = pd.read_csv('data/SER_C016_Reactor6_7,5g-LGlucose.csv')
R7 = pd.read_csv('data/SER_C016_Reactor7_10,0g-LGlucose.csv')
R8 = pd.read_csv('data/SER_C016_Reactor8_20,0g-LGlucose.csv')
R9 = pd.read_csv('data/SER_C016_Reactor9_40,0g-LGlucose.csv')
R10 = pd.read_csv('data/SER_C016_Reactor10_60,0g-LGlucose.csv')
R11 = pd.read_csv('data/SER_C016_Reactor11_120,0g-LGlucose.csv')
R12 = pd.read_csv('data/SER_C016_Reactor12_150,0g-LGlucose.csv')







# Reactor 1
date_time = pd.DataFrame(R1['Date Time'].str.split(' ',1).tolist(),
                                   columns=['Date','Time'])

R1 = pd.concat([date_time,R1],axis=1,sort=False)
del R1['Date Time']

R1['Time'] = pd.to_timedelta(R1['Time'])
R1['Time'].reset_index(inplace=True, drop=True)
R1['Time'] = R1['Time'] - R1['Time'][0]
shifted_time = R1['Time'].shift(periods=-1)
R1['Time'] = shifted_time - R1['Time']
R1['Time'] = pd.to_datetime(R1['Time'])
R1['Time'] = R1['Time'].dt.time
R1['Time'] = R1['Time'].shift(periods=1)
R1['Time'][0] = datetime.time(0, 0, 0)

selected_time_decimals = pd.DataFrame(columns=['Time (min)'])
for i in range(0, len(R1['Time'] )):
    h = R1['Time'] [i].strftime('%H')
    m = R1['Time'] [i].strftime('%M')
    s = R1['Time'] [i].strftime('%S')
    result = int(h) * 60 + int(m) + int(s) / 60.0  # [min]
    selected_time_decimals.loc[
        i, ['Time (min)']] = result  # This puts the results in the iterated indexes in the Time column

R1 = pd.concat([selected_time_decimals,R1],axis=1,sort=False)
del R1['Time']


for i in range(len(R1)-1):
    R1['Time (min)'][i+1] = R1['Time (min)'][i] + R1['Time (min)'][i+1]
    # timeigen.loc[
    #     i, ['Timeigen']] = result









# selected_time = pd.to_timedelta(R1['Time'])
# selected_time.reset_index(inplace=True, drop=True)
# reset_selected_time = selected_time - selected_time[0]
#
# selected_datetimes = pd.to_datetime(reset_selected_time)
# selected_time = selected_datetimes.dt.time
#
#
# shifted_time = selected_datetimes.shift(periods=-1)
# delta = shifted_time - selected_datetimes
#
#
# delta = delta.shift(periods=1)
# delta[0] = 0
# delta = pd.to_timedelta(delta)
#
# print(delta)
#
# pd.DataFrame(delta.str.split(' ',1).tolist(),
#                                 columns=['Date','Time'])


# del delta
#
# print(delta)
# print(len(R1))
# print(type(delta))


# R1['delta'].add(0, fill_value=0)
# print(R1['delta'])

# selected_time_decimals = pd.DataFrame(columns=['Time'])
# for i in range(0, len(selected_time)):
#     h = selected_time[i].strftime('%H')
#     m = selected_time[i].strftime('%M')
#     s = selected_time[i].strftime('%S')
#     result = int(h) * 60 + int(m) + int(s) / 60.0  # [min]
#     selected_time_decimals.loc[
#         i, ['Time']] = result  # This puts the results in the iterated indexes in the Time column
#
# print(selected_time_decimals.to_string())

# time = pd.to_timedelta(online_data['Time      '])
# shifted_time = time.shift(periods=-1)
# delta = shifted_time - time
# online_data['delta'] = delta



# plt.plot(R1['Date Time'], R1['Bioreactor 1 - CER'], 'ro')
# plt.xlabel('Time')
# plt.ylabel('CER')
# plt.show()

#plt.subplot(2,1,2)
# plt.plot([R1['Date Time']], [R1['Bioreactor 1 - Off-gas CO2%']], 'ro')
# plt.xlabel('Time')
# plt.ylabel('Bioreactor 1 - Off-gas CO2%')
# plt.show()

