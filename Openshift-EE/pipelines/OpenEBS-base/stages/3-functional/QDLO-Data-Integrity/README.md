### QDLO-Data integrity Test

#### Description

This test ensures the data integrity in openebs volume using the tool fio.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which checks if the data integrity is maintained in OpenEBS volume using fio.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job deploys an application using openebs storage class.
- It uses fio tool to pump data traffic inside the application mount path.
- And then, it induces failure in corresponding cstor target pod.
- Finally, it checks if the target is recovered and ensures data integrity using fio

#### Expected result

- There should not be any io error observed.

#### Test Result


