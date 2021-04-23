# ut_smads_simulation
A simulation meta repository for running the SMADS system using the UT_multirobot_sim from UT_AMRL.

This is a one-stop repository to simulate a robot. Once this simulation is running, the SMADS system can be deployed just as it would on a real robot.


# Quick Start

## Installation
1. Clone locally in the directory of your choice:
 
  ``` $ git clone https://github.com/UTSMADS/ut_smads_simulation.git --recursive ```

2. Add these packages to your ROS_PACKAGE_PATH. You should only need to do this once

   ``` $ ./SetupPath ```

3. Install dependent packages

   ``` $ ./InstallPackages ```

4. Manually install ceres according to its [install guide](http://ceres-solver.org/installation.html#linux)

## Compiling 
In the root of the `ut_smads_simulation` repo folder, simply run 

   ``` $ make ```

## Running
In the root of the `ut_smads_simulation` repo folrder, simply run

   ``` $ ./run_smads_sim.bash ```

this will spawn a number of terminal windows, a roscore and an RViz visualization. 
If you don't want to, or can't, visualize locally, you can edit the above script and turn off the visualization flag.
Similarly, if a roscore is already running, that flag can also be adjusted in the script.

## Configuration Overview
The relevant files to change maps, navigation or localization parameters live in the `config` directory. 
These files can be modified or cloned for other robot configurations.

### Changing maps

To change the map, you will need to modify the following files:
- `config/enml/ut_jackal.lua` under the field `map_name`
- `config/sim/default_init_config.lua` under the field `map_name`

Note that the `starting_loc_*` listed under `config/enml/ut_jackal.lua` should match that of the `start_poses` under `config/sim/default_init_config.lua` for the simulation to work 'out of the box'. Otherwise, you will need to give ENML a new pose estimate to match the robot's actual position in the simulator.



