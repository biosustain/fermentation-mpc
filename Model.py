import tellurium as te
import matplotlib.pyplot as plt
import pandas as pd
te.setDefaultPlottingEngine("matplotlib")




from scipy.optimize import differential_evolution as diff_evol


# The following relevant for the estimation parameters with tellurium
class SpecialDict(dict):

    def values(self):
        return list(super().values())


# The model starts here:
# It contains the substrates glucose and the products acetate, ethanol and biomass as solids in g/L
# It consists of the mass balancing equations
Modelfermentation = '''
model *IDModel()

    var compartment comp1;
    comp1 = 100
    #F = 5;
    #comp1' = F;


    # Specify the species in the compartment

    Glucose in comp1; Acetate in comp1; Ethanol in comp1; Biomass in comp1;


    # Substrates
    
    
    # Glucose initialization
    Glucose = 1.45; # The unit is g/L, and we should set the initial concentration that we have from the experiment. 

    EqG: -> Glucose; -r_s
    r_s = 7.70869586;

    # Products 


    EqA: -> Acetate; r_a
    r_a = 1.05397973;

    Ethanol = 0.02;
    EqE: -> Ethanol; -r_e
    r_e = 0.08758182;


    # Biomass 


    Biomass = 0.012;
    EqB: -> Biomass; MU*Biomass     


    # Functions that are used in the equations


    mu_max = 45.13104497; 
    Ks = 1;
    MU := mu_max*Glucose/(Ks+Glucose) 



    end
'''
r = te.loada(Modelfermentation)

# We can set the lists so it has the same order as the data
# if we need to for the parameter estimation:
# r.timeCourseSelections = ['time', 'comp1', 'Glucose','Acetate','Biomass']

# Time must mach the exact value from the experiment
results = r.simulate(0, 16.6626, 12)
print(results)

# We can export it to SBML and then load it in Copasi
# to check the model or work with the model in Copasi
# r.exportToSBML("TheBalanceEquations.xml")


# The parameter estimation start here:
MassData = pd.read_csv("MassData.csv")

stochastic_simulation_model = te.StochasticSimulationModel(model=Modelfermentation,
                seed=1234, # not used
                variable_step_size = False,
                from_time=0.411021,
                to_time=16.6626,
                step_points=30)
stochastic_simulation_model.integrator = "gillespie"

bounds = SpecialDict([("r_s",(0.0,10.0)),
                      ("r_a", (0.0,10.0)),
                      ("r_e", (0.0,10.0)),
                      ("mu_max", (0.0,100.0))])

parameter_est = te.ParameterEstimation(stochastic_simulation_model,bounds)
path = "/Users/s144510/Documents/FermentationTool/"
parameter_est.setDataFromFile(path+"MassData.csv",delimiter=",", headers=True)
print(parameter_est.run(diff_evol))


# Plot of the results from the model and the experimental data
plt.figure(num=None, figsize=(10, 7), dpi=80, facecolor='w', edgecolor='k')

plt.subplot(2, 2, 1)
plt.plot(results[:, 0], (results[:, 4]))
plt.plot(MassData['Time (hours)'], MassData['Biomass (g)'])
plt.legend(['Biomass from model', 'Biomass from data'], loc='upper left')

plt.subplot(2, 2, 2)
plt.plot(results[:, 0], results[:, 3])
plt.plot(MassData['Time (hours)'], MassData['Ethanol (g)'])
plt.legend(['Ethanol from model', 'Ethanol from data'], loc='upper left')

plt.subplot(2, 2, 3)
plt.plot(results[:, 0], results[:, 2])
plt.plot(MassData['Time (hours)'], MassData['Acetate (g)'])
plt.legend(['Acetate from model', 'Acetate from data'], loc='upper left')

plt.subplot(2, 2, 4)
plt.plot(results[:, 0], results[:, 1])
plt.plot(MassData['Time (hours)'], MassData['Glucose (g)'])
plt.legend(['Glucose from model', 'Glucose from data'], loc='upper left')

#plt.show()
plt.show(block=True)














