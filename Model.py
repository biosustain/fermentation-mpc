import pandas as pd
import matplotlib.pyplot as plt
import tellurium as te
#te.setDefaultPlottingEngine("matplotlib")

# The following relevant for the estimation parameters with tellurium
class SpecialDict(dict):

    def values(self):
        return list(super().values())
from scipy.optimize import differential_evolution as diff_evol



# The model starts here:
# It contains the substrates glucose and the products serine and biomass as solids in g/L
# It consists of the mass balancing equations
# Units are given in comments in square brackets []
# The initial conditions are found from the experiment
Modelfermentation = '''
model *IDModel()

    var compartment comp1;
    comp1 = 0.1; # [m^3] # DEN SKAL FAKTISK VÆRE 0.0001, men 0.1 virker godt
    #F = 5;
    #comp1' = F;
    
    
    ### Specify the species in the compartment

    Glucose in comp1; Serine in comp1; Biomass in comp1;
    
    
    ### Constants
    rho_liq = 995.67; # [kg/m^3]     The density in the broth (which is used in the equations)
    alpha = 6.065323; # Check units
    beta = 47.59781225; # Check units
    
    
    ### Initial values for concentrations of compounds
    #c_glucose0 = 10; # [mol/m^3]
    #c_serine0 = 0.0001; # [mol/m^3]
    #c_biomass0 = 0.01; # [mol/m^3]
    
    
    ### Initial conditions for mass
    M_liq = 99.567 #comp1*rho_liq # [kg]
    Glucose = 0.008104  #c_glucose0*comp1 # [mol] #Should it be the volume of the filtrate?
    Serine = 0 #c_serine0*comp1 # [mol]
    Biomass = 0.000544 #c_biomass0*comp1 # [mol]
    
    
    ### Concentrations that is used in the equations
    c_glucose := Glucose/M_liq  # [mol/kg]
    
    
    ### Functions that are used in the equations
    mu_max = 95.19658513; # [1/h]
    Ks = 0.33425739; # [mol/kg]
    mu := mu_max*(c_glucose/(Ks+c_glucose)) # [1/h]

    
    ### Biomass mass balance
    
    EqB: -> Biomass; mu*Biomass # [c-mol/h]
    
    
    ### Products mass balance
    
    # Serine

    # qp rate (for serine)
    #qp_s := alpha/(beta+mu) # [mol_serine/(mol_biomass*h)]    
    gamma = 78.46487233;
    qp_s := alpha*mu/(beta+mu+gamma*mu^2) # [mol_serine/(mol_biomass*h)]
    
    # r_s 
    rp_s := qp_s*Biomass # [mol/h]

    EqS: -> Serine; rp_s


    ### Substrate mass balance
    
    # Glucose

    # qs_g for glucose
    a = -0.2572;
    b = -0.7651;
    ms = -0.0046; 
    qs_g := a*mu + b*qp_s + ms 
    
    #glu_max = 719.89008484;
    #qs_g := -glu_max*c_glucose/(Ks+c_glucose) 
    
    
    # r_s
    r_s := qs_g*Biomass # [mol/h]
    
    EqG: -> Glucose; r_s # [mol/h]



 



    end
'''
r = te.loada(Modelfermentation)

# We can set the lists so it has the same order as the data
# if we need to for the parameter estimation:
# r.timeCourseSelections = ['time', 'comp1', 'Glucose','Acetate','Biomass']

# Time interval must mach the exact value from the experiment
results = r.simulate(2, 23.5, 10)
print(results)




#function for data and we need to convert the data to mol, because the units of the compounds is now in g/L.
#Start by multiplying the volume with L, (it actually should be the volume of the filtrate)
#Then g, Therefore divide with g/mol = mol..

file = 'C002_R2_overview.xlsm'
Experimental_data = pd.ExcelFile(file)
Experimental_data = Experimental_data.parse('Off line measurements')

Compounds_in_concentration = Experimental_data.reindex(columns=['Time (hours)', 'Glucose ( g/L)', 'Serine (g/L)', 'Biomass (g/L)'])

# Get the compounds in mol and biomass in cmol
Glucose_mol = (Compounds_in_concentration['Glucose ( g/L)']/180)*0.1
Serine_mol = (Compounds_in_concentration['Serine (g/L)']/105.09)*0.1
Biomass_cmol = (Compounds_in_concentration['Biomass (g/L)']/24.6)*0.1
Time = (Compounds_in_concentration['Time (hours)'])

Compounds_in_mol = pd.DataFrame(
    {'Time [hours]': Time,
     'Biomass [c-mol]': Biomass_cmol,
     'Serine [mol]': Serine_mol,
     'Glucose [mol]': Glucose_mol
     })
Compounds_in_mol = Compounds_in_mol.reindex(columns=['Time [hours]', 'Glucose [mol]', 'Serine [mol]', 'Biomass [c-mol]'])

#Compounds_in_mol.loc[-1] = ['0', '0.1', '1e-06', '0.0001']
#Compounds_in_mol.index = Compounds_in_mol.index + 1
#Compounds_in_mol.sort_index(inplace=True)


# # Drop the columns with NaN
Compounds_in_mol.dropna(inplace=True)
Compounds_in_mol.reset_index(inplace=True, drop=True)
print(Compounds_in_mol)

Compounds_in_mol.to_csv("Data_to_estimate_from.csv", index=False)
#Data = pd.read_csv("Data_to_estimate_from.csv")
#print(Data)
#
#
#
# # plt.scatter(ExperimentalData['Time (hours)'], ExperimentalData['Serine (g/L)'])
# # plt.show()
#
#
#
#
# # We can export it to SBML and then load it in Copasi
# # to check the model or work with the model in Copasi
# # r.exportToSBML("TheBalanceEquations.xml")
#
#
# # The parameter estimation start here:
#
#
# #MassData = pd.read_csv("Data_to_estimate_from.csv")

stochastic_simulation_model = te.StochasticSimulationModel(model=Modelfermentation,
                seed=1234, # not used
                variable_step_size = False,
                from_time=2,
                to_time=23.5,
                step_points=100)
stochastic_simulation_model.integrator = "gillespie"

bounds = SpecialDict([("alpha",(0.0, 100.0)),
                      ("beta", (0.0, 100.0)),
                      ("Ks", (0.0, 100.0)),
                      ("mu_max", (0.0, 100.0)),
                      ("gamma", (0.0, 100.0))])

parameter_est = te.ParameterEstimation(stochastic_simulation_model,bounds)
path = "/Users/s144510/Documents/FermentationTool/"
parameter_est.setDataFromFile(path+"Data_to_estimate_from.csv", delimiter=",", headers=True)
print(parameter_est.run(diff_evol))





# #
# #
# # # # Plot of the results from the model and the experimental data
# # When plotting it should be multiplied by 1000 to get mmol
plt.figure(num=None, figsize=(10, 7), dpi=80, facecolor='w', edgecolor='k')

plt.subplot(3, 2, 1)
plt.plot(results[:, 0], (results[:, 3]))
plt.scatter(Compounds_in_mol['Time [hours]'], Compounds_in_mol['Biomass [c-mol]'])
plt.legend(['Biomass from model', 'Biomass from data'], loc='upper left')

plt.subplot(2, 2, 2)
plt.plot(results[:, 0], results[:, 2])
plt.scatter(Compounds_in_mol['Time [hours]'], Compounds_in_mol['Serine [mol]'])
plt.legend(['Serine from model', 'Serine from data'], loc='upper left')

plt.subplot(2, 2, 3)
plt.plot(results[:, 0], results[:, 1])
plt.scatter(Compounds_in_mol['Time [hours]'], Compounds_in_mol['Glucose [mol]'])
plt.legend(['Glucose from model', 'Glucose from data'], loc='upper left')


plt.show()















