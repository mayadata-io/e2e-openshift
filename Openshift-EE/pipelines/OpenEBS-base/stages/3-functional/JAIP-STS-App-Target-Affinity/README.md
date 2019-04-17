### JAIP-Verify if the statefulset application and target are scheduled on same node.

#### Description

This test checks if the statefulset application pod and its corresponding target are scheduled on the same kubernetes node.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which checks if the application pod in a statefulset and its corresponding cstor target pod are scheduled on the same node.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job deploys a statefulset application using openebs cstor based storage class.
- Post successful application deployment, checks if the number of statefulset replicas matches the desired value.
- And also, the job checks if each of the application replica pod and its corresponding cstor target pod are scheduled on the same node.
- The job fails if they are not scheduled on same node.

#### Expected result

- The application replica pod and its corresponding cstor target pod should be scheduled on same node.

#### Test Result




| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/16710">16710</a>           |  Checking Application and target scheduled on same Node           | Wed Apr 17 10:22:59 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:c33cc84fa4f1cbab77ead58122cd5675f227a08d,type:phrase),type:phrase,value:c33cc84fa4f1cbab77ead58122cd5675f227a08d),query:(match:(commit_id:(query:c33cc84fa4f1cbab77ead58122cd5675f227a08d,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:902,type:phrase),type:phrase,value:902),query:(match:(pipeline_id:(query:902,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/16402">16402</a>           |  Checking Application and target scheduled on same Node           | Tue Apr 16 15:40:47 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:b0a56590f5e8caa1d60e5af7d8617fdacda60626,type:phrase),type:phrase,value:b0a56590f5e8caa1d60e5af7d8617fdacda60626),query:(match:(commit_id:(query:b0a56590f5e8caa1d60e5af7d8617fdacda60626,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:891,type:phrase),type:phrase,value:891),query:(match:(pipeline_id:(query:891,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/16365">16365</a>           |  Checking Application and target scheduled on same Node           | Tue Apr 16 09:47:21 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:283c343328887ecdc9828a4af972717cc452c8c8,type:phrase),type:phrase,value:283c343328887ecdc9828a4af972717cc452c8c8),query:(match:(commit_id:(query:283c343328887ecdc9828a4af972717cc452c8c8,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:887,type:phrase),type:phrase,value:887),query:(match:(pipeline_id:(query:887,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/14460">14460</a>           |  Checking Application and target scheduled on same Node           | Wed Apr 10 19:10:50 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:7237d3dd13c5ec12302a32859a1718f3c2e77a54,type:phrase),type:phrase,value:7237d3dd13c5ec12302a32859a1718f3c2e77a54),query:(match:(commit_id:(query:7237d3dd13c5ec12302a32859a1718f3c2e77a54,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:812,type:phrase),type:phrase,value:812),query:(match:(pipeline_id:(query:812,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/14436">14436</a>           |  Checking Application and target scheduled on same Node           | Wed Apr 10 18:21:22 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:a0f15c8ec843af2c51f1a29023ad3f4ae57ade78,type:phrase),type:phrase,value:a0f15c8ec843af2c51f1a29023ad3f4ae57ade78),query:(match:(commit_id:(query:a0f15c8ec843af2c51f1a29023ad3f4ae57ade78,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:811,type:phrase),type:phrase,value:811),query:(match:(pipeline_id:(query:811,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/14413">14413</a>   |  Checking Application and target scheduled on same Node           |  Wed Apr 10 16:38:48 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:bc9afc8fe058e858159b35c1d4b5d3a23b9741c7,type:phrase),type:phrase,value:bc9afc8fe058e858159b35c1d4b5d3a23b9741c7),query:(match:(commit_id:(query:bc9afc8fe058e858159b35c1d4b5d3a23b9741c7,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:810,type:phrase),type:phrase,value:810),query:(match:(pipeline_id:(query:810,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
