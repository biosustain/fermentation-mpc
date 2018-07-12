import os
from bs4 import BeautifulSoup

# Needs to be done to generalize the program:
# 1) Delete 1 experimental data if there is only 1 experimental data to estimate from.
# 2) Delete and create more parameters that needs to be estimated.
# 3) Set length of experimental data
# 4) Choose the step size
# 5) Choose the parameter estimation algorithm

def parameter_estimation(experimental_data1,experimental_data2,
                         parameter_1_lower_bound,parameter_1_upper_bound,
                         parameter_2_lower_bound,parameter_2_upper_bound,
                         parameter_3_lower_bound,parameter_3_upper_bound,
                         parameter_4_lower_bound,parameter_4_upper_bound):
    # From cps to xml
    os.rename('model_copasi.cps', 'model_copasi.xml')

    soup = BeautifulSoup(open('model_copasi.xml', 'r'), 'xml')
    infile = open('model_copasi.xml', "w")

    # Choose filename for experimental dataset nr 1
    Experiment_0 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "Experiment"][0]
    file_name = [s for s in Experiment_0.find_all("Parameter") if s["name"] == "File Name"][0]
    file_name["value"] = experimental_data1  # Here we type the filename of the data

    # Choose filename for experimental dataset nr 2
    Experiment_1 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "Experiment_1"][0]
    file_name = [s for s in Experiment_1.find_all("Parameter") if s["name"] == "File Name"][0]
    file_name["value"] = experimental_data2  # Here we type the filename of the data

    # Parameters:

    parameter_1 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][0]
    lower_bound_1 = [s for s in parameter_1.find_all('Parameter') if s['name'] == "LowerBound"][0]
    # Set lower bound instead of 0.
    lower_bound_1['value'] = parameter_1_lower_bound
    upper_bound_1 = [s for s in parameter_1.find_all('Parameter') if s['name'] == "UpperBound"][0]
    # Set upper bound instead of 100.
    upper_bound_1['value'] = parameter_1_upper_bound

    parameter_2 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][1]
    lower_bound_2 = [s for s in parameter_2.find_all('Parameter') if s['name'] == "LowerBound"][0]
    # Set lower bound instead of 0.
    lower_bound_2['value'] = parameter_2_lower_bound
    upper_bound_2 = [s for s in parameter_2.find_all('Parameter') if s['name'] == "UpperBound"][0]
    # Set lower bound instead of 100.
    upper_bound_2['value'] = parameter_2_upper_bound

    parameter_3 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][2]
    lower_bound_3 = [s for s in parameter_3.find_all('Parameter') if s['name'] == "LowerBound"][0]
    # Set lower bound instead of 0.
    lower_bound_3['value'] = parameter_3_lower_bound
    upper_bound_3 = [s for s in parameter_3.find_all('Parameter') if s['name'] == "UpperBound"][0]
    # Set lower bound instead of 100.
    upper_bound_3['value'] = parameter_3_upper_bound

    parameter_4 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][3]
    lower_bound_4 = [s for s in parameter_4.find_all('Parameter') if s['name'] == "LowerBound"][0]
    # Set lower bound instead of 0.
    lower_bound_4['value'] = parameter_4_lower_bound
    upper_bound_4 = [s for s in parameter_4.find_all('Parameter') if s['name'] == "UpperBound"][0]
    # Set lower bound instead of 100.
    upper_bound_4['value'] = parameter_4_upper_bound

    infile.write(soup.prettify().encode(soup.original_encoding))
    infile.close()

    # From xml to cps
    os.rename('model_copasi.xml', 'model_copasi.cps')

    # Run the parameterestimation in Copasi for the model from the terminal
    # A report of parameters is also written as parameter_report
    #os.system("/Applications/COPASI/CopasiSE model_copasi.cps --save model_copasi.cps")
    os.system("/Users/s144510/Documents/fermentationtool/CopasiSE model_copasi.cps --save model_copasi.cps")

    # Get the results
    os.rename('model_copasi.cps', 'model_copasi.xml')
    soup = BeautifulSoup(open('model_copasi.xml', 'r'), 'xml')
    # infile = open('test.xml', "w")

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
    # infile.write(soup.prettify().encode(soup.original_encoding))


    infile.close()
    os.rename('model_copasi.xml', 'model_copasi.cps')

    return alpha, beta, kc, mu_max

