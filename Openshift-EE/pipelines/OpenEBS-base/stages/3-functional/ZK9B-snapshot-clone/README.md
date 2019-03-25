### Creating Clone volume\r
\r
#### Description\r
Ensure that the volume can be created successfully using its snapshot.\r
\r
#### Prerequisites\r
- OpenShift Cluster should be created and have the dependencies installed.\r
- cStor based storage pool should have been created.\r
- OpenEBS storage class should be created with the desired storage pool claim.\r
\r
#### Procedure\r
- Check if the provided snapshot is created in the cluster.\r
- Check if snapshot-promoter storageclass is created.\r
- Update the clone template with the input parameters such as snapshot name, storage class and the application namespace.\r
- Use clone creation utility to create clone.\r
- Check if the cloned volume is bound and can be usable.\r
\r
#### Test Result\r
 | Test ID |   Test Description               | Test Result   |
 |---------|---------------------------| --------------|
 |    ZK9B-   |  Check if the clone can be created using volume snapshot           |  Fail     |

