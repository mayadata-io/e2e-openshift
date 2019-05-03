### KLPX-Verify application availability upon inducing network delay in jiva replica pod.

#### Description

This test induces network delay on one of the jiva replica pods and check if it doesn't affect the application availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva based storage pool should have been created.

#### Procedure

- This job triggers the litmus experiments which induces packet delay on jiva replic pod.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS jiva Volume and check if the application is deployed successfully.
- Then, it induces network delay in jiva replica container and verify if the application is running successfully.
- Finally, it deprovisions the statefulset application and update the result.

#### Expected result

- Application should be running successfully.

#### Test Result



 
| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/26891">26891</a>           |  Inject network delay in jiva replica & verify successful recovery           | Sat May  4 04:08:45 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:a6b345adbd8d50ed89f7f01337d02120c843d7b1,type:phrase),type:phrase,value:a6b345adbd8d50ed89f7f01337d02120c843d7b1),query:(match:(commit_id:(query:a6b345adbd8d50ed89f7f01337d02120c843d7b1,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1222,type:phrase),type:phrase,value:1222),query:(match:(pipeline_id:(query:1222,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/26853">26853</a>           |  Inject network delay in jiva replica & verify successful recovery           | Fri May  3 22:52:04 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:a3659d67674a285c3e823edb6d05ee54038a958a,type:phrase),type:phrase,value:a3659d67674a285c3e823edb6d05ee54038a958a),query:(match:(commit_id:(query:a3659d67674a285c3e823edb6d05ee54038a958a,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1221,type:phrase),type:phrase,value:1221),query:(match:(pipeline_id:(query:1221,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/26812">26812</a>           |  Inject network delay in jiva replica & verify successful recovery           | Fri May  3 21:41:17 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:a6b345adbd8d50ed89f7f01337d02120c843d7b1,type:phrase),type:phrase,value:a6b345adbd8d50ed89f7f01337d02120c843d7b1),query:(match:(commit_id:(query:a6b345adbd8d50ed89f7f01337d02120c843d7b1,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1219,type:phrase),type:phrase,value:1219),query:(match:(pipeline_id:(query:1219,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/26735">26735</a>   |  Inject network delay in jiva replica & verify successful recovery           |  Fri May  3 19:33:10 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:a3659d67674a285c3e823edb6d05ee54038a958a,type:phrase),type:phrase,value:a3659d67674a285c3e823edb6d05ee54038a958a),query:(match:(commit_id:(query:a3659d67674a285c3e823edb6d05ee54038a958a,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1217,type:phrase),type:phrase,value:1217),query:(match:(pipeline_id:(query:1217,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
