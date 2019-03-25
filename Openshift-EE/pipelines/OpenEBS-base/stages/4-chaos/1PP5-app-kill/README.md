### Verify applicaton HA post application pod kill.

#### Description
The test goal is to ensure that the application runs seamlessly on inducing the application pod kill.

#### Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim

#### Procedure
- Deploy statefulset application consuming OpenEBS Volume.
- Check if the application is deployed successfully.
- Induce application pod kill chaos and verify if application is rescheduled and running successfully.
- Deprovision statefulset application

#### Test Result
 | Test ID |   Test Description               | Test Result   |
 |---------|---------------------------| --------------|
 |    1PP5-605   |  Induce application pod failure and check if it is recovered successfully           |  Fail     |

