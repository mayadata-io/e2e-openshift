# e2e-openshift

This repository contains platform execution code to run OpenEBS and workloads E2E testing pipelines for OpenShift platform. The platform is built around GitLab and OpenEBS Litmus.



With this platform, each commit to any source repositories (Such as cStor, Jiva, Maya control plane) or any test respositories can potentially trigger all E2E pipelines.

This platform has the following pipelines and all of them can be run against a given OpenShift platforms such as OpenShift 3.10 Enterprise edition or OpenShift 4.0 Enterprise edition etc.



## OpenShift 3.10 Enterprise Edition


  

| Pipeline                     | Description | Status         |
| ---------------------------- | ----------- | -------------- |
| OpenEBS Base                 |Validation of OpenEBS control plane and basic data plane functionality             | In development |
| Prometheus                   |Prometheus E2E with OpenEBS as Persistent storage             | In development |
| ElasticSearch                |ElasticSearch E2E with OpenEBS as Persistent storage             | In development |
| GitLab                       |GitLab E2E with OpenEBS as Persistent storage             | In development |
| NuoDB EE                     |NuoDB EE E2E with OpenEBS as Persistent storage             | In development |
| MongoDB                      |MongoDB E2E with OpenEBS as Persistent storage             | In development |
| PostgreSQL                   |PostgreSQL E2E with OpenEBS as Persistent storage             | In development |
| Cassandra CE                 |Cassandra CE E2E with OpenEBS as Persistent storage             | In development |
| Minio object storage         |Minio object storage E2E with OpenEBS as Persistent storage             | In development |
| Redis                        |Redis E2E with OpenEBS as Persistent storage             | In development |
| MySQL                        |MySQL E2E with OpenEBS as Persistent storage             | In development |
| Percona                      |Percona E2E with OpenEBS as Persistent storage             | In development |
| WordPress - NFS for RWM PVCs |WordPress E2E with OpenEBS as Persistent storage             | In development |





## Pipeline stages

Each of the pipelines has five stages

1. OpenShift cluster setup
2. OpenEBS setup
3. Funcational tests
4. Chaos tests
5. Cleanup everything



## How it works?



`.gitlab-ci.yaml` in the master branch of this repository runs the OpenEBS-Base pipeline. Branches are created from the master for each of the other pipelines. All branches contain the same code of the master except the `.gitlab-ci.yaml` file, which will be customized and maintained for that specific pipeline.



