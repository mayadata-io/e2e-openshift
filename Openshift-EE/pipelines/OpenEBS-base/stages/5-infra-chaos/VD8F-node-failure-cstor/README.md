### VD8F-Verify application availability when node is powered off.

#### Description

This test fails a node by shutting it down and checks if the application is rescheduled and verify its availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which reboots a node on vmware server and verify if the application is scheduled on other node.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys an application using cstor storage engine and dumps data into it.
- Then it fails the node where application is running and check if application is rescheduled and verify its availability.
- Finally, it deprovisions the application and update the result.

#### Expected result

- Application should be scheduled on some other node.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/89706">89706</a>   |  Fail the node where the application is running and check the behaviour           |  Thu Sep 26 19:23:24 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'4d9704a87a0a9f0b1b8947f5825957948dba35de',type:phrase),type:phrase,value:'4d9704a87a0a9f0b1b8947f5825957948dba35de'),query:(match:(commit_id:(query:'4d9704a87a0a9f0b1b8947f5825957948dba35de',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'3355',type:phrase),type:phrase,value:'3355'),query:(match:(pipeline_id:(query:'3355',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
