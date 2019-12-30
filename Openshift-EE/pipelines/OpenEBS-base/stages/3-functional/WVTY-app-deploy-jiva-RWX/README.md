### WVTY-Deploy application with rwx PV for NFS Provisioner using JIVA.

#### Description

Administrator should be able to use this job to deploy application with openebs volumes in read-write-many mode.

#### Prerequisites

- OpenShift cluster should be ready.
- OpenEBS should be deployed in cluster.
- nfs provisioner should be deployed using jiva storage engine.

#### Procedure

- This job triggers litmus experiment which deploys application with openebs volumes in read-write-many mode.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest accordingly.
- Litmus experiment checks if the application deployment is successful.
- Finally, this job updates the result CR with the actual result.

#### Expected result

- Application deployment should be successful in rwx mode.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/131045">131045</a>           |  Deploy the application using nfs-provisioner accessmode as a readwritemany           | Mon Dec 30 09:20:48 UTC 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b',type:phrase),type:phrase,value:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b'),query:(match:(commit_id:(query:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'4510',type:phrase),type:phrase,value:'4510'),query:(match:(pipeline_id:(query:'4510',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/130230">130230</a>           |  Deploy the application using nfs-provisioner accessmode as a readwritemany           | Thu Dec 26 14:28:39 UTC 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b',type:phrase),type:phrase,value:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b'),query:(match:(commit_id:(query:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'4490',type:phrase),type:phrase,value:'4490'),query:(match:(pipeline_id:(query:'4490',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/130147">130147</a>   |  Deploy the application using nfs-provisioner accessmode as a readwritemany           |  Thu Dec 26 07:55:01 UTC 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b',type:phrase),type:phrase,value:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b'),query:(match:(commit_id:(query:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'4489',type:phrase),type:phrase,value:'4489'),query:(match:(pipeline_id:(query:'4489',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
