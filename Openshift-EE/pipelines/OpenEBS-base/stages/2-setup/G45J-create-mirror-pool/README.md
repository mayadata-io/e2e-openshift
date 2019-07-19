### G45J-Create Mirrored Storage Pool using disks.

#### Description

Administrator should be able to use this job to create OpenEBS cStor based storage pool of type mirrored.

#### Prerequisites

- OpenShift cluster should be ready.
- OpenEBS should be deployed in cluster.
- Each node should have the disks attached depending on required pool configuration.

#### Procedure

- This job triggers litmus experiment which creates mirrored storage pool using disks.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest accordingly.
- This test checks if the required cStor pool is created successfully using kubectl command `kubectl get spc`
- This investigates if the corresponding cstor pool pods are running using SPC as label.
- Finally, this job updates the result CR with the actual result.

#### Expected result

- Storagepoolclaim should be created successfully and cStor pool pods should be running according to the maxpool count set.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/61322">61322</a>   |  Create cStor based mirrored storage pool on disks and corresponding storage class           |  Fri Jul 19 13:43:37 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'eccdfeaa2967e768c03d0fdf0f206b16c700c80e',type:phrase),type:phrase,value:'eccdfeaa2967e768c03d0fdf0f206b16c700c80e'),query:(match:(commit_id:(query:'eccdfeaa2967e768c03d0fdf0f206b16c700c80e',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'2397',type:phrase),type:phrase,value:'2397'),query:(match:(pipeline_id:(query:'2397',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
