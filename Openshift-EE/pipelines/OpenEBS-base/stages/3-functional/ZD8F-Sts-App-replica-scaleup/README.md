### Scaling up statefulset app replica\r
\r
#### Description\r
Make sure that the application replicas can be scaled by updating its corresponding deployment.\r
\r
#### Prerequisites\r
- OpenShift Cluster should be created and have the dependencies installed.\r
- cStor based storage pool should have been created.\r
- OpenEBS storage class should be created with the desired storage pool claim.\r
\r
#### Procedure\r
- Deploy busybox statefulset application.\r
- Start data traffic in the application pod.\r
- Increase the app replica count using `kubectl scale` command.\r
- Check if the new app pod is created and the ring is formed.\r
\r
#### Test Result\r
 | Test ID |   Test Description               | Test Result   |
 |---------|---------------------------| --------------|
 |    ZD8F-605   |  Scale the statefulset application replicas and verify the ring configuration           |  Pass     |

