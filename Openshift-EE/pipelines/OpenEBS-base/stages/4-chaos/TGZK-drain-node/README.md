### Verify applicaton availablity when node is drained (Node Maintainenece)

#### Description
Drain node and check if application is rescheduled and verify its availability.

#### Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure
- Deploy statefulset application consuming OpenEBS Volume.
- Check if the application is deployed successfully.
- Drain node and check if application is rescheduled and verify its availability.
- Deprovision statefulset application.

#### Test Result
