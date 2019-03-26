### PCZD- OpenShift Cluster setup.

#### Description

The admin should be able to use this job to configure OpenShift-3.10 enterprise cluster in vSphere based virtual machines and check if it is healthy for carrying out e2e tests.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.

#### Procedure

- The job should be capable of creating OpenShift 3.10 cluster with one master and 4 nodes configuraion. 
- The test should check if the OpenShift cluster is ready using kubectl command ```kubectl get nodes```

#### Expected result

- Cluster should be configured successfully. All the nodes should be in `ready` state.

#### Test Result
