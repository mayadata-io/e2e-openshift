### MongoDB pod failure.

#### Description

This job will induce failure in one of the Mongodb pods in the statefulset. 

#### Prerequisites

- OpenShift cluster should be ready.
- Mongodb pods should be running. 

#### Procedure

- The job should trigger the litmusbook which is capable of inducing Mongodb pod failure.
- The inputs such as application label, application namespace should be provided as environmental variable to the ansible-runner pod which executes the test.
- Check the impact of application when one of the application replica is lost.
- Check the status of statefulset application after recovering from the failure. All the application replicas should be running.
- Check if the Mongodb pod is recovered successfully and all the replicas are running using kubectl command `kubectl get pods -n <application namespace>`

#### Test Result

