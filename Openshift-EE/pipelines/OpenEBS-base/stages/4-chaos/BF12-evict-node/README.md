### Verify applicaton availablity when node is evicted due to disk-pressure taint.

#### Description
Evict node due to disk-pressure taint and check if application is rescheduled and verify its availability.

#### Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure
- Deploy statefulset application consuming OpenEBS Volume.
- Check if the application is deployed successfully.
- Evict node due to disk-pressure taint and check if application is rescheduled and verify its availability.
- Deprovision statefulset application.

#### Test Result

| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/10433">10433</a>           |  job-desc2           | Mar 26 15:03:00 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:7889d1dc95075974dbd669c136a0d3292e181332,type:phrase),type:phrase,value:7889d1dc95075974dbd669c136a0d3292e181332),query:(match:(commit_id:(query:7889d1dc95075974dbd669c136a0d3292e181332,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:613,type:phrase),type:phrase,value:613),query:(match:(pipeline_id:(query:613,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">PASS</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/10433">10433</a>           |  job-desc2           | Mar 26 15:03:00 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:7889d1dc95075974dbd669c136a0d3292e181332,type:phrase),type:phrase,value:7889d1dc95075974dbd669c136a0d3292e181332),query:(match:(commit_id:(query:7889d1dc95075974dbd669c136a0d3292e181332,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:613,type:phrase),type:phrase,value:613),query:(match:(pipeline_id:(query:613,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">PASS</a> |
|     <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/10433">10433</a>           |  job-desc2           | Mar 26 15:03:00 IST 2019  | <a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:7889d1dc95075974dbd669c136a0d3292e181332,type:phrase),type:phrase,value:7889d1dc95075974dbd669c136a0d3292e181332),query:(match:(commit_id:(query:7889d1dc95075974dbd669c136a0d3292e181332,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:613,type:phrase),type:phrase,value:613),query:(match:(pipeline_id:(query:613,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">PASS</a> |
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/10433">10433</a>   |  job-desc2           |  Mar 26 15:03:00 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:7889d1dc95075974dbd669c136a0d3292e181332,type:phrase),type:phrase,value:7889d1dc95075974dbd669c136a0d3292e181332),query:(match:(commit_id:(query:7889d1dc95075974dbd669c136a0d3292e181332,type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:613,type:phrase),type:phrase,value:613),query:(match:(pipeline_id:(query:613,type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">PASS</a>  |
