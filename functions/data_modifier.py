import pandas as pd
from time_converter_function import time_to_decimals
import numpy as np

def modify_onlinedata(online_data):

    # Time from online data is converted to decimals so calculations are possible to make
    online_data = (time_to_decimals(online_data))
    online_data['Time (hours)'] = online_data['Time (min)' ] /60


    # Use only data from which CER begins
    data_frame_selected_values = online_data[np.isfinite(online_data['Bioreactor 24 - CER'])]
    data_frame_selected_values.reset_index(inplace=True, drop=True)

    # Reset the time, so the first values corresponds to time 0
    data_frame_selected_values = data_frame_selected_values.copy()
    data_frame_selected_values['Time (hours)'] = data_frame_selected_values['Time (hours)'] - \
                                                 data_frame_selected_values['Time (hours)'][0]

    return data_frame_selected_values