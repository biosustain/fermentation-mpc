
def data(experimental_data):
    experimental_data.dropna(inplace=True)
    experimental_data.reset_index(inplace=True, drop=True)
    experimental_data = experimental_data.reindex(
        columns=['Time (hours)', 'mol-Glucose', 'mol-Serine', 'C-mol-Biomass'])
    return experimental_data
