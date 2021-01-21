# ppc64le - qgis
Simple demonstation of qgis (https://www.qgis.org)sample docker file for ppc64le. Docker container that runs QGIS Server on ppc64le

Attribution:
This is just demonstation of how one can use QGIS inside docker container for a architecture like ppc64le, and not original work.
Please refer to https://www.qgis.org ,for complete introduction and details about the free opensource professional and powerful desktop GIS.
QGIS documentation: https://www.qgis.org/en/docs/index.html

Steps to build a sample docker image on ppc64le using these files

Step 1:Clone the repositoy, Navigate to ppc64le-qgis

Step 2: docker build -t "image name:version" .

Step 3: docker run -it -p 5920:5920 "image name:version"  
Note: port could be changed in the Dockerfile and the entrypoint.sh script from 5920 as needed, 5920 port is mapped to access qgis from host

Step4: once the container is running,  Install a vnc client on the host and connect to application insde the container. TestVNC is the password, can be changed in entrypoint.sh script as needed. qgis running inside a container will appear on successfull connection to vnc




Maintainers of these sample dockerfile and script

Krishna Harsha Voora

Mithun H R
