### ElasticSearch pod failure.

#### Description

This job will induce failure in one of the ElasticSearch pods in the statefulset. 

#### Prerequisites

- OpenShift cluster should be ready.
- ElasticSearch pods should be running. 

#### Procedure

- The job should trigger the litmusbook which is capable of inducing ElasticSearch pod failure.
- The inputs such as application label, application namespace should be provided as environmental variable to the ansible-runner pod which executes the test.
- Check the impact of application when one of the application replica is lost.
- Check the status of statefulset application after recovering from the failure. All the application replicas should be running.
- Check if the ElasticSearch statefulset is created successfully using kubectl command `kubectl get sts -n <application namespace>`

#### Test Result

