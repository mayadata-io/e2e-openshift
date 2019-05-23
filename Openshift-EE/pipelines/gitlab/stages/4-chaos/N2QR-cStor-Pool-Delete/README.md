### Unicorn-App-Kill:

#### Description

This job will induce failure on cstor-pool pod. 

#### Prerequisites

- OpenShift cluster should be ready.
- cstor-pool pod should be running. 

#### Test Result


| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/34133">34133</a>   |  Delete cstor-pool pod and check if it is recovered successfully and verify that the application is not impacted           |  Wed May 22 12:00:57 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'f4fbf1858518b7d10f528f8747559488bed9f927',type:phrase),type:phrase,value:'f4fbf1858518b7d10f528f8747559488bed9f927'),query:(match:(commit_id:(query:'f4fbf1858518b7d10f528f8747559488bed9f927',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'1482',type:phrase),type:phrase,value:'1482'),query:(match:(pipeline_id:(query:'1482',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |
