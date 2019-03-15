### OpenEBS Storage classes creation

#### Description

This job creates different storage classes adhering to various policies supported by OpenEBS.

#### Prerequisites

- Fully functional OpenShift cluster
- OpenEBS deployed

#### Procedure

This job trigger the litmus book which creates the storage classes. 

The policies supported by OpenEBS can be found in

  https://docs.openebs.io/configuresc.html#cstor-storage-policies

#### Expected result

The desired storage classes should be created successfully.

#### Test result

