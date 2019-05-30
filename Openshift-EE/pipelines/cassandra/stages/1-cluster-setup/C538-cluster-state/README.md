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
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/35931">35931</a>           |  Configure OpenShift cluster           | Thu May 30 09:48:55 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:200d4baec1049714d4f923e283bfd8c7944615f5,type:phrase),type:phrase,value:200d4baec1049714d4f923e283bfd8c7944615f5),query:(match:(commit_id:(query:200d4baec1049714d4f923e283bfd8c7944615f5,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1543,type:phrase),type:phrase,value:1543),query:(match:(pipeline_id:(query:1543,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/35916">35916</a>           |  Configure OpenShift cluster           | Thu May 30 09:36:31 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:9293f2ccb12d7f9b96c03bc722a330623445d797,type:phrase),type:phrase,value:9293f2ccb12d7f9b96c03bc722a330623445d797),query:(match:(commit_id:(query:9293f2ccb12d7f9b96c03bc722a330623445d797,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1542,type:phrase),type:phrase,value:1542),query:(match:(pipeline_id:(query:1542,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/35573">35573</a>   |  Configure OpenShift cluster           |  Thu May 30 06:58:30 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:9293f2ccb12d7f9b96c03bc722a330623445d797,type:phrase),type:phrase,value:9293f2ccb12d7f9b96c03bc722a330623445d797),query:(match:(commit_id:(query:9293f2ccb12d7f9b96c03bc722a330623445d797,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1532,type:phrase),type:phrase,value:1532),query:(match:(pipeline_id:(query:1532,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
