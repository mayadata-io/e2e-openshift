OpenEBS Chaos stage covers various chaos tests performed on OpenEBS storage engine components.

The test cases in the Chaos stage are as follows:

| S.No | TID  | Test case description                                        |
| ---- | ---- | ------------------------------------------------------------ |
| 1    | KBM1 | Induce failure on cStor pool container(cstor-pool) and check if it is recovered successfully and verify that the application is not impacted. |
| 2    | 2HXA | Induce failure on cstor-pool-mgmt container in cstor-pool pod and check if it doesn't affect the application availability. |
| 3    | VZPY | Induce failure on cstor-target pod and check if it gets scheduled immediately and the application is available. |
| 4    | PG1D | Induce chaos on cstor-target container(cstor-istgt) and check the behaviour. |
| 5    | GFL0 | Induce delay in cstor target pod network and verify if the application is not impacted. |
| 6    | BF12 | Evict a K8s node and check if its pods are rescheduled on the other node successfully and the application is available. |
| 7    | TGZK | Drain a K8s node and check if its pods are scheduled on other node successfully and the application is not impacted. |
| 8    | DQKT | Bring down a K8s node and check if its pods are running on other node successfully. |
| 9    | 8PI6 | Induce delay in cstor-pool network and check if the application is highly available. |
| 10   | E92G | Check the behaviour of OpenEBS volumes in case of docker crash in K8s node. |
| 11   | RTOH | Check the behaviour of OpenEBS volumes in case of kubelet failure in K8s node. |
| 12   | XUF7 | Check the behavior of OpenEBS volumes in case of CPU pressure on node where the application is scheduled. |
| 13   | ZCM2 | Check the behavior of OpenEBS volumes in case of memory pressure on node where the application is scheduled. |
| 14   | 1PP5 | Induce application pod failure and check if it is recovered successfully. |
| 15   | 340W | Check if the snapshot can be rebuilt after loss and recovery of single replica. |
| 16   | QKFK | Check if the snapshot cannot be rebuilt when the quorum condition is not met. |
| 17   | QURH | Check if the clone can be created after snapshot was rebuilt successfully. |
| 18   | VGEA | Check if the clone cannot be created when the snapshot is being rebuilt. |
| 19   | WQFI | Check if the clone cannot be created before the snapshot was rebuilt. |
| 20   | QCA4 | Induce cstor target network loss and check if it gets recovered successfully. |
| 21   | I9VM | Induce cstor pool network loss and check if gets recovered successfully. |
| 22   | 2EMT | Induce failure on cstor pool pod and check if it is scheduled again successfully on time and verify that the application is not impacted. |
| 23   | VZ5D | Induce failure on maya-exporter container and check its recovery. |
| 24   | YYD8 | Induce failure in the application container and check if it is recovered successfully. |
| 25   | H3IZ | Induce failure in openebs-provisioner pod and check if it is scheduled again successfully. |
| 26   | FZIL | Induce failure in maya-apiserver pod and check if it is scheduled again successfully. |
| 27   | 1XX8 | Induce disk failure in a striped pool and verify that the IOs are suspended. Verify if the IOs are resumed post disk recovery. |
| 28   | IN5G | Verify if the mirrored pool can be rebuilt successfully after the loss and recovery of a disk. |
| 29   | HPQ2 | Induce disk failure in mirrored pool and verify that the application IOs are not suspended. |
| 30   | PXUQ | Verify if the ephemeral storage is rebuilt successfully post node failure. |
| 31   | OLQT | Induce failure in single replica pool and check it is recovered immediately and verify the application availability. |
| 32   | TKYR | Induce failure in ndm pod and check if it is scheduled again successfully. |
| 33   | MPD7 | Induce failure in snapshot-controller pod and check if it is scheduled again successfully. |

