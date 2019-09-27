### OpenShift Cluster setup.

#### Description

This stage includes the job that will configure OpenShift-3.10 enterprise cluster and check if it is healthy for carrying out the e2e tests.

#### Prerequisites

- The host environment should be setup and it should have the dependencies installed.

#### Procedure

- The job should be capable of creating OpenShift 3.10 cluster with one master and 4 nodes configuration.
- Check if the OpenShift cluster is ready using kubectl command `kubectl get nodes`

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/89715">89715</a>   |  Configure OpenShift cluster           |  Fri Sep 27 03:44:54 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:8a7fccb9fa67b3278bb9fa169e1a9f311cd140a2,type:phrase),type:phrase,value:8a7fccb9fa67b3278bb9fa169e1a9f311cd140a2),query:(match:(commit_id:(query:8a7fccb9fa67b3278bb9fa169e1a9f311cd140a2,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:3356,type:phrase),type:phrase,value:3356),query:(match:(pipeline_id:(query:3356,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
