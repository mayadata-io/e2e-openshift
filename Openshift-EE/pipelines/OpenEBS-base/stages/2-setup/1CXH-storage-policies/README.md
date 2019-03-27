### 1CXH-OpenEBS Storage Classes creation.

#### Description

This job will create storage classes with the properties supported by OpenEBS.

#### Prerequisites

- OpenShift cluster should be created.
- OpenEBS should be deployed in K8s cluster.
- Storage pool should be created.

#### Procedure

- This job triggers the litmus experiment which is capable of creating OpenEBS storage classes.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest accordingly.
- This job updates the Storage classes template should with the storagepoolclaim name and initiates the required storage classes creation.
- The test should check if the OpenEBS storage classes are created using kubectl command `kubectl get sc`
- Finally, this job updates the result CR with the actual result.

#### Expected result

- The required OpenEBS storage classes should be created successfully.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/11595">11595</a>           |  Create K8s storage classes adhering the policies supported by OpenEBS           | Wed Mar 27 16:35:07 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:96535e6af284f82da3b7e11bab7a344783d56dbe,type:phrase),type:phrase,value:96535e6af284f82da3b7e11bab7a344783d56dbe),query:(match:(commit_id:(query:96535e6af284f82da3b7e11bab7a344783d56dbe,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:658,type:phrase),type:phrase,value:658),query:(match:(pipeline_id:(query:658,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/11289">11289</a>   |  Create K8s storage classes adhering the policies supported by OpenEBS           |  Wed Mar 27 15:28:15 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:68a81842f4a53fab4359b592b5f298d466d147a1,type:phrase),type:phrase,value:68a81842f4a53fab4359b592b5f298d466d147a1),query:(match:(commit_id:(query:68a81842f4a53fab4359b592b5f298d466d147a1,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:648,type:phrase),type:phrase,value:648),query:(match:(pipeline_id:(query:648,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
