### Prometheus pod failure.

#### Description

This job will induce failure in one of the Prometheus pods in the deployment. 

#### Prerequisites

- OpenShift cluster should be ready.
- Percona pods should be running. 

#### Procedure

- The job should trigger the litmusbook which is capable of inducing Prometheus pod failure.
- The inputs such as application label, application namespace should be provided as environmental variable to the ansible-runner pod which executes the test.
- Check the impact of application when one of the application replica is lost.
- Check the status of deployment after recovering from the failure. All the application replicas should be running.
- Check if the Prometheus pod is recovered successfully and all the replicas are running using kubectl command `kubectl get pods -n <application namespace>`

#### Test Result

