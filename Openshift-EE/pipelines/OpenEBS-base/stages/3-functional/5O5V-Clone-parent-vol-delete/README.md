### 5O5V-Restricting Parent volume deletion in presence of clones.

#### Description
The intention of this test is to ensure that the parent volumes are not deletable in presence of its clones.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which checks if OpenEBS admission server blocks the deletion of parent volume when it has descendants.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- The next litmus experiment creates snapshot of OpenEBS persistent volume and create clone using the snapshot. 
- Then, the job attempts to delete the parent volume which has snapshot and clone.
- OpenEBS admission controller should prevent the deletion by throwing appropriate error message.
- Finally, this job updates the result CR with the actual result.

#### Expected result

- The volume snapshot should be created successfully.
- The clone should be created successfully.
- The parent volume should not be deleted and throw appropriate error message.

#### Test Result

| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/26075">26075</a>           |  Check if the clone can be created using volume snapshot           | Fri May  3 16:16:00 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:a3659d67674a285c3e823edb6d05ee54038a958a,type:phrase),type:phrase,value:a3659d67674a285c3e823edb6d05ee54038a958a),query:(match:(commit_id:(query:a3659d67674a285c3e823edb6d05ee54038a958a,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1199,type:phrase),type:phrase,value:1199),query:(match:(pipeline_id:(query:1199,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/25128">25128</a>           |  Check if the clone can be created using volume snapshot           | Thu May  2 19:06:04 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:6c00f8827288109ef0cb584c0c33fe77dfbe3d1a,type:phrase),type:phrase,value:6c00f8827288109ef0cb584c0c33fe77dfbe3d1a),query:(match:(commit_id:(query:6c00f8827288109ef0cb584c0c33fe77dfbe3d1a,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1173,type:phrase),type:phrase,value:1173),query:(match:(pipeline_id:(query:1173,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/25087">25087</a>           |  Check if the clone can be created using volume snapshot           | Thu May  2 18:09:55 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:6c00f8827288109ef0cb584c0c33fe77dfbe3d1a,type:phrase),type:phrase,value:6c00f8827288109ef0cb584c0c33fe77dfbe3d1a),query:(match:(commit_id:(query:6c00f8827288109ef0cb584c0c33fe77dfbe3d1a,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1171,type:phrase),type:phrase,value:1171),query:(match:(pipeline_id:(query:1171,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/24706">24706</a>   |  Check if the clone can be created using volume snapshot           |  Tue Apr 30 14:40:51 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:c433bc389f4dfe19167c230acbd9fa8530119871,type:phrase),type:phrase,value:c433bc389f4dfe19167c230acbd9fa8530119871),query:(match:(commit_id:(query:c433bc389f4dfe19167c230acbd9fa8530119871,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1155,type:phrase),type:phrase,value:1155),query:(match:(pipeline_id:(query:1155,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
