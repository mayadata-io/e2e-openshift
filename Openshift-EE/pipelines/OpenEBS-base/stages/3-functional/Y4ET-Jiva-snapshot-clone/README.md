### Y4ET-Creating Clone for Jiva volume

#### Description

This test ensures that the clone volume can be created on Jiva volume successfully using its snapshot.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva specific storage class and storage pool should be created.

#### Procedure

- This job triggers the litmus experiments which creates clone volume using volume snapshot.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job checks if the provided snapshot is created in the cluster and snapshot-promoter storageclass is created.
- It updates the clone template with the input parameters such as snapshot name, storage class and the application namespace.
- Use clone creation utility to create clone.
- Finally, it checks if the cloned volume is bound and can be usable.

#### Expected result

- The clone volume should be created successfully and should possess the data.

#### 
| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/25098">25098</a>           |  Check if the clone can be created using jiva volume snapshot           | Thu May  2 18:14:16 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:6c00f8827288109ef0cb584c0c33fe77dfbe3d1a,type:phrase),type:phrase,value:6c00f8827288109ef0cb584c0c33fe77dfbe3d1a),query:(match:(commit_id:(query:6c00f8827288109ef0cb584c0c33fe77dfbe3d1a,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1171,type:phrase),type:phrase,value:1171),query:(match:(pipeline_id:(query:1171,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/24896">24896</a>           |  Check if the clone can be created using jiva volume snapshot           | Tue Apr 30 18:17:26 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:0ded56ac6a7dd0c9bc9009211906d4c98280ed0a,type:phrase),type:phrase,value:0ded56ac6a7dd0c9bc9009211906d4c98280ed0a),query:(match:(commit_id:(query:0ded56ac6a7dd0c9bc9009211906d4c98280ed0a,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1160,type:phrase),type:phrase,value:1160),query:(match:(pipeline_id:(query:1160,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/24717">24717</a>   |  Check if the clone can be created using jiva volume snapshot           |  Tue Apr 30 14:49:50 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:c433bc389f4dfe19167c230acbd9fa8530119871,type:phrase),type:phrase,value:c433bc389f4dfe19167c230acbd9fa8530119871),query:(match:(commit_id:(query:c433bc389f4dfe19167c230acbd9fa8530119871,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1155,type:phrase),type:phrase,value:1155),query:(match:(pipeline_id:(query:1155,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
