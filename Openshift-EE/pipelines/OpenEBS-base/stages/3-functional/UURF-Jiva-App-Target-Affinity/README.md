### UURF-Verify if the application pod and jiva controller are scheduled on same node.

#### Description

This test checks if the application pod and its corresponding jiva controller are scheduled on the same kubernetes node.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva based storage pool should have been created.
- OpenEBS storage class using jivs cas-type should be created.

#### Procedure

- This job triggers the litmus experiments which checks if the application pod and its corresponding jiva controller pod are scheduled on the same node.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job deploys a statefulset application using openebs jiva based storage class.
- Post successful application deployment, checks if the number of application replicas matches the desired value.
- And also, the job checks if each of the application replica pod and its corresponding jiva controller pod are scheduled on the same node.
- The job fails if they are not scheduled on same node.

#### Expected result

- The application replica pod and its corresponding jiva controller pod should be scheduled on same node.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/17453">17453</a>           |  Checking Application and target scheduled on same Node           | Wed Apr 17 17:52:16 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:c5286f8e1c7c9f0d20a8895e1e10b2d0302e8c70,type:phrase),type:phrase,value:c5286f8e1c7c9f0d20a8895e1e10b2d0302e8c70),query:(match:(commit_id:(query:c5286f8e1c7c9f0d20a8895e1e10b2d0302e8c70,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:923,type:phrase),type:phrase,value:923),query:(match:(pipeline_id:(query:923,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/16717">16717</a>   |  Checking Application and target scheduled on same Node           |  Wed Apr 17 10:27:03 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:c33cc84fa4f1cbab77ead58122cd5675f227a08d,type:phrase),type:phrase,value:c33cc84fa4f1cbab77ead58122cd5675f227a08d),query:(match:(commit_id:(query:c33cc84fa4f1cbab77ead58122cd5675f227a08d,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:902,type:phrase),type:phrase,value:902),query:(match:(pipeline_id:(query:902,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
