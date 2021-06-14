#!/bin/bash

#Attribution: This is just demonstation of how one can use QGIS inside docker container for a architecture like ppc64le. Please refer to https://www.qgis.org ,for complete introduction and details about the free opensource professional and powerful desktop GIS. QGIS documentation: https://www.qgis.org/en/docs/index.html

# Set the display
export DISPLAY=:20

# strat the vnc session
Xvfb :20 -screen 0 1366x768x16 &
x11vnc  -noxrecord -passwd TestVNC -display :20 -N -forever &

git clone https://github.com/novnc/novnc

ln -sf /novnc/vnc.html /novnc/index.html

#ENTRYPOINT /novnc/utils/launch.sh --vnc :5920

#Start qgis
/usr/bin/qgis /shapefiles/alaska.shp &

#apt-get install python3

/novnc/utils/launch.sh --vnc :5920
