# Test cases for functional stage of OpenEBS-base pipeline



## Goals of this stage:

Verify functionality and scale of OpenEBS control plane and data plane. For this purpose a test application called busybox is used. 



## Test cases matrix:



| Unique ID# | Name                    | Description                                                | Link |
| ---------- | ----------------------- | ---------------------------------------------------------- | ---- |
|            | busybox-d-pvc-3-replica | Provision busybox as deployment with 3 replicas of OpenEBS |      |
|            | busybox-d-basic-load    | Basic load generation and verification                     |      |
|            | busybox-d-snap-clone    | Verify snapshots and clones functionality                  |      |
|            | busybox-d-deprovision   | Deprovision busybox and verify clean up of resources       |      |
|            | busybox-s-pvc-1-replica | Provision busybox as statefulset with 1 replica of OpenEBS |      |
|            | busybox-s-basic-load    | Basic load generation and verification                     |      |
|            | busybox-s-snap-clone    | Verify snapshots and clones functionality                  |      |
|            | busybox-s-deprovision   | Deprovision busybox and verify clean up of resources       |      |
|            |                         |                                                            |      |

