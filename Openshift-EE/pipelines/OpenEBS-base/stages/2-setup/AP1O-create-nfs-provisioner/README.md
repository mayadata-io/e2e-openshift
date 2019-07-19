### AP1O-Create NFS provisioner on openshift cluster.

#### Description

Administrator should be able to use this job to create OpenEBS cStor based storage pool of type mirrored.

#### Prerequisites

- OpenShift cluster should be ready.

#### Procedure

- This job triggers litmus experiment which creates NFS provisioner in openshift cluster.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest accordingly.
- Deploy nfs provisioner version based on the specified environmental variable.
- This test checks if the desired deployment is created.
- Finally, this job updates the result CR with the actual result.

#### Expected result

- nfs provisioner deployment should be successful.

#### Test Result



| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/61394">61394</a>           |  Create NFS provisioner and corresponding storage class           | Fri Jul 19 18:50:00 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'eccdfeaa2967e768c03d0fdf0f206b16c700c80e',type:phrase),type:phrase,value:'eccdfeaa2967e768c03d0fdf0f206b16c700c80e'),query:(match:(commit_id:(query:'eccdfeaa2967e768c03d0fdf0f206b16c700c80e',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'2399',type:phrase),type:phrase,value:'2399'),query:(match:(pipeline_id:(query:'2399',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/61334">61334</a>           |  Create NFS provisioner and corresponding storage class           | Fri Jul 19 13:49:55 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'eccdfeaa2967e768c03d0fdf0f206b16c700c80e',type:phrase),type:phrase,value:'eccdfeaa2967e768c03d0fdf0f206b16c700c80e'),query:(match:(commit_id:(query:'eccdfeaa2967e768c03d0fdf0f206b16c700c80e',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'2397',type:phrase),type:phrase,value:'2397'),query:(match:(pipeline_id:(query:'2397',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/61274">61274</a>   |  Create NFS provisioner and corresponding storage class           |  Fri Jul 19 09:37:21 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'eccdfeaa2967e768c03d0fdf0f206b16c700c80e',type:phrase),type:phrase,value:'eccdfeaa2967e768c03d0fdf0f206b16c700c80e'),query:(match:(commit_id:(query:'eccdfeaa2967e768c03d0fdf0f206b16c700c80e',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'2395',type:phrase),type:phrase,value:'2395'),query:(match:(pipeline_id:(query:'2395',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
