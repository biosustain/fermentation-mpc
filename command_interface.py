import click
from modelprediction_CO2 import run_mp
from functions.data_modifier import modify_onlinedata
import pandas as pd

@click.command()

@click.option('--path_mpc', prompt='Path for mpc-program folder',
              help='Path for mpc-program folder, where the COPASI command line program is located')
@click.option('--path_onlinedata', prompt='Path for file with the online data',
              help='Path for file with the online data, which has to have the extension .csv')
def set_mpcfolder_path(path_mpc, path_onlinedata):
    """Command line tool to specify inputs in mpc-program before running the program."""
    click.echo(path_mpc)
    click.echo(path_onlinedata)
    print('Program has been initialized')

    online_data = pd.read_csv(path_onlinedata)
    data_frame_selected_values = modify_onlinedata(online_data)
    #print(data_frame_selected_values)

    # feed_column = data_frame_selected_values.filter(regex='Feed')
    # count_feed_elements = feed_column[feed_column > 0].count()

    #printonce = True

    # while (count_feed_elements[0] < 2):
    #     if printonce == True:
    #         print('asfd')
    #         printonce = False

    #count_feed_elements[0] >= 2
    print('It may take some time before the algorithm has finished first cycle of model predictive control')
    run_mp(path_mpc, path_onlinedata)

    # else:
    #     print('waiting for data in the fed batch phase')

if __name__ == '__main__':
    set_mpcfolder_path()
