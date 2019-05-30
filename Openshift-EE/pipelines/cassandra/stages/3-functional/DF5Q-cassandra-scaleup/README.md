### Cassandra Scaleup.

#### Description

This job will scale up the applications replicas in cassandra statefulset .

#### Prerequisites

- The OpenShift cluster should be ready.
- OpenEBS should be deployed.
- cStor pool and storage class should be created.
- Cassandra should be deployed in cluster.

#### Procedure

- The job triggers litmusbook which is capable of scaling up the replicas in Cassandra statefulset application. The desired number of application replicas should be passed as env in the litmus pod.
- Check if statefulset is scaled up and all replicas are running using the kubectl command `kubectl get sts -n <namespace>`

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/35937">35937</a>   |  Scaling up Cassandra application replicas           |  Thu May 30 15:31:20 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:200d4baec1049714d4f923e283bfd8c7944615f5,type:phrase),type:phrase,value:200d4baec1049714d4f923e283bfd8c7944615f5),query:(match:(commit_id:(query:200d4baec1049714d4f923e283bfd8c7944615f5,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:1543,type:phrase),type:phrase,value:1543),query:(match:(pipeline_id:(query:1543,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
