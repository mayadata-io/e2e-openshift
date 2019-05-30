### Cstor target network failure.

#### Description

This job will induce delay in the cstor target network and measure the behavior.

#### Prerequisites

- OpenShift cluster should be ready.
- Application should be deployed and running on cstor based volume. 

#### Procedure

- The job should trigger the litmusbook which is capable of inducing delay in cstor target pod network.
- The inputs such as application label, application namespace should be provided as environmental variable to the ansible-runner pod which executes the test.
- Check the status of target pod after recovering from the failure. All the application replicas should be running.
- Check if the target pod is recovered successfully.

#### Test Result

