### Cstor target pod failure.

#### Description

This job will induce failure in cstor target pod in the cluster. 

#### Prerequisites

- OpenShift cluster should be ready.
- Application should be deployed and running. 

#### Procedure

- The job should trigger the litmusbook which is capable of inducing cstor target pod failure.
- The inputs such as application label, application namespace should be provided as environmental variable to the ansible-runner pod which executes the test.
- Check the status of target pod after recovering from the failure. All the application replicas should be running.
- Check if the target pod is recovered successfully.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/89746">89746</a>   |  Verify application availablity post cstor target pod kill.           |  Fri Sep 27 12:19:43 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:37d33b9a0605b43f51c72d53134063e32256a0b2,type:phrase),type:phrase,value:37d33b9a0605b43f51c72d53134063e32256a0b2),query:(match:(commit_id:(query:37d33b9a0605b43f51c72d53134063e32256a0b2,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:3357,type:phrase),type:phrase,value:3357),query:(match:(pipeline_id:(query:3357,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
