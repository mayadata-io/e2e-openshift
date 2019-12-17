### XC0I - Deprovision the CSPC Stiped Storage Pool.

#### Description

Administrator should be able to use this job to cleanup the OpenEBS cStor CSPC pools.

#### Prerequisites

- OpenShift cluster should be ready.
- Pool pods will be availabe in the cluster.

#### Procedure

- This job triggers litmus experiment which cleanup the CSPC striped pool in openshift cluster.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest accordingly.
- Deprovision the CSPC pool based on the specified environmental variable.
- This test checks if the desired pool is cleaned completely.
- Finally, this job updates the result CR with the actual result.

#### Expected result

- cStor striped CSPC and pool pods should be Removed from the cluster.
- BlockDevices should be Unclaimed.

#### Test Result