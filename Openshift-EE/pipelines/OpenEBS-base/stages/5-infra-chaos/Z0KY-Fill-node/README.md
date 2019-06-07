### Z0KY-Verify cstor pool pod availability when node's capacity is exhausted.

#### Description

This test fills the node's capacity completely through a rogue pod and checks if the openebs pool pods are getting evicted.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which drains a node and verify if the application is scheduled on other node.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys busybox application and fills the node completely. As an impact, kubelet evicts the rogue pod. 
- Here, the test checks if there is any impact on the corresponding storage pool.
- Finally, it deprovisions the statefulset application and update the result.

#### Expected result

- OpenEBS cStor pool pod should not evicted. It should be running and healthy.

#### Test Result
| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/43563">43563</a>           |  Fill the node capacity and check the openebs pool pod behavior           | Fri Jun  7 18:31:03 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'98987ec0f34263e6613b5a16ea1441eddda1e5bc',type:phrase),type:phrase,value:'98987ec0f34263e6613b5a16ea1441eddda1e5bc'),query:(match:(commit_id:(query:'98987ec0f34263e6613b5a16ea1441eddda1e5bc',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'1849',type:phrase),type:phrase,value:'1849'),query:(match:(pipeline_id:(query:'1849',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/42394">42394</a>           |  Fill the node capacity and check the openebs pool pod behavior           | Fri Jun  7 14:18:28 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'159151adc57a80780dc445269850de3f3d2be763',type:phrase),type:phrase,value:'159151adc57a80780dc445269850de3f3d2be763'),query:(match:(commit_id:(query:'159151adc57a80780dc445269850de3f3d2be763',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'1806',type:phrase),type:phrase,value:'1806'),query:(match:(pipeline_id:(query:'1806',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/42184">42184</a>   |  Fill the node capacity and check the openebs pool pod behavior           |  Fri Jun  7 12:36:23 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:f2355d5064dd7869c8ce81e5a18157eaec4a6d37,type:phrase),type:phrase,value:f2355d5064dd7869c8ce81e5a18157eaec4a6d37),query:(match:(commit_id:(query:f2355d5064dd7869c8ce81e5a18157eaec4a6d37,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1787,type:phrase),type:phrase,value:1787),query:(match:(pipeline_id:(query:1787,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
