#### KBM1-Verify application availablity post cstor-pool pod kill.

#### Description

This test kills the cstor pool pod and check if it doesn't affect the application availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which deletes the cstor-pool pod and check if the application is not impacted.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS Volume and check if the application is deployed successfully.
- Then, it deletes the cstor-pool pod and verifies if the application is running successfully.
- Finally, it deprovisions the statefulset application and update the result.


#### Expected result

Application should be running successfully.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/11605">11605</a>           |  Induce failure on cStor pool container(cstor-pool) and check if it is recovered successfully and verify that the application is not impacted           | Wed Mar 27 17:08:12 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:96535e6af284f82da3b7e11bab7a344783d56dbe,type:phrase),type:phrase,value:96535e6af284f82da3b7e11bab7a344783d56dbe),query:(match:(commit_id:(query:96535e6af284f82da3b7e11bab7a344783d56dbe,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:658,type:phrase),type:phrase,value:658),query:(match:(pipeline_id:(query:658,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/11299">11299</a>   |  Induce failure on cStor pool container(cstor-pool) and check if it is recovered successfully and verify that the application is not impacted           |  Wed Mar 27 15:28:55 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:68a81842f4a53fab4359b592b5f298d466d147a1,type:phrase),type:phrase,value:68a81842f4a53fab4359b592b5f298d466d147a1),query:(match:(commit_id:(query:68a81842f4a53fab4359b592b5f298d466d147a1,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:648,type:phrase),type:phrase,value:648),query:(match:(pipeline_id:(query:648,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
