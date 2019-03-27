### 2HXA-Verify applicaton availablity post cstor-pool-mgmt conatiner kill.

#### Description

This test induce failure on cstor-pool-mgmt container in cstor-pool pod and check if it doesn't affect the application availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which induces failure on cstor-pool-mgmt container in cStor pool pod.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- The litmus experiment deploys statefulset application consuming OpenEBS Volume and check if the application is deployed successfully.
- Then it induces cstor-pool-mgmt container kill chaos and verifies if the application is running successfully.
- Finally it deprovisions statefulset application and update the result.

#### Expected result

- Application should be running successfully.

#### Test Result

| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/11285">11285</a>   |  Induce failure on cstor-pool-mgmt container in cstor-pool pod and check if it doesn't affect the application availability           |  Wed Mar 27 13:23:40 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:f922ae1f528b2b3c8b3a60db161ef1349f56bbd7,type:phrase),type:phrase,value:f922ae1f528b2b3c8b3a60db161ef1349f56bbd7),query:(match:(commit_id:(query:f922ae1f528b2b3c8b3a60db161ef1349f56bbd7,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:647,type:phrase),type:phrase,value:647),query:(match:(pipeline_id:(query:647,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
