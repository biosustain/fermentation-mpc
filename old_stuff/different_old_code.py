
def parameter_estimation(experimental_data1,experimental_data2,
                         parameter_1_lower_bound,parameter_1_upper_bound,
                         parameter_2_lower_bound,parameter_2_upper_bound,
                         parameter_3_lower_bound,parameter_3_upper_bound,
                         parameter_4_lower_bound,parameter_4_upper_bound):
    # From cps to xml
    os.rename('OPTIMISATIONtest.cps', 'OPTIMISATIONtest.xml')

    soup = BeautifulSoup(open('OPTIMISATIONtest.xml', 'r'), 'xml')

    infile = open('OPTIMISATIONtest.xml', "w")

    # Choose filename for experimental dataset nr 1
    Experiment_0 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "Experiment"][0]
    file_name = [s for s in Experiment_0.find_all("Parameter") if s["name"] == "File Name"][0]
    file_name["value"] = experimental_data1

    # Choose filename for experimental dataset nr 2
    Experiment_1 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "Experiment_1"][0]
    file_name = [s for s in Experiment_1.find_all("Parameter") if s["name"] == "File Name"][0]
    file_name["value"] = experimental_data2

    # Parameters:

    parameter_1 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][0]
    lower_bound_1 = [s for s in parameter_1.find_all('Parameter') if s['name'] == "LowerBound"][0]
    lower_bound_1['value'] = parameter_1_lower_bound
    upper_bound_1 = [s for s in parameter_1.find_all('Parameter') if s['name'] == "UpperBound"][0]
    upper_bound_1['value'] = parameter_1_upper_bound

    parameter_2 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][1]
    lower_bound_2 = [s for s in parameter_2.find_all('Parameter') if s['name'] == "LowerBound"][0]
    lower_bound_2['value'] = parameter_2_lower_bound
    upper_bound_2 = [s for s in parameter_2.find_all('Parameter') if s['name'] == "UpperBound"][0]
    upper_bound_2['value'] = parameter_2_upper_bound

    parameter_3 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][2]
    lower_bound_3 = [s for s in parameter_3.find_all('Parameter') if s['name'] == "LowerBound"][0]
    lower_bound_3['value'] = parameter_3_lower_bound
    upper_bound_3 = [s for s in parameter_3.find_all('Parameter') if s['name'] == "UpperBound"][0]
    upper_bound_3['value'] = parameter_3_upper_bound

    parameter_4 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][3]
    lower_bound_4 = [s for s in parameter_4.find_all('Parameter') if s['name'] == "LowerBound"][0]
    lower_bound_4['value'] = parameter_4_lower_bound
    upper_bound_4 = [s for s in parameter_4.find_all('Parameter') if s['name'] == "UpperBound"][0]
    upper_bound_4['value'] = parameter_4_upper_bound

    infile.write(soup.prettify().encode(soup.original_encoding))
    infile.close()

    # From xml to cps
    os.rename('OPTIMISATIONtest.xml', 'OPTIMISATIONtest.cps')

    # Run the parameterestimation in Copasi for the model from the terminal
    # Find the path to CopasiSE, it could be the path given below in the comment
    # os.system("/Applications/COPASI/CopasiSE model_copasi.cps --save model_copasi.cps")
    os.system("/Users/s144510/Documents/Bachelor project/fermentation-mpc/CopasiSE OPTIMISATIONtest.cps --save OPTIMISATIONtest.cps")

    # Get the results
    os.rename('OPTIMISATIONtest.cps', 'OPTIMISATIONtest.xml')
    soup = BeautifulSoup(open('OPTIMISATIONtest.xml', 'r'), 'xml')

    result_parameter_1 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][0]
    result_parameter_1 = [s for s in result_parameter_1.find_all('Parameter') if s['name'] == "StartValue"][0]
    alpha = result_parameter_1['value']

    result_parameter_2 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][1]
    result_parameter_2 = [s for s in result_parameter_2.find_all('Parameter') if s['name'] == "StartValue"][0]
    beta = result_parameter_2['value']

    result_parameter_3 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][2]
    result_parameter_3 = [s for s in result_parameter_3.find_all('Parameter') if s['name'] == "StartValue"][0]
    kc = result_parameter_3['value']

    result_parameter_4 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][3]
    result_parameter_4 = [s for s in result_parameter_4.find_all('Parameter') if s['name'] == "StartValue"][0]
    mu_max = result_parameter_4['value']

    infile.close()
    os.rename('OPTIMISATIONtest.xml', 'OPTIMISATIONtest.cps')

    return alpha, beta, kc, mu_max


def parameter_estimation_online(experimental_data1,experimental_data2,
                         parameter_1_lower_bound,parameter_1_upper_bound,
                         parameter_2_lower_bound,parameter_2_upper_bound,
                         mu, glucose, serine, biomass, model_for_parest):
    #  From cps to xml, if it is not already in an xml format.
    try:
        os.rename('/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.cps',
                  '/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.xml')
    except OSError:
        pass


    soup = BeautifulSoup(open('/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.xml', 'r'), 'xml')
    infile = open('/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.xml', "w")

    # Choose filename for experimental dataset nr 1
    Experiment_0 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "Experiment"][0]
    file_name = [s for s in Experiment_0.find_all("Parameter") if s["name"] == "File Name"][0]
    file_name["value"] = experimental_data1

    # Choose filename for experimental dataset nr 2
    Experiment_1 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "Experiment_1"][0]
    file_name = [s for s in Experiment_1.find_all("Parameter") if s["name"] == "File Name"][0]
    file_name["value"] = experimental_data2

    # Parameters:

    parameter_1 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][0]
    lower_bound_1 = [s for s in parameter_1.find_all('Parameter') if s['name'] == "LowerBound"][0]
    lower_bound_1['value'] = parameter_1_lower_bound
    upper_bound_1 = [s for s in parameter_1.find_all('Parameter') if s['name'] == "UpperBound"][0]
    upper_bound_1['value'] = parameter_1_upper_bound

    parameter_2 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][1]
    lower_bound_2 = [s for s in parameter_2.find_all('Parameter') if s['name'] == "LowerBound"][0]
    lower_bound_2['value'] = parameter_2_lower_bound
    upper_bound_2 = [s for s in parameter_2.find_all('Parameter') if s['name'] == "UpperBound"][0]
    upper_bound_2['value'] = parameter_2_upper_bound

    # Mu and initial values change

    tag = soup.InitialState
    initial_values = tag.string.split()
    initial_values[20] = mu
    initial_values[1] = glucose
    initial_values[2] = serine
    initial_values[3] = biomass
    initial_values = " ".join(initial_values)
    tag.string = initial_values

    infile.write(soup.prettify().encode(soup.original_encoding))
    infile.close()

    # From xml to cps
    os.rename('/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.xml',
              '/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.cps')

    # Run the parameterestimation in Copasi for the model from the terminal
    # Find the path to CopasiSE, it could be the path given below in the comment
    # os.system("/Applications/COPASI/CopasiSE model_mu.cps --save model_mu.cps")
    os.system("/Users/s144510/Documents/Bachelorproject/fermentation-mpc/CopasiSE " +
              model_for_parest + '.cps --save ' + model_for_parest + ".cps")

    # Get the results
    os.rename('/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.cps',
              '/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.xml')

    soup = BeautifulSoup(open('/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.xml', 'r'), 'xml')

    result_parameter_1 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][0]
    result_parameter_1 = [s for s in result_parameter_1.find_all('Parameter') if s['name'] == "StartValue"][0]
    alpha = result_parameter_1['value']

    result_parameter_2 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][1]
    result_parameter_2 = [s for s in result_parameter_2.find_all('Parameter') if s['name'] == "StartValue"][0]
    beta = result_parameter_2['value']

    infile.close()
    os.rename('/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.xml',
              '/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.cps')

    return alpha, beta






def parameter_estimation_online_fedbatch_nomupar(experimental_data1,
                         parameter_1_lower_bound,parameter_1_upper_bound,
                         parameter_2_lower_bound,parameter_2_upper_bound,
                         parameter_3_lower_bound,parameter_3_upper_bound,
                         parameter_4_lower_bound,parameter_4_upper_bound,
                         model_for_parest, number_of_first_row, number_of_last_row):

    #  From cps to xml, if it is not already in an xml format.
    try:
        os.rename('/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.cps',
                  '/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.xml')
    except OSError:
        pass

    soup = BeautifulSoup(open('/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.xml', 'r'), 'xml')
    infile = open('/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.xml', "w")


    # File name and first and second row of experiment
    Experiment_0 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "Experiment"][0]
    file_name = [s for s in Experiment_0.find_all("Parameter") if s["name"] == "File Name"][0]
    file_name["value"] = experimental_data1

    first_row = [s for s in Experiment_0.find_all("Parameter") if s["name"] == "First Row"][0]
    first_row["value"] = number_of_first_row

    last_row = [s for s in Experiment_0.find_all("Parameter") if s["name"] == "Last Row"][0]
    last_row["value"] = number_of_last_row


    # Parameters:

    parameter_1 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][0]
    lower_bound_1 = [s for s in parameter_1.find_all('Parameter') if s['name'] == "LowerBound"][0]
    lower_bound_1['value'] = parameter_1_lower_bound
    upper_bound_1 = [s for s in parameter_1.find_all('Parameter') if s['name'] == "UpperBound"][0]
    upper_bound_1['value'] = parameter_1_upper_bound

    parameter_2 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][1]
    lower_bound_2 = [s for s in parameter_2.find_all('Parameter') if s['name'] == "LowerBound"][0]
    lower_bound_2['value'] = parameter_2_lower_bound
    upper_bound_2 = [s for s in parameter_2.find_all('Parameter') if s['name'] == "UpperBound"][0]
    upper_bound_2['value'] = parameter_2_upper_bound

    parameter_3 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][2]
    lower_bound_3 = [s for s in parameter_3.find_all('Parameter') if s['name'] == "LowerBound"][0]
    lower_bound_3['value'] = parameter_3_lower_bound
    upper_bound_3 = [s for s in parameter_3.find_all('Parameter') if s['name'] == "UpperBound"][0]
    upper_bound_3['value'] = parameter_3_upper_bound

    parameter_4 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][3]
    lower_bound_4 = [s for s in parameter_4.find_all('Parameter') if s['name'] == "LowerBound"][0]
    lower_bound_4['value'] = parameter_4_lower_bound
    upper_bound_4 = [s for s in parameter_4.find_all('Parameter') if s['name'] == "UpperBound"][0]
    upper_bound_4['value'] = parameter_4_upper_bound

    # Mu and initial values change

    #tag = soup.InitialState
    #initial_values = tag.string.split()
    #initial_values[20] = mu
    #initial_values[1] = glucose
    #initial_values[2] = serine
    #initial_values[3] = biomass
    #initial_values = " ".join(initial_values)
    #tag.string = initial_values

    infile.write(soup.prettify().encode(soup.original_encoding))
    infile.close()

    # From xml to cps
    os.rename('/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.xml',
              '/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.cps')

    # Run the parameterestimation in Copasi for the model from the terminal
    # Find the path to CopasiSE, it could be the path given below in the comment
    # os.system("/Applications/COPASI/CopasiSE model_mu.cps --save model_mu.cps")
    os.system("/Users/s144510/Documents/Bachelorproject/fermentation-mpc/CopasiSE " +
              model_for_parest + '.cps --save ' + model_for_parest + ".cps")

    # Get the results
    os.rename('/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.cps',
              '/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.xml')

    soup = BeautifulSoup(open('/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.xml', 'r'), 'xml')

    result_parameter_1 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][0]
    result_parameter_1 = [s for s in result_parameter_1.find_all('Parameter') if s['name'] == "StartValue"][0]
    alpha = result_parameter_1['value']

    result_parameter_2 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][1]
    result_parameter_2 = [s for s in result_parameter_2.find_all('Parameter') if s['name'] == "StartValue"][0]
    beta = result_parameter_2['value']

    result_parameter_3 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][2]
    result_parameter_3 = [s for s in result_parameter_3.find_all('Parameter') if s['name'] == "StartValue"][0]
    Ks_qs = result_parameter_3['value']

    result_parameter_4 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][3]
    result_parameter_4 = [s for s in result_parameter_4.find_all('Parameter') if s['name'] == "StartValue"][0]
    qs_max = result_parameter_4['value']


    infile.close()
    os.rename('/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.xml',
              '/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.cps')

    return alpha, beta, Ks_qs, qs_max


    # Mu and initial values change

    #tag = soup.InitialState
    #initial_values = tag.string.split()
    #initial_values[20] = mu
    #initial_values[1] = glucose
    #initial_values[2] = serine
    #initial_values[3] = biomass
    #initial_values = " ".join(initial_values)
    #tag.string = initial_values


def batch_model():
    fermentation_model = '''
    model *IDModel()

        ######## Set the compartment to 1, otherwise it will be multiplied by the compounds. 
        compartment comp1;
        comp1 =1;


        ######## Specify the species in the compartment
        biomass in comp1; V in comp1; glucose in comp1; serine in comp1; 


        ######## Constants
        alpha = 0.05846170603
        beta = 1.114915272e-10
        mu_max = 0.2114514111
        kc = 0.5787273839
        a = -0.4015362233;
        b = -0.4237085289;
        ms = -1.871821912e-10; 


        ######## Initial conditions
        glucose = 8.254856e-03 #*1000 # [mol] 
        serine = 0 #c_serine0*comp1 # [mol]
        biomass = 5.538306e-04 #*1000 # [mol]
        V = 0.00010428; #[m^3]
        F = 0; #1.386900023e-6;


        ######## Function for volume
        #v := 0.00010302999999999999-(0.00000121*time) #[m^3]

        ######## Concentrations that is used in the equations
        c_glucose := glucose/V  # [mol/m^3]
        c_biomass := biomass/V # [mol/m^3] 

        qp_max = 0.09
        qs_max = -0.138786

        ######## Functions
        mu := mu_max*(c_glucose/((kc*c_biomass)+c_glucose)) # [1/h]
        qp_s := alpha*mu/(beta+mu) # [mol_serine/(c-mol_biomass*h)]
        qs_g := a*mu + b*qp_s + ms #[mol_glucose/(c-mol_biomass*h)]
        rp_s := qp_s*biomass # [mol/h] 
        r_s := qs_g*biomass # [mol/h]


        ######## Mass Balances    
        eq_biomass: -> biomass; mu*biomass - F*biomass/V # [c-mol/h]
        eq_serine: -> serine; rp_s - F*serine/V
        eq_glucose: -> glucose; r_s - F*glucose/V - 0.0001# [mol/h]
        eq_V: -> V; F 



        end
    '''

    r = te.loada(fermentation_model)
    return r


def batch_model_mu():
    fermentation_model = '''
    model *IDModel()

        ######## Set the compartment to 1, otherwise it will be multiplied by the compounds. 
        compartment comp1;
        comp1 =1;


        ######## Specify the species in the compartment
        glucose in comp1; serine in comp1; biomass in comp1;


        ######## Constants
        alpha = 29.1 #21.542 #24.6807; # Check units
        beta = 68.8 #90.2844 #67.3047; # Check units
        mu_max = 0.98 #0.327912 #0.260172; # [1/h]
        kc = 7.48 #1.24659 #1.05221; # [mol/kg] # Kc? 
        a = -0.2572;
        b = -0.7651;
        ms = -0.0046; 


        ######## Initial conditions
        glucose = 8.254856e-06*1000 # [mol] 
        serine = 0 #c_serine0*comp1 # [mol]
        biomass = 5.538306e-07*1000 # [mol]
        v0 = 0.00010428; #[m^3]


        ######## Function for volume
        v := 0.00010302999999999999-(0.00000121*time) #[m^3]

        ######## Concentrations that is used in the equations
        c_glucose := glucose/v  # [mol/m^3]
        c_biomass := biomass/v # [mol/m^3] 

        ######## Functions

        mu = 0.12345 # This mu value is not used, it has this value so it can be easily found in the xml written model
        qp_s := alpha*mu/(beta+mu) # [mol_serine/(c-mol_biomass*h)]
        qs_g := a*mu + b*qp_s + ms #[mol_glucose/(c-mol_biomass*h)]
        rp_s := qp_s*biomass # [mol/h] 
        r_s := qs_g*biomass # [mol/h]


        ######## Mass Balances    
        eq_biomass: -> biomass; mu*biomass # [c-mol/h]
        eq_serine: -> serine; rp_s
        eq_glucose: -> glucose; r_s # [mol/h]



        end
    '''

    r = te.loada(fermentation_model)
    return r