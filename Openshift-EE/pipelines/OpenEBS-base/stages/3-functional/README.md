# Test cases for functional stage of OpenEBS-base pipeline

## Test cases matrix:

The test cases in the functional stage are as follows:

| S.No | TID  | Test case description                                        |
| ---- | ---- | ------------------------------------------------------------ |
| 1    | 9AKX | Verify if the snapshot can be created for persistent volume  |
| 2    | ZK9B | Check if the clone can be created using volume snapshot.     |
| 3    | QDLO | Ensure the data integrity in openebs volume using fio.       |
| 4    | OBS2 | Check if the memory consumption doesn't cross the desired threshold for known workload. |
| 5    | 5O5V | Make sure that the parent volume cannot be deleted in presence of its clones. |
| 6    | 4E0O | Check if the storage replicas can be scaled up.              |
| 7    | 29O5 | Check if the volume can be filled completely.                |
| 8    | 4ZWU | Check if the storage volume replicas are distributed across the storage pools in case of statefulset deployment. |
| 9    | 84PV | Check if the cStor volume capacity can be increased successfully. |
| 10   | ZD8F | Scale the statefulset application replicas and verify the ring configuration. |
| 11   | ENBK | Upgrade the application that uses OpenEBS volumes and check if it is seamless. |
| 12   | K7KA | Check if the target pod gets scheduled on the node where the application pod is running adhering target pod affinity. |
| 13   | GV2D | Upgrade OpenEBS components to the latest release and check if it is seamless |
| 14   | ZFUA | Ensure that the disk can be replaced successfully in mirrored pool. |
| 15   | ZTWH | Verify cStor pool rebuilding status using maya-exporter pool metrics. |
| 16   | DBK5 | Verify if the clone volume inherits the properties of parent volume. |