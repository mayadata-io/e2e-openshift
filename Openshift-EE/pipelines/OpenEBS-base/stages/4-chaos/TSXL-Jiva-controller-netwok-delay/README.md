### TSXL-Verify application HA post jiva controller network delay.

#### Description

This test induces network delay on jiva controller pod and check if it doesn't affect the application availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva based storage class should have been created.

#### Procedure

- This job triggers the litmus experiments which induces packet delay on jiva controller pod.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS jiva Volume and check if the application is deployed successfully.
- Then, it induces network delay in jiva controller container and verify if the application is running successfully.
- Finally, it deprovisions the statefulset application and update the result.

#### Expected result

- Application should be running successfully.
| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/18018">18018</a>           |  Induce delay in jiva controller pod network and verify if the application is not impacted           | Fri Apr 19 12:27:39 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:5524254f4abf5897ebca28b58814a8d3beeba59e,type:phrase),type:phrase,value:5524254f4abf5897ebca28b58814a8d3beeba59e),query:(match:(commit_id:(query:5524254f4abf5897ebca28b58814a8d3beeba59e,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:941,type:phrase),type:phrase,value:941),query:(match:(pipeline_id:(query:941,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/17846">17846</a>   |  Induce delay in jiva controller pod network and verify if the application is not impacted           |  Thu Apr 18 22:52:48 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:5524254f4abf5897ebca28b58814a8d3beeba59e,type:phrase),type:phrase,value:5524254f4abf5897ebca28b58814a8d3beeba59e),query:(match:(commit_id:(query:5524254f4abf5897ebca28b58814a8d3beeba59e,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:936,type:phrase),type:phrase,value:936),query:(match:(pipeline_id:(query:936,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
