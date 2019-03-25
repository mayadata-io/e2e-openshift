### Scaling up statefulset app replica

#### Description
Make sure that the application replicas can be scaled by updating its corresponding deployment.

#### Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure
- Deploy busybox statefulset application.
- Start data traffic in the application pod.
- Increase the app replica count using `kubectl scale` command.
- Check if the new app pod is created and the ring is formed.

#### Test Result
 | Test ID |   Test Description               | Test Result   |
 |---------|---------------------------| --------------|
|     ZD8F-605                    |  Scale the statefulset application replicas and verify the ring configuration           | Pass  |
 |    ZD8F-605   |  Scale the statefulset application replicas and verify the ring configuration           |  Pass     |

