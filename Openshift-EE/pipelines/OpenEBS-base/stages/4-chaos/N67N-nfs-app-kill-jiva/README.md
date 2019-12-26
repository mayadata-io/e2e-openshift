### N67N - Verifying application HA post cStor NFS provisioner application pod kill.

#### Description

This job ensures that the application runs seamlessly on inducing the cStor NFS provisioner pod kill.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- OpenEBS storage class should be created with the desired storage pool claim.
- NFS Provisioner should be created using JIVA Storage Engine.

#### Procedure

- This job triggers the litmus experiments which induces failure on one of the application pods and ensures that there is no impact.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job induces NFS provisioner application pod kill chaos and verify if the application pod that using the nfs provisioner is rescheduled and running successfully.

#### Expected result

- NFS provisioner pod rescheduled successfully and accessible.
- Application writes (RWX pv) that uses NFS provisioner's JIVA volume should be successfull.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/130169">130169</a>   |  Induce application pod failure and check if it is recovered successfully           |  Thu Dec 26 10:06:34 UTC 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b',type:phrase),type:phrase,value:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b'),query:(match:(commit_id:(query:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'4489',type:phrase),type:phrase,value:'4489'),query:(match:(pipeline_id:(query:'4489',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
