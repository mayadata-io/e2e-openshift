#### Deprovision Cassandra

This job will delete the cassandra statefulset installed in OpenShift cluster.

#### Prerequisites

- OpenShift cluster should be ready.
- OpenEBS should be deployed.
- Cassandra should be deployed

#### Procedure

- The job should trigger the litmusbook which is capable of deleting Cassandra specific components in the cluster.

- This should delete all the components in the respective namespace.

- This can be verified using kubectl command `kubectl get ns`


#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/36145">36145</a>   |  Check if the cassandra ring is deleted successfully           |  Fri May 31 07:32:03 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:cb476f8e715fb374877c31b699863b56dd3c5ded,type:phrase),type:phrase,value:cb476f8e715fb374877c31b699863b56dd3c5ded),query:(match:(commit_id:(query:cb476f8e715fb374877c31b699863b56dd3c5ded,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1551,type:phrase),type:phrase,value:1551),query:(match:(pipeline_id:(query:1551,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
