### Deploy MongoDB.

#### Description

This job will deploy Mongodb application which uses OpenEBS cStor based persistent volumes.

#### Prerequisites

- The OpenShift cluster should be ready.
- OpenEBS should be deployed.
- cStor pool and storage class should be created.

#### Procedure

- The job triggers litmusbook which is capable of installing MongoDB statefulset application in its isolated namespace.
- The necessary inputs such as application label, namespace, size of PV can be passed as environmental variables to ansible-runner pod.
- Check if the MongoDB pods are  created and all replicas are running using the kubectl command `kubectl get pods -n <namespace>`

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/89719">89719</a>   |  Check if the mongodb is created successfully           |  Fri Sep 27 10:21:55 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:8a7fccb9fa67b3278bb9fa169e1a9f311cd140a2,type:phrase),type:phrase,value:8a7fccb9fa67b3278bb9fa169e1a9f311cd140a2),query:(match:(commit_id:(query:8a7fccb9fa67b3278bb9fa169e1a9f311cd140a2,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:3356,type:phrase),type:phrase,value:3356),query:(match:(pipeline_id:(query:3356,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
