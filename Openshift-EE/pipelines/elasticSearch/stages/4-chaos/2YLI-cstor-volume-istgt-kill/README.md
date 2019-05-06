## cstor volume istgt kill

## Description
- This test kille the cstor target istgt container and check if it doesn't affect the application availability.

## Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

## Procedure
- This job triggers the litmus experiments which inducesnetwork loss in cstor-pool container and check if the application is not impacted.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS Volume and check if the application is deployed successfully.
- Then, it kills the cstor istgt container and verify if the application is running successfully.
- Finally, it deprovisions the statefulset application and update the result.

## Expected result
- Application should be running successfully.

##Test Result