"### Checking memory consumption\r
\r
#### Description\r
Ensure that the memory consumption doesn't cross the threshold value for a known workload.\r
\r
#### Prerequisites\r
- OpenShift Cluster should be created and have the dependencies installed.\r
- cStor based storage pool should have been created.\r
- OpenEBS storage class should be created with the desired storage pool claim.\r
\r
#### Procedure\r
- Deploy an application using openebs cstor based storage class.\r
- Ensure that the application and storage components are running successfully.\r
- Dump data using the dd-client image.\r
- Make sure that the consumption doesn't cross the threshold value set.\r
\r
#### Test result\r
 | Test ID |   Test Description               | Test Result   |
 |---------|---------------------------| --------------|
 |    OBS2-605   |  Check if the memory consumption doesn't cross the desired threshold for known workload           |  Pass     |

"