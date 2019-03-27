### 72WM-Verify applicaton availablity post cStor pool pod failure.

#### Description

This test simulates cStor pool pod failure by deleting it and checks if it doesn't affect the application availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which induces failure on cStor pool pod.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS Volume and check if the application is deployed successfully.
- Then it induces cstor-pool pod failure by deleting it and verifies if the application is running successfully.
- Finally, deprovisions the statefulset application and update result.

#### Expected result

- Application should be running successfully and pod should be rescheduled again.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/11300">11300</a>           |  Delete cStor Pool           | Wed Mar 27 15:32:50 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:68a81842f4a53fab4359b592b5f298d466d147a1,type:phrase),type:phrase,value:68a81842f4a53fab4359b592b5f298d466d147a1),query:(match:(commit_id:(query:68a81842f4a53fab4359b592b5f298d466d147a1,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:648,type:phrase),type:phrase,value:648),query:(match:(pipeline_id:(query:648,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/10433">10433</a>           |  job-desc10           | Mar 26 15:03:00 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'7889d1dc95075974dbd669c136a0d3292e181332',type:phrase),type:phrase,value:'7889d1dc95075974dbd669c136a0d3292e181332'),query:(match:(commit_id:(query:'7889d1dc95075974dbd669c136a0d3292e181332',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'613',type:phrase),type:phrase,value:'613'),query:(match:(pipeline_id:(query:'613',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">PASS</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/10433">10433</a>   |  job-desc10           |  Mar 26 15:03:00 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'7889d1dc95075974dbd669c136a0d3292e181332',type:phrase),type:phrase,value:'7889d1dc95075974dbd669c136a0d3292e181332'),query:(match:(commit_id:(query:'7889d1dc95075974dbd669c136a0d3292e181332',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'613',type:phrase),type:phrase,value:'613'),query:(match:(pipeline_id:(query:'613',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">PASS</a>  |
