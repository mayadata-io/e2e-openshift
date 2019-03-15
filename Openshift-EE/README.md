## **Performing OpenEBS E2E tests on OpenShift Enterpise 3.10**

OpenEBS enables the use of containers for mission-critical, persistent workloads and for other stateful workloads. OpenEBS is containerized storage which provides dedicated storage controller to each workload.

Here, We validate OpenEBS storage services being consumed by stateful applications on the platform OpenShift enterprise 3.10 clusters.

 We have Ansible based chaos engineering framework named [Litmus](https://github.com/openebs/litmus) which is capable of performing storage and application specific chaos tests.

### **Platform**

##### OpenShift EnterPrise 3.10.

OpenShift-3.10 cluster is created in our on-premise data center.

### **Tools Used**

- GitLab.
- Litmus(Based on Ansible).
- OpenShift 3.10 cluster.

The Litmus tests are categorised into multiple sets which are included in subsequent stages of GitLab pipeline.