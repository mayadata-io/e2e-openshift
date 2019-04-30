### 6RQL-Attempting to create clone with different capacity

#### Description

This test ensures that the clone volume can not be created if the capacity is different.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which creates clone volume using volume snapshot.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly. Update the clone capacity with value other than capacity of actual PV.
- This job checks if the provided snapshot is created in the cluster and snapshot-promoter storageclass is created.
- It updates the clone template with the input parameters such as snapshot name, storage class and the application namespace.
- Use clone creation utility to create clone.
- Finally, it checks if the cloned volume is not created . In OpenEBS, admission-controller should block clone creation if the capacity is different.

#### Expected result

- The clone volume should not be created if the capacity is different than the PV capacity.

#### Test Result
| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/24705">24705</a>   |  Check if the clone can't be created with different volume capacity           |  Tue Apr 30 14:44:50 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:c433bc389f4dfe19167c230acbd9fa8530119871,type:phrase),type:phrase,value:c433bc389f4dfe19167c230acbd9fa8530119871),query:(match:(commit_id:(query:c433bc389f4dfe19167c230acbd9fa8530119871,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1155,type:phrase),type:phrase,value:1155),query:(match:(pipeline_id:(query:1155,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
