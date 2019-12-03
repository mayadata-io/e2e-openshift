### 29O5-Fill OpenEBS volume with data.

#### Description
The job fills the cStor volume with data.

#### Prerequisites

- OpenShift cluster should be created.
- OpenEBS should be deployed in K8s cluster.
- cStor Storage pool should be created.

#### Procedure

- This job triggers the litmus experiments which is capable of deploying busybox application using OpenEBS volumes, filling the volume and deprovision the volume.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest accordingly.
- The first litmus experiment deploys busybox application and verifies if it is deployed successfully.
- The preceding litmus experiment uses fio tool to pump io traffic and checks if there is any io error.
- It also checks if the data can be filled upto the maximum capacity of volume.
- Finally, this job updates the result CR with the actual result.

#### Expected result

- The busybox application should be deployed successfully.
- The volume should be filled upto maximum capacity without any errors.
- Deprovisioning the application and its corresponding PVC should be successful.

#### Test Result
