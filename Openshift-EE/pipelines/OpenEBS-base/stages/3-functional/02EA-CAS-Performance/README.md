### 02EA- Deploy Application in a storage class with specific CAS parametes.

#### Description

The goal of this test is to deploy busybox application in a storage class created with specific CAS parametes.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim and a specific CAS parametes.

#### Procedure

- This job triggers the litmus experiments which deploy the application using CAS specific storage class.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- The job Pumps data traffic and check application liveness.
- It checks if the application is running successfully.

#### Expected result

- Application should be runnig with the storage class created.

#### Test result


