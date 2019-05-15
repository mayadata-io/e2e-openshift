### VZFL-Verify if the application and cStor target are scheduled on same node.

#### Description

This test checks if the application pod and its corresponding target are scheduled on the same kubernetes node.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which checks if the application pod in a deployment and its corresponding cstor target pod are scheduled on the same node.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job deploys an application using openebs cstor based storage class.
- Post successful application deployment, the job checks if the application pod and its corresponding cstor target pod are scheduled on the same node.
- The job fails if they are not scheduled on same node.

#### Expected result

- The application pod and its corresponding cstor target pod should be scheduled on same node.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/33365">33365</a>   |  Checking Application and target scheduled on same Node           |  Wed May 15 19:59:43 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:967d727a69b29b9db7f2028e30cafa98fa078869,type:phrase),type:phrase,value:967d727a69b29b9db7f2028e30cafa98fa078869),query:(match:(commit_id:(query:967d727a69b29b9db7f2028e30cafa98fa078869,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1438,type:phrase),type:phrase,value:1438),query:(match:(pipeline_id:(query:1438,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
