### VJBK-Ensure application availability upon failing a jiva replica pod

#### Description

This test fails the jiva replica in a deployment and check if it is recovered successfully.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Openebs storage class with multiple jiva replica specification should be created..

#### Procedure

- This job triggers the litmus experiments which kills one of the jiva replica pods and check if the application is not impacted.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS jiva Volume and check if the application is deployed successfully.
- Then, it kills the jiva replica pod and verify if it is recovered successfully.
- Finally, it deprovisions the statefulset application and update the result.

#### Expected result

- Application should be running successfully.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/26736">26736</a>           |  Fails Jiva Replica and verify successful recovery           | Fri May  3 19:33:35 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:a3659d67674a285c3e823edb6d05ee54038a958a,type:phrase),type:phrase,value:a3659d67674a285c3e823edb6d05ee54038a958a),query:(match:(commit_id:(query:a3659d67674a285c3e823edb6d05ee54038a958a,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1217,type:phrase),type:phrase,value:1217),query:(match:(pipeline_id:(query:1217,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/25501">25501</a>           |  Fails Jiva Replica and verify successful recovery           | Fri May  3 14:06:52 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:be9e36dc07b23eed26cceb5571e5fc71260fc76c,type:phrase),type:phrase,value:be9e36dc07b23eed26cceb5571e5fc71260fc76c),query:(match:(commit_id:(query:be9e36dc07b23eed26cceb5571e5fc71260fc76c,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1182,type:phrase),type:phrase,value:1182),query:(match:(pipeline_id:(query:1182,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/25156">25156</a>           |  Fails Jiva Replica and verify successful recovery           | Thu May  2 19:22:34 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:6c00f8827288109ef0cb584c0c33fe77dfbe3d1a,type:phrase),type:phrase,value:6c00f8827288109ef0cb584c0c33fe77dfbe3d1a),query:(match:(commit_id:(query:6c00f8827288109ef0cb584c0c33fe77dfbe3d1a,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1173,type:phrase),type:phrase,value:1173),query:(match:(pipeline_id:(query:1173,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/25115">25115</a>   |  Fails Jiva Replica and verify successful recovery           |  Thu May  2 18:30:10 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:6c00f8827288109ef0cb584c0c33fe77dfbe3d1a,type:phrase),type:phrase,value:6c00f8827288109ef0cb584c0c33fe77dfbe3d1a),query:(match:(commit_id:(query:6c00f8827288109ef0cb584c0c33fe77dfbe3d1a,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1171,type:phrase),type:phrase,value:1171),query:(match:(pipeline_id:(query:1171,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
