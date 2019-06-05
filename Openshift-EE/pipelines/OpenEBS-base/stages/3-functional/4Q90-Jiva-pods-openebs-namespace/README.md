### 4Q90-Jiva-pods-openebs-namespace

#### Description

The goal of this test is to deploy busybox application using JIVA storage engine and schedule the controller and replica pods in openebs namespace.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- OpenEBS storage class should be created with the desired parameters.
 ```
     cas.openebs.io/config: |
      - name: DeployInOpenEBSNamespace
        enabled: "true"
  ```

#### Procedure

- This job triggers the litmus experiments which deploys Application using JIVA storage engine.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- The job Pumps data traffic and check application liveness.
- The next litmus experiment checks the controller and replica pods scheduled on openebs namespace.

#### Expected result

- Application should be running successfully and the jiva controller and replica pods should be schedule on openebs namespace.

#### Test result


