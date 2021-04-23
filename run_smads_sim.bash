#!/bin/bash
RUN_ROSCORE=1;
RUN_RVIZ=1;
RUN_VECTOR_DISPLAY=1;

if [ $RUN_ROSCORE ]
then
    gnome-terminal -- roscore;
fi

gnome-terminal -- ./bin/simulator --sim_config config/sim/sim_config.lua;
gnome-terminal -- ./bin/enml -r ut_jackal.lua -c config/enml -m enml/maps;
gnome-terminal -- ./bin/navigation --twist_drive_topic robot0/navigation/cmd_vel --robot_config config/navigation/navigation.lua --maps_dir enml/maps;
gnome-terminal -- rostopic pub /autonomy_arbiter/enabled std_msgs/Bool "data: true" -r 1;

if [ $RUN_RVIZ ]
then
    gnome-terminal -- rosrun rviz rviz -d config/visualization.rviz;
fi

