def stack_data(df1):


    df = df1.stack().reset_index()  # Stacks the data
    df.columns = ['Iteration', 'Variables', 'Value']  # Assign the columns new names
    available_indicators = df['Variables'].unique()


    return df, available_indicators