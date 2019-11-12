### 02EA- Deploy Application using storage class with specific CAS parameters.

#### Description

The goal of this test is to deploy busybox application using storage class created with specific CAS parameters.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim and a specific CAS parameters.

```
    cas.openebs.io/config: |
      - name: StoragePoolClaim
        value: < pool_name >
      - name: QueueDepth
        value: < 20 >
      - name: Luworkers
        value: < 10 >
      - name: ZvolWorkers
        value: < 4 >
```        

#### Procedure

- This job triggers the litmus experiments which deploy the application using CAS specific storage class.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- The job Pumps data traffic and check application liveness.
- It checks if the application is running successfully.

#### Expected result

- Application should be running using the storage class created.

#### Test result

| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/101916">101916</a>   |  Check if the application is successfully deployed using CAS performance tuning parameters           |  Thu Oct 24 16:17:35 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'725396f6ea16a63397af0cb672014acdb5ced383',type:phrase),type:phrase,value:'725396f6ea16a63397af0cb672014acdb5ced383'),query:(match:(commit_id:(query:'725396f6ea16a63397af0cb672014acdb5ced383',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'3719',type:phrase),type:phrase,value:'3719'),query:(match:(pipeline_id:(query:'3719',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Pass</a>  |
