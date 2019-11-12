### 29O5-Fill OpenEBS volume with data.

#### Description
The job fills the cStor volume with data.

#### Prerequisites

- OpenShift cluster should be created.
- OpenEBS should be deployed in K8s cluster.
- cStor Storage pool should be created.

#### Procedure

- This job triggers the litmus experiments which is capable of deploying busybox application using OpenEBS volumes, filling the volume and deprovision the volume.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest accordingly.
- The first litmus experiment deploys busybox application and verifies if it is deployed successfully.
- The preceding litmus experiment uses fio tool to pump io traffic and checks if there is any io error.
- It also checks if the data can be filled upto the maximum capacity of volume.
- Finally, this job updates the result CR with the actual result.

#### Expected result

- The busybox application should be deployed successfully.
- The volume should be filled upto maximum capacity without any errors.
- Deprovisioning the application and its corresponding PVC should be successful.

#### Test Result

| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/10fffsdfs1916">10fffsdfs1916</a>           |  Check if the application is successfully deployed using CAS performance tuning parameters           | Thu Oct 24 16:17:35 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'725396f6ea16a63397af0cb672014acdb5ced383',type:phrase),type:phrase,value:'725396f6ea16a63397af0cb672014acdb5ced383'),query:(match:(commit_id:(query:'725396f6ea16a63397af0cb672014acdb5ced383',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'3719',type:phrase),type:phrase,value:'3719'),query:(match:(pipeline_id:(query:'3719',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/10fsdfs1916">10fsdfs1916</a>   |  Check if the application is successfully deployed using CAS performance tuning parameters           |  Thu Oct 24 16:17:35 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'725396f6ea16a63397af0cb672014acdb5ced383',type:phrase),type:phrase,value:'725396f6ea16a63397af0cb672014acdb5ced383'),query:(match:(commit_id:(query:'725396f6ea16a63397af0cb672014acdb5ced383',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'3719',type:phrase),type:phrase,value:'3719'),query:(match:(pipeline_id:(query:'3719',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
