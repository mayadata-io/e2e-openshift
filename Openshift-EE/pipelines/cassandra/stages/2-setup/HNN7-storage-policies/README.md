### Storage Classes creation.

#### Description

This job that will create the storage classes with the properties supported by OpenEBS.

#### Prerequisites

- K8s cluster should be created.
- OpenEBS should be deployed in K8s cluster.
- Storage pool should be created.

#### Procedure

- The job should be capable of creating OpenEBS storage classes.
- Check if the OpenEBS storage classes are created using kubectl command `kubectl get sc`

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/36135">36135</a>           |  Create K8s storage classes adhering the policies supported by OpenEBS           | Thu May 30 19:17:12 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:cb476f8e715fb374877c31b699863b56dd3c5ded,type:phrase),type:phrase,value:cb476f8e715fb374877c31b699863b56dd3c5ded),query:(match:(commit_id:(query:cb476f8e715fb374877c31b699863b56dd3c5ded,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1551,type:phrase),type:phrase,value:1551),query:(match:(pipeline_id:(query:1551,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/35978">35978</a>           |  Create K8s storage classes adhering the policies supported by OpenEBS           | Thu May 30 18:15:19 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:cb476f8e715fb374877c31b699863b56dd3c5ded,type:phrase),type:phrase,value:cb476f8e715fb374877c31b699863b56dd3c5ded),query:(match:(commit_id:(query:cb476f8e715fb374877c31b699863b56dd3c5ded,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1546,type:phrase),type:phrase,value:1546),query:(match:(pipeline_id:(query:1546,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/35963">35963</a>           |  Create K8s storage classes adhering the policies supported by OpenEBS           | Thu May 30 16:43:01 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:c0e4dbb5041fc5d0a6bf4c7f043e1ef3c6470ab1,type:phrase),type:phrase,value:c0e4dbb5041fc5d0a6bf4c7f043e1ef3c6470ab1),query:(match:(commit_id:(query:c0e4dbb5041fc5d0a6bf4c7f043e1ef3c6470ab1,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1545,type:phrase),type:phrase,value:1545),query:(match:(pipeline_id:(query:1545,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/35933">35933</a>   |  Create K8s storage classes adhering the policies supported by OpenEBS           |  Thu May 30 15:30:52 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:200d4baec1049714d4f923e283bfd8c7944615f5,type:phrase),type:phrase,value:200d4baec1049714d4f923e283bfd8c7944615f5),query:(match:(commit_id:(query:200d4baec1049714d4f923e283bfd8c7944615f5,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1543,type:phrase),type:phrase,value:1543),query:(match:(pipeline_id:(query:1543,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
