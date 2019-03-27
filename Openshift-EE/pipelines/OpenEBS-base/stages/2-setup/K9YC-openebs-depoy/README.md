### K9YC-Install OpenEBS in OpenShift Enterprise cluster.

#### Description

This job will deploy OpenEBS on OpenShift cluster enterprise cluster and check if all the components are healthy.

#### Prerequisites

- The OpenShift cluster should be ready.

#### Procedure

- This job triggers a litmus experiment which installs OpenEBS components in the OpenShift 3.10 cluster. By default, it creates a new namespace called OpenEBS and installs the OpenEBS objects inside that namespace.
- Check if all the OpenEBS components are installed using kubectl command `kubectl get pods -n openebs`
- Finally, this job updates the litmusresult CR with the actual result.

#### Expected Result

- This job should deploy OpenEBS components such as maya-apiserver, openebs-provisioner, openebs-snapshot-operator, openebs-ndm pods, openebs-admission-server and default cstor pool pods successfully.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/11267">11267</a>   |  Deploy OpenEBS in OpenShift-EE-3.10 Cluster           |  Wed Mar 27 12:33:20 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:f922ae1f528b2b3c8b3a60db161ef1349f56bbd7,type:phrase),type:phrase,value:f922ae1f528b2b3c8b3a60db161ef1349f56bbd7),query:(match:(commit_id:(query:f922ae1f528b2b3c8b3a60db161ef1349f56bbd7,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:647,type:phrase),type:phrase,value:647),query:(match:(pipeline_id:(query:647,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
