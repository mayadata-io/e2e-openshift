### PC78-Verify application availability when node is drained.

#### Description

This test drains a node and checks if the application is rescheduled and verify its availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which drains a node and verify if the application is scheduled on other node.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS Volume and checks if the application is deployed successfully.
- Then it drains the node where application is running and check if application is rescheduled and verify its availability.
- Finally, it deprovisions the statefulset application and update the result.

#### Expected result

- Application should be scheduled on some other node.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/30969">30969</a>           |  Drain the node where the application is running and check the behaviour           | Fri May 10 14:11:07 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:4a4c6099d24d128fb5d37b03d8d5bae0f5a12696,type:phrase),type:phrase,value:4a4c6099d24d128fb5d37b03d8d5bae0f5a12696),query:(match:(commit_id:(query:4a4c6099d24d128fb5d37b03d8d5bae0f5a12696,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1350,type:phrase),type:phrase,value:1350),query:(match:(pipeline_id:(query:1350,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/30930">30930</a>           |  Drain the node where the application is running and check the behaviour           | Fri May 10 12:29:45 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:4a4c6099d24d128fb5d37b03d8d5bae0f5a12696,type:phrase),type:phrase,value:4a4c6099d24d128fb5d37b03d8d5bae0f5a12696),query:(match:(commit_id:(query:4a4c6099d24d128fb5d37b03d8d5bae0f5a12696,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1349,type:phrase),type:phrase,value:1349),query:(match:(pipeline_id:(query:1349,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/30578">30578</a>   |  Drain the node where the application is running and check the behaviour           |  Thu May  9 17:25:29 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:4a4c6099d24d128fb5d37b03d8d5bae0f5a12696,type:phrase),type:phrase,value:4a4c6099d24d128fb5d37b03d8d5bae0f5a12696),query:(match:(commit_id:(query:4a4c6099d24d128fb5d37b03d8d5bae0f5a12696,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1337,type:phrase),type:phrase,value:1337),query:(match:(pipeline_id:(query:1337,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
