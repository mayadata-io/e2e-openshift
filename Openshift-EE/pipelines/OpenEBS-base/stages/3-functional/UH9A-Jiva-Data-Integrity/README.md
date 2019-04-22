### QDLO-Jiva-Data integrity Test

#### Description

This test ensures the data integrity in Jiva based openebs volume using the tool fio.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- jiva based storage pool should have been created.
- OpenEBS storage class using jiva cas-type should be created.

#### Procedure

- This job triggers the litmus experiments which checks if the data integrity is maintained in OpenEBS jiva volume using fio.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job deploys an application using jiva based openebs storage class.
- It uses fio tool to pump data traffic inside the application mount path.
- And then, it induces failure in corresponding jiva controller pod.
- Finally, it checks if the storage controller is recovered and ensures data integrity using fio

#### Expected result

- There should not be any io error observed.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/19982">19982</a>           |  Ensure the data integrity in openebs volume using fio           | Mon Apr 22 14:21:49 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:d0cb69c17b582910f163fca5f8d5b581cc0d326d,type:phrase),type:phrase,value:d0cb69c17b582910f163fca5f8d5b581cc0d326d),query:(match:(commit_id:(query:d0cb69c17b582910f163fca5f8d5b581cc0d326d,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1000,type:phrase),type:phrase,value:1000),query:(match:(pipeline_id:(query:1000,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/19386">19386</a>           |  Ensure the data integrity in openebs volume using fio           | Mon Apr 22 11:44:06 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:d0cb69c17b582910f163fca5f8d5b581cc0d326d,type:phrase),type:phrase,value:d0cb69c17b582910f163fca5f8d5b581cc0d326d),query:(match:(commit_id:(query:d0cb69c17b582910f163fca5f8d5b581cc0d326d,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:983,type:phrase),type:phrase,value:983),query:(match:(pipeline_id:(query:983,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/19159">19159</a>           |  Ensure the data integrity in openebs volume using fio           | Sun Apr 21 16:23:42 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:5524254f4abf5897ebca28b58814a8d3beeba59e,type:phrase),type:phrase,value:5524254f4abf5897ebca28b58814a8d3beeba59e),query:(match:(commit_id:(query:5524254f4abf5897ebca28b58814a8d3beeba59e,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:974,type:phrase),type:phrase,value:974),query:(match:(pipeline_id:(query:974,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/18000">18000</a>           |  Ensure the data integrity in openebs volume using fio           | Fri Apr 19 12:03:07 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:5524254f4abf5897ebca28b58814a8d3beeba59e,type:phrase),type:phrase,value:5524254f4abf5897ebca28b58814a8d3beeba59e),query:(match:(commit_id:(query:5524254f4abf5897ebca28b58814a8d3beeba59e,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:941,type:phrase),type:phrase,value:941),query:(match:(pipeline_id:(query:941,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/17828">17828</a>           |  Ensure the data integrity in openebs volume using fio           | Thu Apr 18 22:25:48 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:5524254f4abf5897ebca28b58814a8d3beeba59e,type:phrase),type:phrase,value:5524254f4abf5897ebca28b58814a8d3beeba59e),query:(match:(commit_id:(query:5524254f4abf5897ebca28b58814a8d3beeba59e,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:936,type:phrase),type:phrase,value:936),query:(match:(pipeline_id:(query:936,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/17513">17513</a>   |  Ensure the data integrity in openebs volume using fio           |  Wed Apr 17 22:33:58 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:0e8361f3be0afee04fd542f4b58108f507fbf1c1,type:phrase),type:phrase,value:0e8361f3be0afee04fd542f4b58108f507fbf1c1),query:(match:(commit_id:(query:0e8361f3be0afee04fd542f4b58108f507fbf1c1,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:925,type:phrase),type:phrase,value:925),query:(match:(pipeline_id:(query:925,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
