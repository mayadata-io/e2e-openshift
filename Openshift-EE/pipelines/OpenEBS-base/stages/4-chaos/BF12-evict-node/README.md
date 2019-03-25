### Verify applicaton availablity when node is evicted due to disk-pressure taint.

#### Description
Evict node due to disk-pressure taint and check if application is rescheduled and verify its availability.

#### Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure
- Deploy statefulset application consuming OpenEBS Volume.
- Check if the application is deployed successfully.
- Evict node due to disk-pressure taint and check if application is rescheduled and verify its availability.
- Deprovision statefulset application.

#### Test Result
