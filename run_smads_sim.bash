#!/bin/bash
gnome-terminal -e "bash -c \"roscore; exec bash\"";
gnome-terminal -e "bash -c \"./bin/simulator --sim_config config/sim/sim_config.lua; exec bash\"";
gnome-terminal -e "bash -c \"./bin/enml -r ut_jackal.lua -c config/enml -m enml/maps; exec bash\"";
gnome-terminal -e "bash -c \"./bin/navigation --twist_drive_topic robot0/navigation/cmd_vel --robot_config config/navigation/navigation.lua --maps_dir enml/maps ; exec bash\""
gnome-terminal -e "bash -c \"rosrun rviz rviz -d config/visualization.rviz ; exec bash\""
