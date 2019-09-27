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
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/89718">89718</a>   |  Create cStor based Striped storage pool on disks and corresponding storage class           |  Fri Sep 27 10:13:33 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:8a7fccb9fa67b3278bb9fa169e1a9f311cd140a2,type:phrase),type:phrase,value:8a7fccb9fa67b3278bb9fa169e1a9f311cd140a2),query:(match:(commit_id:(query:8a7fccb9fa67b3278bb9fa169e1a9f311cd140a2,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:3356,type:phrase),type:phrase,value:3356),query:(match:(pipeline_id:(query:3356,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
