import os
from bs4 import BeautifulSoup

# Needs to be done to generalize the program:
# 2) Delete and create more parameters that needs to be estimated.
# 4) Choose the step size
# 5) Choose the parameter estimation algorithm
# 6) Change attributes of estimation algorithm like step size or population size..


def parameter_estimation_online_fedbatch(experimental_data1,
                         parameter_1_lower_bound,parameter_1_upper_bound,
                         parameter_2_lower_bound,parameter_2_upper_bound,
                         parameter_3_lower_bound,parameter_3_upper_bound,
                         parameter_4_lower_bound,parameter_4_upper_bound,
                         parameter_5_lower_bound,parameter_5_upper_bound,
                         parameter_6_lower_bound,parameter_6_upper_bound,
                         parameter_7_lower_bound,parameter_7_upper_bound,
                         model_for_parest, number_of_first_row, number_of_last_row):
    '''
    Parameters estimation in copasi

    :param experimental_data1: path of the data that needs to be fitted against
    :param parameter_1_lower_bound: lower bound for parameter 1
    :param parameter_1_upper_bound: upper bound for parameter 1
    :param parameter_2_lower_bound: lower bound for parameter 2
    :param parameter_2_upper_bound: upper bound for parameter 2
    :param parameter_3_lower_bound: lower bound for parameter 3
    :param parameter_3_upper_bound: upper bound for parameter 3
    :param parameter_4_lower_bound: lower bound for parameter 4
    :param parameter_4_upper_bound: upper bound for parameter 4
    :param parameter_5_lower_bound: lower bound for parameter 5
    :param parameter_5_upper_bound: upper bound for parameter 5
    :param parameter_6_lower_bound: lower bound for parameter 6
    :param parameter_6_upper_bound: upper bound for parameter 6
    :param parameter_7_lower_bound: lower bound for parameter 7
    :param parameter_7_upper_bound: upper bound for parameter 7
    :param model_for_parest: path of the cps copasi file, which contains the model
    :param number_of_first_row: first row of the data that is used for fitting
    :param number_of_last_row: second row of the data that is used for fitting
    :return: all estimated parameters from the parameter estimation task
    '''


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


    # Set bounds for parameters:

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

    parameter_5 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][4]
    lower_bound_5 = [s for s in parameter_5.find_all('Parameter') if s['name'] == "LowerBound"][0]
    lower_bound_5['value'] = parameter_5_lower_bound
    upper_bound_5 = [s for s in parameter_5.find_all('Parameter') if s['name'] == "UpperBound"][0]
    upper_bound_5['value'] = parameter_5_upper_bound

    parameter_6 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][5]
    lower_bound_6 = [s for s in parameter_6.find_all('Parameter') if s['name'] == "LowerBound"][0]
    lower_bound_6['value'] = parameter_6_lower_bound
    upper_bound_6 = [s for s in parameter_6.find_all('Parameter') if s['name'] == "UpperBound"][0]
    upper_bound_6['value'] = parameter_6_upper_bound

    parameter_7 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][6]
    lower_bound_7 = [s for s in parameter_7.find_all('Parameter') if s['name'] == "LowerBound"][0]
    lower_bound_7['value'] = parameter_7_lower_bound
    upper_bound_7 = [s for s in parameter_7.find_all('Parameter') if s['name'] == "UpperBound"][0]
    upper_bound_7['value'] = parameter_7_upper_bound


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

    result_parameter_5 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][4]
    result_parameter_5 = [s for s in result_parameter_5.find_all('Parameter') if s['name'] == "StartValue"][0]
    Ki = result_parameter_5['value']

    result_parameter_6 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][5]
    result_parameter_6 = [s for s in result_parameter_6.find_all('Parameter') if s['name'] == "StartValue"][0]
    Ks = result_parameter_6['value']

    result_parameter_7 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][6]
    result_parameter_7 = [s for s in result_parameter_7.find_all('Parameter') if s['name'] == "StartValue"][0]
    mu_max = result_parameter_7['value']


    infile.close()
    os.rename('/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.xml',
              '/Users/s144510/Documents/Bachelorproject/fermentation-mpc/' + model_for_parest + '.cps')

    return alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max

