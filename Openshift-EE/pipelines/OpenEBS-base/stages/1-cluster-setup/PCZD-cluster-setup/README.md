### PCZD- OpenShift Cluster setup.

#### Description

The administrator should be able to use this job to configure OpenShift-3.10 enterprise cluster in vSphere based virtual machines and check if it is healthy for carrying out e2e tests.

#### Prerequisites

- The host machines should be created and have the dependent packages installed in all the machines.

#### Procedure

- This job triggers a litmus experiment which configures OpenShift enterprise cluster using its corresponding inventory.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the inventory accordingly.
- This test should check if the OpenShift cluster is ready using kubectl command ```kubectl get nodes```

#### Expected result

- OpenShift enterprise cluster should be configured successfully. All the nodes in the cluster should be in healthy state. 

#### Test Result
