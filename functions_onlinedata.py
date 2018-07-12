import pandas as pd


def online(watch_file, channel):
    online_data = pd.ExcelFile(watch_file)
    online_data = online_data.parse(channel)

    return watch_file, online_data

