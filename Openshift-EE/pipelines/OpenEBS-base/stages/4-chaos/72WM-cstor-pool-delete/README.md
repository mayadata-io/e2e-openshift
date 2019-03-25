"### Verify applicaton availablity post cStor pool pod failure.\r
\r
#### Description\r
Simulate cStor pool pod failure by deleting it and check if it doesn't affect the application availability.\r
\r
#### Prerequisites\r
- OpenShift Cluster should be created and have the dependencies installed.\r
- cStor based storage pool should have been created.\r
- OpenEBS storage class should be created with the desired storage pool claim.\r
\r
#### Procedure\r
- Deploy statefulset application consuming OpenEBS Volume.\r
- Check if the application is deployed successfully.\r
- Induce cstor-pool pod failure by deleting it and verify if application is running successfully.\r
- Deprovision statefulset application.\r
\r
#### Test Result\r
 | Test ID |   Test Description               | Test Result   |
 |---------|---------------------------| --------------|
 |    72WM-605   |  cstor-pool-delete           |  Fail     |

"