Simple demonstation of qgis (https://www.qgis.org)sample docker file for ppc64le. Docker container that runs QGIS Server on ppc64le

Attribution: This is just demonstation of how one can use QGIS inside docker container for a architecture like ppc64le, and not original work. Please refer to https://www.qgis.org ,for complete introduction and details about the free opensource professional and powerful desktop GIS. QGIS documentation: https://www.qgis.org/en/docs/index.html

Steps to build a sample docker image on ppc64le using these files

Step 1: Clone the repositoy, Navigate to ppc64le-qgis
```
git clone https://github.com/mithunhr87/ppc64le-qgis.git

```

Step 2: Build the docker image , Please substitute the image name and version you prefer in below command
```
docker build -t "image name:version" .

```

Step 3: Run the docker image with port mapping , first entry will be hostport, second port entry is container port, Here we have used 6080 at both the places
        The docker image uses noVNC - https://github.com/novnc/noVNC to provision VNC to browser

```
docker run -it -p 6080:6080 "image name:version"

```

Step4: once the container is running, Navigate to ``` http://<hostname>:6090/vnc.html ```, TestVNC is the password, can be changed in entrypoint.sh script as needed. qgis running inside a container will appear on successfull connection to vnc

A sample .shp file of Alaska will appear on the qgis, However you can open and use any gis supported file/project 


OpenShift Deployment

Navigate to Openshift folder inside cloned ppc64le-qgis folder
1. Login to OpenShift 
```
$oc login - u <username> -p <password>

```
2. Create the new project in the OpenShift , Substitute the project name as per your requirement in below commands
```
$oc new-project <project name>
```
3. Update the security constraint as below, 
```
$oc adm policy add-scc-to-user privileged -z default -n <project name>

$oc adm policy add-scc-to-user anyuid -z default -n <project name>
```
4. Create the deployment, Update Namespace as project name which you have used in step 2, other fields could be modified if required but not mandatory
```
$ oc create -f deployment.yaml
```
5. create the service, Update Namespace as project name, again ther fields could be modified if required but not mandatory
```
$ oc create -f service.yaml
```
6. Expose the qgis service here our qgis service name is qgis-service
```
$ oc expose service qgis-service
```
7. Query  the route 

```
oc get route
```
8. The route name will have host/port filed which is the link to access the noVNC client
For example
```
 oc get route
NAME           HOST/PORT                                         PATH   SERVICES       PORT   TERMINATION   WILDCARD
qgis-service   qgis-service-mithunhr.apps.p1258.cecc.ihost.com          qgis-service   6080                 None

qgis-service-mithunhr.apps.p1258.cecc.ihost.com - This is the link to use
```


Maintainers of these sample dockerfile and script

Krishna Harsha Voora @krishvoor

Mithun H R @mithunhr87

Sahitya Jain @Sahityakrj
