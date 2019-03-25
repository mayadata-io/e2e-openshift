### Verify applicaton HA post application pod kill.\r
\r
#### Description\r
The test goal is to ensure that the application runs seamlessly on inducing the application pod kill.\r
\r
#### Prerequisites\r
- OpenShift Cluster should be created and have the dependencies installed.\r
- cStor based storage pool should have been created.\r
- OpenEBS storage class should be created with the desired storage pool claim.\r
\r
#### Procedure\r
- Deploy statefulset application consuming OpenEBS Volume.\r
- Check if the application is deployed successfully.\r
- Induce application pod kill chaos and verify if application is rescheduled and running successfully.\r
- Deprovision statefulset application\r
\r
#### Test Result\r
 | Test ID |   Test Description               | Test Result   |
 |---------|---------------------------| --------------|
 |    1PP5-605   |  Induce application pod failure and check if it is recovered successfully           |  Fail     |

