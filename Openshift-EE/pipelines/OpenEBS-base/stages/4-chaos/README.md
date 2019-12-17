OpenEBS Chaos stage covers various chaos tests performed on OpenEBS storage engine components.

The test cases in the Chaos stage are as follows:

| S.No | TID  | Test case description                                        |
| ---- | ---- | ------------------------------------------------------------ |
| 1    | KBM1 | Induce failure on cStor pool container(cstor-pool) and check if it is recovered successfully and verify that the application is not impacted. |
| 2    | 2HXA | Induce failure on cstor-pool-mgmt container in cstor-pool pod and check if it doesn't affect the application availability. |
| 3    | VZPY | Induce failure on cstor-target pod and check if it gets scheduled immediately and the application is available. |
| 4    | PG1D | Induce chaos on cstor-target container(cstor-volume-mgmt) and check the behaviour. |
| 5    | GFL0 | Induce delay in cstor target pod network and verify if the application is not impacted. |
| 6    | 1PP5 | Induce application pod failure and check if it is recovered successfully. |
| 7    | 340W | Check if the snapshot can be rebuilt after loss and recovery of single replica. |
| 8    | QKFK | Check if the snapshot cannot be rebuilt when the quorum condition is not met. |
| 9    | QURH | Check if the clone can be created after snapshot was rebuilt successfully. |
| 10   | VGEA | Check if the clone cannot be created when the snapshot is being rebuilt. |
| 11   | WQFI | Check if the clone cannot be created before the snapshot was rebuilt. |
| 12   | QCA4 | Induce cstor target network loss and check if it gets recovered successfully. |
| 13   | 0ACF | Verifying application status post cStor NFS provisioner application pod kill. |
| 14   | 0YB8 | Verify applicaton availablity post cstor-pool-mgmt conatiner kill for the NFS Provisioner target. |
| 15   | 3UFA | Verify application availablity post NFS provisioner cstor target pod kill. |
| 16   | 8ZWN | Verify application availablity post jiva controller failure of NFS provisioner |
| 17   | 72WM | Verify applicaton availablity post cStor pool pod failure. |
| 18   | AUZF | Verifying application HA consuming jiva volume post application pod kill. |
| 19   | HOSN | Fail jiva replica pod in single replica deployment and Verify the Application status |
| 20   | I7QP | Verify application availablity post NFS provisioner's cstor target istgt container kill. |
| 21   | KLPX | Verify application availability upon inducing network delay in jiva replica pod. |
| 22   | N67N | Verifying application HA post cStor NFS provisioner application pod kill. |
| 23   | NEPS | Verify application availablity post jiva controller container failure of NFS provisioner. |
| 24   | PX1D | Verify Jiva replica stickiness to node. |
| 25   | TSXL | Induce delay JIVA Controler pod network and verify if the application is not impacted. |
| 26   | VJBK | Ensure application availability upon failing a jiva replica pod. |
| 27   | VO3D | Failure the Jiva Controller pod and verify the application Availability. |
