### VO3D-Verify application availablity post jiva controller failure

#### Description

This test kills the jiva controller pod and check if it doesn't affect the application availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- jiva based storage class should have been created.

#### Procedure

- This job triggers the litmus experiments which kills the jiva controller pod and check if the application is not impacted.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS jiva Volume and check if the application is deployed successfully.
- Then, it kills the jiva controller pod and verify if the application is running successfully.
- Finally, it deprovisions the statefulset application and update the result.

#### Expected result

- Application should be running successfully.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/17845">17845</a>           |  Induce failure on JIVA controller pod and check if it gets scheduled immediately and the application is available           | Thu Apr 18 23:03:46 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:5524254f4abf5897ebca28b58814a8d3beeba59e,type:phrase),type:phrase,value:5524254f4abf5897ebca28b58814a8d3beeba59e),query:(match:(commit_id:(query:5524254f4abf5897ebca28b58814a8d3beeba59e,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:936,type:phrase),type:phrase,value:936),query:(match:(pipeline_id:(query:936,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/17530">17530</a>   |  Induce failure on JIVA controller pod and check if it gets scheduled immediately and the application is available           |  Wed Apr 17 23:10:29 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:0e8361f3be0afee04fd542f4b58108f507fbf1c1,type:phrase),type:phrase,value:0e8361f3be0afee04fd542f4b58108f507fbf1c1),query:(match:(commit_id:(query:0e8361f3be0afee04fd542f4b58108f507fbf1c1,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:925,type:phrase),type:phrase,value:925),query:(match:(pipeline_id:(query:925,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
