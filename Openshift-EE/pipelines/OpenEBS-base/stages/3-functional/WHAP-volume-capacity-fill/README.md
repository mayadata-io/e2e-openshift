### WHAP - Fill the volume capacity completely and resize it.

#### Description

The goal of this test is to fill cstor volume completely and check if its size can be scaled seamlessly.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.
- An application should be deployed using cstor based storage class.

#### Procedure

- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job fills the cstor volume completely and exhausts its space.

#### TODO

- Need to scale the volume capacity when the feature is supported.

#### Expected result

- Application writes should not happen.

#### Test result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/45054">45054</a>           |  Fill cstor volume completely and check if its size can be scaled seamlessly           | Sat Jun  8 14:50:13 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:1a2910aef0c060a56f012ba42294ab58fc16adf6,type:phrase),type:phrase,value:1a2910aef0c060a56f012ba42294ab58fc16adf6),query:(match:(commit_id:(query:1a2910aef0c060a56f012ba42294ab58fc16adf6,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1896,type:phrase),type:phrase,value:1896),query:(match:(pipeline_id:(query:1896,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/43687">43687</a>   |  Fill cstor volume completely and check if its size can be scaled seamlessly           |  Fri Jun  7 19:12:41 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'a29d0394f6bd056520c2060d6c61313b2df05a2d',type:phrase),type:phrase,value:'a29d0394f6bd056520c2060d6c61313b2df05a2d'),query:(match:(commit_id:(query:'a29d0394f6bd056520c2060d6c61313b2df05a2d',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'1855',type:phrase),type:phrase,value:'1855'),query:(match:(pipeline_id:(query:'1855',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
