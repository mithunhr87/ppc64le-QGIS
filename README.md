Demonstation of qgis (https://www.qgis.org) on ppc64le. 
Here, we have supplied a Dockerfile to build container image that runs QGIS Server on ppc64le

Attribution: 
This is just demonstation of how one can use QGIS inside docker container for an architecture like ppc64le, and not original work. 
Please refer to https://www.qgis.org ,for complete introduction and details about the free opensource professional and powerful desktop GIS.

QGIS documentation: https://www.qgis.org/en/docs/index.html

# Steps to build a sample docker image on ppc64le 

Step 1: Clone the repositoy, Navigate to ppc64le-qgis

```
$ git clone https://github.com/mithunhr87/ppc64le-qgis.git
$ cd ppc64le-qgis

```

Step 2: Build the docker image , Please substitute the image name and version you prefer in below command

```
$ export IMAGE=ppc64le
$ export TAG=qgis
$ docker build -t  $IMAGE:$TAG .

```

Step 3: Run the docker image with port mapping , first entry will be hostport, second port entry is container port, Here we have used 6080 at both the places
        The docker image uses noVNC - https://github.com/novnc/noVNC to provision VNC to browser

```
$ docker run -it -p 6080:6080 $IMAGE:$TAG

```

Step4: once the container is running, Navigate to ``` http://<hostname>:6090/vnc.html ```, TestVNC is the password, can be changed in entrypoint.sh script as needed. qgis running inside a container will appear on successfull connection to vnc

A sample .shp file of Alaska will appear on the qgis, However you can open and use any gis supported file/project 


#  Deployment on OpenShift

To deploy newly built qgis container image for ppc64le architecture, navigate to ppc64le-qgis repository

1. Logon to OpenShift 

```
$ oc login -u <username> -p <password>

```

2. Create a new project in the OCP -

```
$ export PROJECT=ppc64le_isv
$ oc new-project $PROJECT
```

3. Update the security constraint, as shown below -
```
$ oc adm policy add-scc-to-user privileged -z default -n <project name>

$ oc adm policy add-scc-to-user anyuid -z default -n <project name>
```
4. Create the deployment, Update Namespace as project name which you have used in step 2, other fields could be modified if required but not mandatory
```
$ oc create -f deployment.yaml
```

5. create the service, Update Namespace as project name, again ther fields could be modified if required but not mandatory
```
$ oc create -f service.yaml
```

6. Expose the qgis service here our qgis service name is *qgis-service*
```
$ oc expose service qgis-service
```

7. Query  the route 
```
$ oc get route
```

8. The route name will have host/port filed which is the link to access the noVNC client
For example
```
$ oc get route
NAME           HOST/PORT                                         PATH   SERVICES       PORT   TERMINATION   WILDCARD
qgis-service   qgis-service-mithunhr.apps.p1258.cecc.ihost.com          qgis-service   6080                 None
```
`qgis-service-mithunhr.apps.p1258.cecc.ihost.com` Is your route to access the application.


9. Navigate via web browser, click the route as shown in Step 8

![image](https://user-images.githubusercontent.com/59821167/121920113-55c7be00-cd55-11eb-962c-20cb752dc70f.png)


10. Click to connect


11. Enter password for VNC - here it is TestVNC

![image](https://user-images.githubusercontent.com/59821167/121920290-87408980-cd55-11eb-8140-5faaca25073b.png)


12. you would  see a sample map of Alaska loaded , You can open and work on any supported QGIS project or file 

![image](https://user-images.githubusercontent.com/59821167/121920417-a5a68500-cd55-11eb-8dc1-b73f95b2ce31.png)


Maintainers of these sample dockerfile and script

_Krishna Harsha Voora @krishvoor_

_Mithun H R @mithunhr87_

_Sahitya Jain @Sahityakrj_
