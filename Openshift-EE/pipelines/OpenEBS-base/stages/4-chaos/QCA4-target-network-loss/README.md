"### Verify applicaton availablity post cstor-target network loss.\r
\r
#### Description\r
Induce network loss on cstor-target conatiner and check if it doesn't affect the application availability.\r
\r
#### Prerequisites\r
- OpenShift Cluster should be created and have the dependencies installed.\r
- cStor based storage pool should have been created.\r
- OpenEBS storage class should be created with the desired storage pool claim.\r
\r
#### Procedure\r
- Deploy statefulset application consuming OpenEBS Volume.\r
- Check if the application is deployed successfully.\r
- Induce cstor-target conatiner network loss and verify if application is running successfully.\r
- Deprovision statefulset application.\r
\r
#### Test Result\r
 | Test ID |   Test Description               | Test Result   |
 |---------|---------------------------| --------------|
 |    QCA4-605   |  Induce cstor target network loss and check if it gets recovered successfully           |  Fail     |

"