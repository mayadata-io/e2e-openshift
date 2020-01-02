### 0ACF - Verifying application HA post cStor NFS provisioner application pod kill.

#### Description

This job ensures that the application runs seamlessly on inducing the cStor NFS provisioner pod kill.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.
- NFS Provisioner should be created using cStor Storage Engine.

#### Procedure

- This job triggers the litmus experiments which induces failure on one of the application pods and ensures that there is no impact.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job induces NFS provisioner application pod kill chaos and verify if the application pod that using the nfs provisioner is rescheduled and running successfully.

#### Expected result

- NFS provisioner pod rescheduled successfully and accessible.
- Application writes (RWX pv) that uses NFS provisioner cStor volume should be successfull.

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/132704">132704</a>           |  Induce application pod failure and check if it is recovered successfully           | Thu Jan  2 12:41:39 UTC 2020  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'f04be7ed8b1bd9cdcc3207381204b2dbbda003da',type:phrase),type:phrase,value:'f04be7ed8b1bd9cdcc3207381204b2dbbda003da'),query:(match:(commit_id:(query:'f04be7ed8b1bd9cdcc3207381204b2dbbda003da',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'4541',type:phrase),type:phrase,value:'4541'),query:(match:(pipeline_id:(query:'4541',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/131857">131857</a>           |  Induce application pod failure and check if it is recovered successfully           | Mon Dec 30 20:52:42 UTC 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'13422c3d747d4d5acc6009de526e3f26b119b537',type:phrase),type:phrase,value:'13422c3d747d4d5acc6009de526e3f26b119b537'),query:(match:(commit_id:(query:'13422c3d747d4d5acc6009de526e3f26b119b537',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'4526',type:phrase),type:phrase,value:'4526'),query:(match:(pipeline_id:(query:'4526',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/131057">131057</a>           |  Induce application pod failure and check if it is recovered successfully           | Mon Dec 30 10:38:59 UTC 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b',type:phrase),type:phrase,value:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b'),query:(match:(commit_id:(query:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'4510',type:phrase),type:phrase,value:'4510'),query:(match:(pipeline_id:(query:'4510',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/130242">130242</a>           |  Induce application pod failure and check if it is recovered successfully           | Thu Dec 26 20:12:07 UTC 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b',type:phrase),type:phrase,value:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b'),query:(match:(commit_id:(query:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'4490',type:phrase),type:phrase,value:'4490'),query:(match:(pipeline_id:(query:'4490',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/130159">130159</a>   |  Induce application pod failure and check if it is recovered successfully           |  Thu Dec 26 10:05:11 UTC 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b',type:phrase),type:phrase,value:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b'),query:(match:(commit_id:(query:'1a740e6612cced2f259e2bd133cd1bcdc2bbbb4b',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'4489',type:phrase),type:phrase,value:'4489'),query:(match:(pipeline_id:(query:'4489',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
