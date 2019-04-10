### QDLO-Jiva-Data integrity Test

#### Description

This test ensures the data integrity in Jiva based openebs volume using the tool fio.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- jiva based storage pool should have been created.
- OpenEBS storage class using jiva cas-type should be created.

#### Procedure

- This job triggers the litmus experiments which checks if the data integrity is maintained in OpenEBS jiva volume using fio.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job deploys an application using jiva based openebs storage class.
- It uses fio tool to pump data traffic inside the application mount path.
- And then, it induces failure in corresponding jiva controller pod.
- Finally, it checks if the storage controller is recovered and ensures data integrity using fio

#### Expected result

- There should not be any io error observed.

#### Test Result

