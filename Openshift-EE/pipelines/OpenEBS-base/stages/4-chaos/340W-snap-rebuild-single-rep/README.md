### 340W-Snapshot rebuilding

#### Description

This test ensures if the snapshot can be rebuilt after recovering a replica from failure

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which checks if the snapshot can be rebuilt after recovering a replica from failure.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It induces delay in one of the cstor pool pods using the tool tc and disconnects it from the target. Meanwhile tries to create a snapshot which will not be created it the disconnected replica.
- Then, recovers the replica from failure and check if it starts snapshot rebulding.
- Once snapshot is rebuilt successfully, updates the result to the CR.

#### Expected result

- Snapshot should be rebuilt successfully on the replica after it recovers from failure.



| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/11304">11304</a>           |  Check if the snapshot can be rebuilt after loss and recovery of single replica           | Wed Mar 27 15:33:22 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:68a81842f4a53fab4359b592b5f298d466d147a1,type:phrase),type:phrase,value:68a81842f4a53fab4359b592b5f298d466d147a1),query:(match:(commit_id:(query:68a81842f4a53fab4359b592b5f298d466d147a1,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:648,type:phrase),type:phrase,value:648),query:(match:(pipeline_id:(query:648,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/11283">11283</a>   |  Check if the snapshot can be rebuilt after loss and recovery of single replica           |  Wed Mar 27 13:23:18 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:f922ae1f528b2b3c8b3a60db161ef1349f56bbd7,type:phrase),type:phrase,value:f922ae1f528b2b3c8b3a60db161ef1349f56bbd7),query:(match:(commit_id:(query:f922ae1f528b2b3c8b3a60db161ef1349f56bbd7,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:647,type:phrase),type:phrase,value:647),query:(match:(pipeline_id:(query:647,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
