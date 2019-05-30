### Install OpenEBS.

#### Description

This job will configure OpenEBS on the OpenShift cluster enterprise cluster and check if all the components are healthy.

#### Prerequisites

- The OpenShift cluster should be ready.

#### Procedure

- The job installs OpenEBS components in the  OpenShift 3.10 cluster. By default, it created a new namespace called OpenEBS and installs the resources/objects inside that namespace.
- Check if all the OpenEBS components are installed using kubectl command `kubectl get pods -m openebs`

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/36134">36134</a>           |  Deploy OpenEBS in OpenShift-EE-3.10 Cluster           | Thu May 30 19:11:53 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:cb476f8e715fb374877c31b699863b56dd3c5ded,type:phrase),type:phrase,value:cb476f8e715fb374877c31b699863b56dd3c5ded),query:(match:(commit_id:(query:cb476f8e715fb374877c31b699863b56dd3c5ded,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1551,type:phrase),type:phrase,value:1551),query:(match:(pipeline_id:(query:1551,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/35977">35977</a>           |  Deploy OpenEBS in OpenShift-EE-3.10 Cluster           | Thu May 30 18:10:07 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:cb476f8e715fb374877c31b699863b56dd3c5ded,type:phrase),type:phrase,value:cb476f8e715fb374877c31b699863b56dd3c5ded),query:(match:(commit_id:(query:cb476f8e715fb374877c31b699863b56dd3c5ded,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1546,type:phrase),type:phrase,value:1546),query:(match:(pipeline_id:(query:1546,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/35962">35962</a>           |  Deploy OpenEBS in OpenShift-EE-3.10 Cluster           | Thu May 30 16:38:30 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:c0e4dbb5041fc5d0a6bf4c7f043e1ef3c6470ab1,type:phrase),type:phrase,value:c0e4dbb5041fc5d0a6bf4c7f043e1ef3c6470ab1),query:(match:(commit_id:(query:c0e4dbb5041fc5d0a6bf4c7f043e1ef3c6470ab1,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1545,type:phrase),type:phrase,value:1545),query:(match:(pipeline_id:(query:1545,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/35932">35932</a>   |  Deploy OpenEBS in OpenShift-EE-3.10 Cluster           |  Thu May 30 15:24:47 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:200d4baec1049714d4f923e283bfd8c7944615f5,type:phrase),type:phrase,value:200d4baec1049714d4f923e283bfd8c7944615f5),query:(match:(commit_id:(query:200d4baec1049714d4f923e283bfd8c7944615f5,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1543,type:phrase),type:phrase,value:1543),query:(match:(pipeline_id:(query:1543,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
