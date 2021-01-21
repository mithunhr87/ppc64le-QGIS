#!/bin/bash

#Attribution: This is just demonstation of how one can use QGIS inside docker container for a architecture like ppc64le. Please refer to https://www.qgis.org ,for complete introduction and details about the free opensource professional and powerful desktop GIS. QGIS documentation: https://www.qgis.org/en/docs/index.html

# Set the display
export DISPLAY=:20

# strat the vnc session
Xvfb :20 -screen 0 1366x768x16 &
x11vnc -passwd TestVNC -display :20 -N -forever &

#Start qgis
/usr/bin/qgis
