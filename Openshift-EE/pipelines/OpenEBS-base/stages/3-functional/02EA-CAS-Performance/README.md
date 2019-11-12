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
