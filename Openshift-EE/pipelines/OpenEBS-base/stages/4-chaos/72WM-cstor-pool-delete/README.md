### Verify applicaton availablity post cStor pool pod failure.

#### Description
Simulate cStor pool pod failure by deleting it and check if it doesn't affect the application availability.

#### Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure
- Deploy statefulset application consuming OpenEBS Volume.
- Check if the application is deployed successfully.
- Induce cstor-pool pod failure by deleting it and verify if application is running successfully.
- Deprovision statefulset application.

#### Test Result
 | Test ID |   Test Description               | Test Result   |
 |---------|---------------------------| --------------|
 |    72WM-605   |  cstor-pool-delete           |  Fail     |
