### Cstor target pod failure.

#### Description

This job will induce failure in cstor target pod in the cluster. 

#### Prerequisites

- OpenShift cluster should be ready.
- Application should be deployed and running. 

#### Procedure

- The job should trigger the litmusbook which is capable of inducing cstor target pod failure.
- The inputs such as application label, application namespace should be provided as environmental variable to the ansible-runner pod which executes the test.
- Check the status of target pod after recovering from the failure. All the application replicas should be running.
- Check if the target pod is recovered successfully.

#### Test Result

