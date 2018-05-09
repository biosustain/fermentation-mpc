import pandas as pd
import tellurium as te
from scipy.optimize import differential_evolution as diff_evol
class SpecialDict(dict):

    def values(self):
        return list(super().values())


def convert_data_to_moles(experimental_data):

    experimental_data = experimental_data.parse('Off line measurements')

    compounds_in_concentration = experimental_data.reindex(
        columns=['Time (hours)', 'Glucose ( g/L)', 'Serine (g/L)', 'Biomass (g/L)', 'Volume(mL)'])

    # Get the compounds in mol and biomass in cmol
    volume = (compounds_in_concentration['Volume(mL)'] * 0.000001)
    glucose_mol = (compounds_in_concentration['Glucose ( g/L)'] / 180) * volume
    serine_mol = (compounds_in_concentration['Serine (g/L)'] / 105.09) * volume
    biomass_cmol = (compounds_in_concentration['Biomass (g/L)'] / 24.6) * volume
    time = (compounds_in_concentration['Time (hours)'])

    compounds_in_mol = pd.DataFrame(
        {'Time [hours]': time,
         'Biomass [c-mol]': biomass_cmol,
         'Serine [mol]': serine_mol,
         'Glucose [mol]': glucose_mol
         })
    compounds_in_mol = compounds_in_mol.reindex(
        columns=['Time [hours]', 'Glucose [mol]', 'Serine [mol]', 'Biomass [c-mol]'])

    # If we have other initial values given:
    # Compounds_in_mol.loc[-1] = ['0', '0.1', '1e-06', '0.0001']
    # Compounds_in_mol.index = Compounds_in_mol.index + 1
    # Compounds_in_mol.sort_index(inplace=True)

    # # Drop the columns with NaN
    compounds_in_mol.dropna(inplace=True)
    compounds_in_mol.reset_index(inplace=True, drop=True)
    compounds_in_mol.to_csv("Data_to_estimate_from.csv", index=False)
    return compounds_in_mol


def parameter_estimation(modelfermentation):
    stochastic_simulation_model = te.StochasticSimulationModel(model=modelfermentation,
                                                               seed=1234,  # not used
                                                               variable_step_size=False,
                                                               from_time=2,
                                                               to_time=23.5,
                                                               step_points=10)
    stochastic_simulation_model.integrator = "gillespie"

    bounds = SpecialDict([("alpha", (0.0, 1000.0)),
                          ("beta", (0.0, 1000.0)),
                          ("Kc", (0.0, 1000.0)),
                          ("mu_max", (0.0, 1000.0))])  # ("gamma", (0.0, 100.0))

    parameter_est = te.ParameterEstimation(stochastic_simulation_model, bounds)
    path = "/Users/s144510/Documents/FermentationTool/"
    parameter_est.setDataFromFile(path + "Data_to_estimate_from.csv", delimiter=",", headers=True)
    return parameter_est.run(diff_evol)


# def convert_SER522_to_moles(Data_sent):
#     Data_sent.dropna(inplace=True)
#     Data_sent.reset_index(inplace=True, drop=True)
#     Data_sent = Data_sent.reindex(columns=['time', 'VC_GLU', 'VC_SER', 'VC_X'])
#
#     Time = (Data_sent['time'])
#     Glucose_mol = (Data_sent['VC_GLU'] / 1000)
#     Serine_mol = (Data_sent['VC_SER'] / 1000)
#     Biomass_cmol = (Data_sent['VC_X'] / 1000)
#
#     Compounds_in_mol = pd.DataFrame(
#         {'Time [hours]': Time,
#          'Biomass [c-mol]': Biomass_cmol,
#          'Serine [mol]': Serine_mol,
#          'Glucose [mol]': Glucose_mol
#          })
#     Compounds_in_mol = Compounds_in_mol.reindex(
#         columns=['Time [hours]', 'Glucose [mol]', 'Serine [mol]', 'Biomass [c-mol]'])
#     Compounds_in_mol.to_csv("Data_to_estimate_from.csv", index=False)
#     return Compounds_in_mol
























