### P7Q4 - Deprovision the Mirrored Storage Pool Claim.

#### Description

Administrator should be able to use this job to cleanup the OpenEBS cStor SPC pools.

#### Prerequisites

- OpenShift cluster should be ready.
- Pool pods will be availabe in the cluster.

#### Procedure

- This job triggers litmus experiment which cleanup the SPC Mirrored pool in openshift cluster.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest accordingly.
- Deprovision the SPC pool based on the specified environmental variable.
- This test checks if the desired pool is cleaned completely.
- Finally, this job updates the result CR with the actual result.

#### Expected result

- cStor Mirrored SPC and pool pods should be Removed from the cluster.
- BlockDevices should be Unclaimed.

#### Test Result