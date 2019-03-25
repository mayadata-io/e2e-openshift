"### Verify applicaton availablity post cstor target pod kill.\r
\r
#### Description\r
Induce cstor target pod kill and check if it doesn't affect the application availability.\r
\r
#### Prerequisites\r
- OpenShift Cluster should be created and have the dependencies installed.\r
- cStor based storage pool should have been created.\r
- OpenEBS storage class should be created with the desired storage pool claim.\r
\r
#### Procedure\r
- Deploy statefulset application consuming OpenEBS Volume.\r
- Check if the application is deployed successfully.\r
- Induce cstor target pod kill and verify if application is running successfully.\r
- Deprovision statefulset application.\r
\r
#### Test Result\r
 | Test ID |   Test Description               | Test Result   |
 |---------|---------------------------| --------------|
 |    VZPY-605   |  Induce failure on cstor-target pod and check if it gets scheduled immediately and the application is available           |  Fail     |

"