### AUZF-Verifying application HA consuming jiva volume post application pod kill.

#### Description

This job ensures that the application consuming jiva volume runs seamlessly on inducing the application pod failure.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva based storage pool should have been created.

#### Procedure

- This job triggers the litmus experiments which induces failure on one of the application pods and ensures that there is no impact.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job deploys busybox statefulset application consuming OpenEBS Volume and checks if the application is deployed successfully.
- Then it induces application pod kill chaos and verify if the application pod is rescheduled and running successfully.
- Finally, the job deletes the busybox deployment.

#### Expected result

- Application pod should be rescheduled successfully.

