# fermentation-mpc
Model predictive control (MPC) for fermentations

## Description
This program is used for modelling, optimizations and model driven control for fermentations. It is using a particular serine model based on
mass balances and you can either run and/or change settings in the backend version mainscript.py or run the interface
version fermentationtool.py which is build on the framework dash.

![](/images/interface.png)
Note that these plot are not correct since it is build on 2 different sets of experimental data.

## Requirements
The project uses pipenv to handle virtual environment. <br />
Install pipenv here [pipenv installation](https://github.com/pypa/pipenv#installation)

## Installing

To activate the project
```
pipenv shell
```

Install the necessary dependencies
```
pipenv install
```

## Usage of the main script

#### Models
The program contains 3 different models. One batch model and one fed batch model where the growth rate is defined as
a function and a batch model mu where the growth rate is defined as constant. The last one is used for the model predictive control.

The models can be loaded and saved as
```
r = batch_model()
r = fed_batch_model()
r = batch_model_mu()
```

#### Simulation

#### Experimental data

#### Plot

#### Parameter estimation

#### Model driven prediction

## Usage of the GUI fermentationtool.py

#### Experiments

#### Online data integration









