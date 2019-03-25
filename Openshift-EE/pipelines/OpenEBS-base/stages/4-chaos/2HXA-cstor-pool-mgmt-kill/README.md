"### Verify applicaton availablity post cstor-pool-mgmt conatiner kill.\r
\r
#### Description\r
Induce failure on cstor-pool-mgmt container in cstor-pool pod and check if it doesn't affect the application availability.\r
\r
#### Prerequisites\r
- OpenShift Cluster should be created and have the dependencies installed.\r
- cStor based storage pool should have been created.\r
- OpenEBS storage class should be created with the desired storage pool claim.\r
\r
#### Procedure\r
- Deploy statefulset application consuming OpenEBS Volume.\r
- Check if the application is deployed successfully.\r
- Induce cstor-pool-mgmt container kill chaos and verify if application is running successfully.\r
- Deprovision statefulset application.\r
\r
#### Test Result\r
 | Test ID |   Test Description               | Test Result   |
 |---------|---------------------------| --------------|
 |    2HXA-605   |  Induce failure on cstor-pool-mgmt container in cstor-pool pod and check if it doesn't affect the application availability           |  Fail     |

"