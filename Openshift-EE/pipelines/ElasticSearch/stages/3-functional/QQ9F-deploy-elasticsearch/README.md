### Deploy ElasticSearch.

#### Description

This job will deploy cassandra statefulset which uses OpenEBS cStor bases persistent volumes.

#### Prerequisites

- The OpenShift cluster should be ready.
- OpenEBS should be deployed.
- cStor pool and storage class should be created.

#### Procedure

- The job triggers litmusbook which is capable of installing Elasticsearch application deployment in its isolated namespace.
- The input parameters such as application label, namespace, size of PV should be passed as environmental variable to the ansible-runner pod.
- Check if all the replicas are running using the kubectl command `kubectl get pods -n <namespace>`

#### Test Result

