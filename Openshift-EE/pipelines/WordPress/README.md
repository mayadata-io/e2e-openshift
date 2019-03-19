### WordPress specific OpenEBS e2e tests on OpenShift Enterprise

This directory covers the WordPress application specific OpenEBS e2e test case development status for certifying on OpenShift Enterprise Edition platform.

The test cases are divided as per the Stages that run in GitLab pipeline. Following are the stages.

| Stage            | Description                                                  |
| ---------------- | ------------------------------------------------------------ |
| Cluster-Creation | Test cases for setting up OpenShift cluster. This is currently being done in the OnPrem Lab where Kubernetes nodes are provisioned on the VMware vSphere platform |
| OpenEBS-Setup    | Test cases for installing OpenEBS, creation of storage pools and storage classes |
| Functional test  | Test cases specific to WordPress and OpenEBS functionalities |
| Chaos test       | All test cases to introduce various types of chaos into either Wordpress components or OpenEBS control/data plane. |
| Cleanup          | Test cases for cleaning up the cluster resources that were setup during the first stage and second stage |