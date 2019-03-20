# OpenEBS-base e2e Tests for OpenShift-EE platform

This directory covers the test case development status for E2E certification of OpenEBS Enterprise Edition on OpenShift Enterprise Edition platform. The test cases are same for different versions of OpenShift platform (for example OpenShift EE 3.10 and EE 4.0 etc)

All the tests here are carried out against busybox application deployment.

The test cases are divided as per the Stages that run in GitLab pipeline. Following are the stages.

| Stage            | Description                                                  |
| ---------------- | ------------------------------------------------------------ |
| Cluster-Creation | Test cases for setting up OpenShift cluster. This is currently being done in the OnPrem Lab where Kubernetes nodes are provisioned on the VMware vSphere platform |
| OpenEBS-Setup    | Test cases for installing OpenEBS, creation of storage pools and storage classes |
| Functional test  | All test cases for testing basic functionality of OpenEBS control plane components (API server, provisioner and metrics exporters), data plane components (Jiva and cStor) and NDM |
| Chaos test       | All test cases to introduce various types of chaos into either Kubernetes platform or OpenEBS control/data plane or stateful application |
| Cleanup          | Test cases for cleaning up the cluster resources that were setup during the first stage |

## Deployment setup of OpenEBS EE testbed

The test cluster is configured with following resources.

| Type   | Memory | CPU  |
| ------ | ------ | ---- |
| Master | 16 GB  | 4    |
| Node1  | 16 GB  | 4    |
| Node2  | 16 GB  | 4    |
| Node3  | 16 GB  | 4    |
| Node4  | 16 GB  | 4    |
| Node5  | 16 GB  | 4    |

 