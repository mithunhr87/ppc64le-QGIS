# Sample Docker image to run on  IBM PowerPC Linux (ppc64le)
# This is just to demonstrate how QGIS can be installed on ppc64le

#Attribution: This is just demonstation of how one can use QGIS inside docker container for a architecture like ppc64le. Please refer to https://www.qgis.org ,for complete introduction and details about the free opensource professional and powerful desktop GIS. QGIS documentation: https://www.qgis.org/en/docs/index.html  

# Base image ubuntu for ppc64le
FROM ppc64le/ubuntu:18.04

RUN apt-get update

# Install qgis as per qgis documentation https://www.qgis.org/en/docs/index.html
RUN apt-get install qgis -y
# copy all the scripts to working directory (entrypoint.sh)
ADD entrypoint.sh /

COPY qgis_sample_data / 
# change the work directory
WORKDIR /
# install vnc
RUN  apt-get install -y git x11vnc xvfb

# expose a port 5920 in order to connect to qgis gui
EXPOSE 5920

# change  the permission to entrypoint.sh
RUN chmod +x  /entrypoint.sh

#make script to be run at the start 
ENTRYPOINT ["/entrypoint.sh"]
