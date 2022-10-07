FROM osrf/ros:humble-desktop-full

RUN DEBIAN_FRONTENT=non-interactive apt-get update && apt install emacs -yq

COPY moon.sdf /moon.sdf

RUN ign  fuel download -u https://fuel.gazebosim.org/1.0/Hyundai/models/Moon

## Fix for error

# Error [parser.cc:729] Error finding file [/root/.ignition/fuel/fuel.gazebosim.org/hyundai/models/moon/tip].
# [Err] [Server.cc:139] Error Code 1: [/sdf/world[@name="moon"]/include[0]/uri:/moon.sdf:L186]: Msg: Unable to read file[/root/.ignition/fuel/fuel.gazebosim.org/hyundai/models/moon/tip]
# [Err] [Server.cc:139] Error Code 9: [/sdf/world[@name="moon"]:/moon.sdf:L2]: Msg: Error reading element <world>
# [Err] [Server.cc:139] Error Code 9: Msg: Error reading element <sdf>
# [Err] [Server.cc:139] Error Code 1: Msg: Unable to read file:/moon.sdf


RUN cd ~/.ignition/fuel/fuel.gazebosim.org/hyundai/models/moon/ && ln -s 1 tip

COPY moon.config /moon.config

CMD bash -c 'ign gazebo moon.sdf --gui-config moon.config'

# Tune the level of resolution with the below substitution 4096 will be per meter making this number larger will stretch the texture that's repeated.

RUN sed -i 's/4960/40960/' ~/.ignition/fuel/fuel.gazebosim.org/hyundai/models/moon/1/model.sdf
