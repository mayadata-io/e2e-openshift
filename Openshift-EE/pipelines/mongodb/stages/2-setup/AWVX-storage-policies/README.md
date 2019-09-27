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
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/89717">89717</a>   |  Create K8s storage classes adhering the policies supported by OpenEBS           |  Fri Sep 27 10:21:27 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:8a7fccb9fa67b3278bb9fa169e1a9f311cd140a2,type:phrase),type:phrase,value:8a7fccb9fa67b3278bb9fa169e1a9f311cd140a2),query:(match:(commit_id:(query:8a7fccb9fa67b3278bb9fa169e1a9f311cd140a2,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:3356,type:phrase),type:phrase,value:3356),query:(match:(pipeline_id:(query:3356,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
