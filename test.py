
import pandas as pd
from time_converter_function import time_to_decimals
import numpy as np

watch_file = 'data/SER_C016_Reactor24_4g-LGlycine_0,02FeedRate.csv'
online_data = pd.read_csv(watch_file)

# Time from online data is converted to decimals so calculations are possible to make
online_data = (time_to_decimals(online_data))
online_data['Time (hours)'] = online_data['Time (min)'] / 60

# Use only data from which CER begins
data_frame_selected_values = online_data[np.isfinite(online_data['Bioreactor 24 - CER'])]
data_frame_selected_values.reset_index(inplace=True, drop=True)

print(data_frame_selected_values)


shifted = data_frame_selected_values.shift(periods=1)

print(shifted)  # nummer 1
print(data_frame_selected_values)  # nummer 2

print(data_frame_selected_values['Time (hours)'] - shifted['Time (hours)'])
print((data_frame_selected_values['Time (hours)'] + shifted['Time (hours)']) / 2)


# print(data_frame_selected_values.filter(regex='Feed'))
#
# feed_column = data_frame_selected_values.filter(regex='Feed')
#
# count_feed_elements = feed_column[feed_column > 0].count()
#
# if count_feed_elements[0] >= 2:
#     print('It may take some time before the algorithm has finished first cycle of model predictive control')
