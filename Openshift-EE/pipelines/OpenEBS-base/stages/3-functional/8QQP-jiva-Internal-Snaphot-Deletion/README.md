### 8QQP-Verify Jiva-Internal-Snapshot Deletion

#### Description

This test ensures that the Jiva Internal Snaphot get Deleted.
#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva based storage class should be present.

#### Procedure

- This job triggers the litmus experiments which restarts jiva replicas to create internal snapshots.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This litmus experiment creates 15 internal snaphots by restrating the replicas.
- Finally, it checks if the snapshot is getting deleted.

#### Expected result

- The number intenal snapshots presend should be less that 11.

#### Test Result