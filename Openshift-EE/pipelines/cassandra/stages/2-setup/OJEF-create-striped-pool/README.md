### Create Storage Pool.

#### Description

This job that will create OpenEBS cStor based storage pool.

#### Prerequisites

- OpenShift cluster should be ready.
- Each node should have the disks attached depending on required pool configuration.

#### Procedure

- The job should be capable of creating SPC using disks.
- Check if the cStor pool is created using kubectl command `kubectl get spc`

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/35964">35964</a>           |  Create cStor based Striped storage pool on disks.           | Thu May 30 16:41:20 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:c0e4dbb5041fc5d0a6bf4c7f043e1ef3c6470ab1,type:phrase),type:phrase,value:c0e4dbb5041fc5d0a6bf4c7f043e1ef3c6470ab1),query:(match:(commit_id:(query:c0e4dbb5041fc5d0a6bf4c7f043e1ef3c6470ab1,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1545,type:phrase),type:phrase,value:1545),query:(match:(pipeline_id:(query:1545,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/35934">35934</a>   |  Create cStor based Striped storage pool on disks.           |  Thu May 30 15:28:59 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:200d4baec1049714d4f923e283bfd8c7944615f5,type:phrase),type:phrase,value:200d4baec1049714d4f923e283bfd8c7944615f5),query:(match:(commit_id:(query:200d4baec1049714d4f923e283bfd8c7944615f5,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1543,type:phrase),type:phrase,value:1543),query:(match:(pipeline_id:(query:1543,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
