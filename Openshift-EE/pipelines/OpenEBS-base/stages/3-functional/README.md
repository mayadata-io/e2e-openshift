### Goal of this stage

The goal of this gitlab stage is to carry out OpenEBS data and control plane functionality tests in OpenShift Cluster test bed.

### Test cases matrix:

The test cases covered in the functional stage are as follows:

| S.No | TID  | Test case description                                        |
| ---- | ---- | ------------------------------------------------------------ |
| 1    | 9AKX | Verify if the snapshot can be created for cStor based persistent volume  |
| 2    | ZK9B | Check if the clone can be created using cStor volume snapshot.     |
| 3    | QDLO | Ensure the data integrity in openebs volume using fio.       |
| 4    | OBS2 | Check if the memory consumption doesn't cross the desired threshold for known workload. |
| 5    | 5O5V | Make sure that the parent volume cannot be deleted in presence of its clones. |
| 6    | 4E0O | Check if the Jiva storage replicas can be scaled up.         |
| 7    | WHAP | Check if the volume can be filled completely.                |
| 8    | 4ZWU | Check if the storage volume replicas are distributed across the storage pools in case of statefulset deployment. |
| 9    | VTPW | Check if the cStor volume can be Moved from one pool to another available pool successfully. |
| 10   | ZD8F | Scale the statefulset application replicas and verify the ring configuration. |
| 11   | CL2N | Verify is the snapshot can be created for Jiva Volume that successfully. |
| 12   | FSJT | Check if the Controller pod gets scheduled on the node where the application pod is running adhering target pod affinity. |
| 13   | 36CY | Scale Down the cStor Volume Replica and check the status. |
| 14   | VZFL | Check if the Target pod gets scheduled on the node where the application pod is running adhering target pod affinity. |
| 15   | Y4ET | VerifCheck if the clone can be created using JIVA volume snapshot. |
| 16   | NWQB | Verify the Backup and Restore functionality of a JIVA based volume using Velero plugins |
| 17   | JAIP | Verify if statefulset application replica and cstor target pod are scheduled on same node |
| 18   | KUL9 | Verify if application replicas consuming jiva volumes can be scaled up. |
| 19   | SN3A | Check if the memory consumption in jiva controller doesn't cross the desired threshold for known workload. |
| 20   | UH9A | Ensure the data integrity in jiva based openebs volume using fio. |
| 21   | UURF | Verify if application replica pod and its corresponding jiva controller pod are scheduled on same node |
| 22   | 02EA | Deploy Application using storage class with specific CAS parameters |
| 23   | 3PZ0 | Verify the Backup and Restore functionality of a cStor based volume using Velero plugins |
| 24   | 4Q90 | Deploy application using JIVA storage engine and schedule the controller and replica pods in openebs namespace |
| 25   | 5EA0 | Verify the Backup and Restore functionality of a LocalPV hostpath based volume using Velero plugins |
| 26   | 6RQL | Ensures that the clone volume can not be created if the capacity is different. |
| 27   | 8QQP | Verify IF the Jiva Internal Snaphot get Deleted. |
| 28   | IFBV | Scale Up the cStor Volume Replica and check the status. |
| 29   | WOEM | Deploy application with nfs Provisioner using openebs cstor volumes in read-write-many mode |
| 30   | WVTY | Deploy application with nfs Provisioner using openebs cstor volumes in read-write-many mode |