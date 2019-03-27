### 4ZWU-Distributing storage volume replicas across pools.

#### Description

The test goal is to ensure that the storage volume replicas are distributed across cstor storage pools in the case of statefulset application with single storage replica.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which deploy busybox statefulset application using OpenEBS storage class with single storage replica and multiple application replicas. This also triggers litmus experiment which verifies that the cStor volume replicas are distributes across the storage pools created in cluster.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest accordingly.
- The preceding litmus experiment verifies if the cstor storage volume replicas are distributed across the pool pods created in multiple nodes.
- Finally, the litmus experiment deletes the application deployed and verifies if the volume is deleted successfully.

#### Expected result

- The busybox statefulset application should be created successfully with single storage replica.
- The storage volume replicas should be scattered across different cstor pools in the cluster.

#### Test Result

| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/11788">11788</a>           |  Check if the storage volume replicas are distributed across the storage pools in case of statefulset deployment           | Wed Mar 27 20:43:44 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:f8ec1c0ddd2964a8fd8c7a5659b8598609468987,type:phrase),type:phrase,value:f8ec1c0ddd2964a8fd8c7a5659b8598609468987),query:(match:(commit_id:(query:f8ec1c0ddd2964a8fd8c7a5659b8598609468987,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:666,type:phrase),type:phrase,value:666),query:(match:(pipeline_id:(query:666,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/11767">11767</a>           |  Check if the storage volume replicas are distributed across the storage pools in case of statefulset deployment           | Wed Mar 27 19:23:07 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:a34e4fee6225291b50d1cb07043e4eb3491e93ef,type:phrase),type:phrase,value:a34e4fee6225291b50d1cb07043e4eb3491e93ef),query:(match:(commit_id:(query:a34e4fee6225291b50d1cb07043e4eb3491e93ef,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:665,type:phrase),type:phrase,value:665),query:(match:(pipeline_id:(query:665,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/11600">11600</a>   |  Check if the storage volume replicas are distributed across the storage pools in case of statefulset deployment           |  Wed Mar 27 16:44:44 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:96535e6af284f82da3b7e11bab7a344783d56dbe,type:phrase),type:phrase,value:96535e6af284f82da3b7e11bab7a344783d56dbe),query:(match:(commit_id:(query:96535e6af284f82da3b7e11bab7a344783d56dbe,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:658,type:phrase),type:phrase,value:658),query:(match:(pipeline_id:(query:658,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
