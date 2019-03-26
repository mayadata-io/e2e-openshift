### Verify applicaton availablity when docker is crashed on one of the node.\r
\r
#### Description\r
Induce docker service crash and check if application is rescheduled and verify its availability.\r
\r
#### Prerequisites\r
- OpenShift Cluster should be created and have the dependencies installed.\r
- cStor based storage pool should have been created.\r
- OpenEBS storage class should be created with the desired storage pool claim.\r
\r
#### Procedure\r
- Deploy statefulset application consuming OpenEBS Volume.\r
- Check if the application is deployed successfully.\r
- Induce docker service crash and check if application is rescheduled and verify its availability.\r
- Deprovision statefulset application.\r
\r
#### Test Result\r

 | Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/1CXH">1CXH</a>   |  job-description           |  2019-03-26T07:35:14.460Z     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:('$$hashKey':'object:188',display:Off,pause:!f,section:0,value:0),time:(from:'2019-03-26T07:35:14.460Z',mode:absolute,to:'2019-03-26T07:36:37.745Z'))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:'cluster-logs',key:commit_id,negate:!f,params:(query:'7889d1dc95075974dbd669c136a0d3292e181332',type:phrase),type:phrase,value:'7889d1dc95075974dbd669c136a0d3292e181332'),query:(match:(commit_id:(query:'7889d1dc95075974dbd669c136a0d3292e181332',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:'cluster-logs',key:pipeline_id,negate:!f,params:(query:'613',type:phrase),type:phrase,value:'613'),query:(match:(pipeline_id:(query:'613',type:phrase))))),index:'cluster-logs',interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">FAIL</a>  |
