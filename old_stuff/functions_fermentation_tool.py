def data_to_mass(df):

    Compounds = df.reindex(
        columns=['Glucose ( g/L)', 'Acetate (g/L)', 'Serine (g/L)', 'Biomass (g DW /L)', 'Ethanol  (g/L)'])
    mass_compounds = Compounds.mul(df['Volume(L)'], axis=0)  # Multiplies the volume with compounds

    mass_compounds.columns = ['Glucose (g)', 'Acetate (g)', 'Serine (g)', 'Biomass (g)',
                              'Ethanol (g)']  # Assign the columns new names

    rest = df.reindex(columns=['Time (hours)', 'Dilution factor', 'ABS', 'Volume(L)'])

    mass_sheet = mass_compounds.join(rest).stack().reset_index()  # Stacks the data
    mass_sheet.columns = ['Iteration', 'Variables', 'Value']  # Assign the columns new names
    available_indicators = mass_sheet['Variables'].unique()

    return mass_sheet, available_indicators


def stack_data(df1):

    df = df1.stack().reset_index()  # Stacks the data
    df.columns = ['Iteration', 'Variables', 'Value']  # Assign the columns new names
    available_indicators = df['Variables'].unique()

    return df, available_indicators
