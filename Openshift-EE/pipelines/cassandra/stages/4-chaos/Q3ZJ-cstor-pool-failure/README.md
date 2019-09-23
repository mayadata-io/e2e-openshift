### Cstor pool pod failure.

#### Description

This job will induce failure in one of the cstor pool pods in the cluster. 

#### Prerequisites

- OpenShift cluster should be ready.
- Application should be deployed and running. 

#### Procedure

- The job should trigger the litmusbook which is capable of inducing cstor pool pod failure.
- The inputs such as application label, application namespace should be provided as environmental variable to the ansible-runner pod which executes the test.
- Check the status of pool pod after recovering from the failure. All the application replicas should be running.
- Check if the pool pod is recovered successfully.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/88758">88758</a>   |  Verify application availablity after deleting the pool pod.           |  Mon Sep 23 13:35:32 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:f7b08f10bd3fbe5b1afd6c46b9016bdd32ffcf2b,type:phrase),type:phrase,value:f7b08f10bd3fbe5b1afd6c46b9016bdd32ffcf2b),query:(match:(commit_id:(query:f7b08f10bd3fbe5b1afd6c46b9016bdd32ffcf2b,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:3316,type:phrase),type:phrase,value:3316),query:(match:(pipeline_id:(query:3316,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
