### AUZF-Verifying application HA consuming jiva volume post application pod kill.

#### Description

This job ensures that the application consuming jiva volume runs seamlessly on inducing the application pod failure.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva based storage pool should have been created.

#### Procedure

- This job triggers the litmus experiments which induces failure on one of the application pods and ensures that there is no impact.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job deploys busybox statefulset application consuming OpenEBS Volume and checks if the application is deployed successfully.
- Then it induces application pod kill chaos and verify if the application pod is rescheduled and running successfully.
- Finally, the job deletes the busybox deployment.

#### Expected result

- Application pod should be rescheduled successfully.


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/17497">17497</a>           |  Induce application pod failure and check if it is recovered successfully           | Wed Apr 17 21:07:24 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:67834ab85a9715b73c043f074c77a1480a08232e,type:phrase),type:phrase,value:67834ab85a9715b73c043f074c77a1480a08232e),query:(match:(commit_id:(query:67834ab85a9715b73c043f074c77a1480a08232e,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:924,type:phrase),type:phrase,value:924),query:(match:(pipeline_id:(query:924,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/17466">17466</a>   |  Induce application pod failure and check if it is recovered successfully           |  Wed Apr 17 19:34:49 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:c5286f8e1c7c9f0d20a8895e1e10b2d0302e8c70,type:phrase),type:phrase,value:c5286f8e1c7c9f0d20a8895e1e10b2d0302e8c70),query:(match:(commit_id:(query:c5286f8e1c7c9f0d20a8895e1e10b2d0302e8c70,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:923,type:phrase),type:phrase,value:923),query:(match:(pipeline_id:(query:923,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
