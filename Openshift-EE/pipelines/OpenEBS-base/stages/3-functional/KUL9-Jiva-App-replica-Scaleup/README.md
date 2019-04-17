### KUL9-Verify if the application consuming Jiva storage can be scaled up.

#### Description

This test checks if the application replicas consuming jiva based storage can be scaled up.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva based storage pool should have been created. A default storage pool is created by default during OpenEBS deployment.
- OpenEBS storage class using jiva cas-type should be created.

#### Procedure

- This job triggers the litmus experiments which checks if the application replicas in a deployment /statefulset using jiva persistent volume can be scaled up.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job deploys an application using openebs jiva based storage class.
- Post successful application deployment, attempts to scale the application replica to higher value.
- After scaleup, the new ready-replica value should match the desired value.

#### Expected result

- The application replica pods should be scaled up successfully.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/17483">17483</a>   |  Scale the statefulset application replicas and verify the ring configuration           |  Wed Apr 17 20:49:19 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:67834ab85a9715b73c043f074c77a1480a08232e,type:phrase),type:phrase,value:67834ab85a9715b73c043f074c77a1480a08232e),query:(match:(commit_id:(query:67834ab85a9715b73c043f074c77a1480a08232e,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:924,type:phrase),type:phrase,value:924),query:(match:(pipeline_id:(query:924,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
