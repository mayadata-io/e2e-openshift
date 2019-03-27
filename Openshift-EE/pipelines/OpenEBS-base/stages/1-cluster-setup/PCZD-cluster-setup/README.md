### PCZD-Setting up OpenShift enterprise cluster.

#### Description

The administrator should be able to use this job to configure OpenShift-3.10 enterprise cluster in vSphere based virtual machines and check if it is healthy for carrying out e2e tests.

#### Prerequisites

- The host machines should be created and have the dependent packages installed in all the machines.

#### Procedure

- This job triggers a litmus experiment which configures OpenShift enterprise cluster using its corresponding inventory.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the inventory accordingly.
- This test should check if the OpenShift cluster is ready using kubectl command ```kubectl get nodes```

#### Expected result

- OpenShift enterprise cluster should be configured successfully. All the nodes in the cluster should be in healthy state. 

#### Test Result

| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/11267">11267</a>   |  Configure OpenShift cluster           |  Wed Mar 27 15:08:15 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:f922ae1f528b2b3c8b3a60db161ef1349f56bbd7,type:phrase),type:phrase,value:f922ae1f528b2b3c8b3a60db161ef1349f56bbd7),query:(match:(commit_id:(query:f922ae1f528b2b3c8b3a60db161ef1349f56bbd7,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:647,type:phrase),type:phrase,value:647),query:(match:(pipeline_id:(query:647,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
