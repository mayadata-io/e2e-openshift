### PX1D-Verify Jiva replica stickiness to node.

#### Description

This test checks if the jiva replica pod is sticked to a node.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva based storage pool should have been created.
- OpenEBS storage class should be created and an application should be deployed using jiva storage engine.

#### Procedure

- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job triggers the litmus experiments which cordons the node where replica pod is scheduled.
- Then the replica pod is deleted to check if it is getting scheduled on some other node.
- Then, uncordoning the node and verifying if the replica pod gets scheduled only on the uncordoned node.
- Finally, it deprovisions the application and update the result.

#### Expected result

Jiva replica pod should be sticking to the node where it was initially scheduled.

#### Test Result
| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/41926">41926</a>   |  Jiva replica node affinity           |  Thu Jun  6 19:41:40 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:116e05484639674867b65b32a5e22b5336c5e580,type:phrase),type:phrase,value:116e05484639674867b65b32a5e22b5336c5e580),query:(match:(commit_id:(query:116e05484639674867b65b32a5e22b5336c5e580,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1767,type:phrase),type:phrase,value:1767),query:(match:(pipeline_id:(query:1767,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
