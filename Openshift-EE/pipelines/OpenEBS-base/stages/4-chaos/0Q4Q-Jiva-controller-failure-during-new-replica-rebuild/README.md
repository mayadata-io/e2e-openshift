### 0Q4Q-Verify application availablity post JIVA controller pod kill when the newly scaled volume replica is in rebuild state.

#### Description

This test kills the Jiva controller when the newly scaled replica is in rebuild state and check if it doesn't affect the application availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- OpenEBS storage class should be created with the desired replica count.

#### Procedure

- This job triggers the litmus experiments which kills the Jiva controller pod when the newly scaled replica is in rebuild state and check if the application is not impacted.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys application consuming OpenEBS Volume and check if the application is deployed successfully, with the desired replica count.
- Then, it scales up the volume replica and kills the Jiva controller pod when the new replica is in rebuild state and verify if the application is running successfully.
- Finally, it deprovisions the application and update the result.

#### Expected result

- Newly scaled volume replica should be in Healthy state.
- Application should be running successfully.

#### Test Result
 


