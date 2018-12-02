
import matplotlib
matplotlib.use('TkAgg')


##### For the automatic feeding approach (has to be added in both functions)
# try:
#     my_abs_path = my_file.resolve()
#     mu_set_opdated = pd.read_csv('mu_set.csv')
#     print(mu_set_opdated)
#     #print(mu_set_opdated['mu_set'].values, 'hello')
#
#     mu_set_opdated = float(mu_set_opdated['mu_set'].values)
#     r.mu_set = mu_set_opdated
#     print(r.mu_set)
#
# except OSError:
#     pass


def model_feed_settings(fp, data_frame, alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max):
    '''
    This function simulates the model, but first resets to origin and input start values from simulated values (data_frame)

    :param fp: fed batch model
    :param data_frame: data frame with simulated values
    :param alpha: estimated parameter alpha
    :param beta: estimated parameter beta
    :param Ks_qs: estimated parameter Ks_qs
    :param qs_max: estimated parameter qs_max
    :param Ki: estimated parameter Ki
    :param Ks: estimated parameter Ks
    :param mu_max: estimated parameter mu_max

    '''
    fp.resetToOrigin()
    fp.alpha = float(alpha)
    fp.beta = float(beta)
    fp.Ks_qs = float(Ks_qs)
    fp.qs_max = float(qs_max)
    fp.Ki = float(Ki)
    fp.Ks = float(Ks)
    fp.mu_max = float(mu_max)
    fp.biomass = data_frame['Biomass (g)'].iloc[-1]
    fp.serine = data_frame['Serine (g)'].iloc[-1]
    fp.glucose = data_frame['Glucose (g)'].iloc[-1]
    fp.V = data_frame['V'].iloc[-1]


def model_feed_settings_loop(fp, data_frame, alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max, j):
    '''
    This function simulates the model in the loop, and first resets and input start values from simulated values (data_frame)

    :param fp: fed batch model
    :param data_frame: data frame with simulated values
    :param alpha: estimated parameter alpha
    :param beta: estimated parameter beta
    :param Ks_qs: estimated parameter Ks_qs
    :param qs_max: estimated parameter qs_max
    :param Ki: estimated parameter Ki
    :param Ks: estimated parameter Ks
    :param mu_max: estimated parameter mu_max

    '''
    fp.reset()
    fp.mu_set = j
    fp.alpha = float(alpha)
    fp.beta = float(beta)
    fp.Ks_qs = float(Ks_qs)
    fp.qs_max = float(qs_max)
    fp.Ki = float(Ki)
    fp.Ks = float(Ks)
    fp.mu_max = float(mu_max)
    fp.biomass = data_frame['Biomass (g)'].iloc[-1]
    fp.serine = data_frame['Serine (g)'].iloc[-1]
    fp.glucose = data_frame['Glucose (g)'].iloc[-1]
    fp.V = data_frame['V'].iloc[-1]
