"### Verify applicaton availablity post cstor-pool pod kill.\r
\r
#### Description\r
Induce cstor pool pod kill and check if it doesn't affect the application availability.\r
\r
#### Prerequisites\r
- OpenShift Cluster should be created and have the dependencies installed.\r
- cStor based storage pool should have been created.\r
- OpenEBS storage class should be created with the desired storage pool claim.\r
\r
#### Procedure\r
- Deploy statefulset application consuming OpenEBS Volume.\r
- Check if the application is deployed successfully.\r
- Induce cstor-pool conatiner network delay and verify if application is running successfully.\r
- Deprovision statefulset application.\r
\r
#### Test Result\r
 | Test ID |   Test Description               | Test Result   |
 |---------|---------------------------| --------------|
 |    KBM1-605   |  Induce failure on cStor pool container(cstor-pool) and check if it is recovered successfully and verify that the application is not impacted           |  Fail     |

"