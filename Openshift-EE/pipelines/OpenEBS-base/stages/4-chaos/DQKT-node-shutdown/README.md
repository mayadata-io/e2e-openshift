### Verify application availablity when node is shutdown ungracefully.

#### Description
Induce ungracefull node shutdown and check if application is rescheduled and verify its availability.

#### Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure
- Deploy statefulset application consuming OpenEBS Volume.
- Check if the application is deployed successfully.
- Induce ungracefull node shutdown and check if application is rescheduled and verify its availability.
- Deprovision statefulset application.

#### Test Result

