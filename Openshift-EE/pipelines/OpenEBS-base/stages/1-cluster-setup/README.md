### Test bed setup.

#### Description

This stage includes the job that will configure OpenShift-3.10 enterprise cluster and check if it is healthy for carrying out the e2e tests.

#### Prerequisites

 - The host environment should be setup and it should have the dependencies installed.

#### Procedure
 
 - The job should be capable of creating OpenShift 3.10 cluster with one master and 4 nodes configuraion. 

 - Check if the OpenShift cluster is ready using kubectl command ```kubectl get nodes```

#### Test Result


