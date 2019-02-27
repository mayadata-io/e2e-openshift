#e2e-openshift

This repository contains platform execution code to run OpenEBS and workloads E2E testing pipelines for OpenShift platform. The platform is built around GitLab and OpenEBS Litmus.



With this platform, each commit to any source repositories (Such as cStor, Jiva, Maya control plane) or any test respositories can potentially trigger all E2E pipelines.

This platform has the following pipelines and all of them can be run against a given OpenShift platforms such as OpenShift 3.10 Enterprise edition or OpenShift 4.0 Enterprise edition etc.



##OpenShift 3.11 Enterprise Edition

  

| Pipeline                     | Description | Status         |
| ---------------------------- | ----------- | -------------- |
| OpenEBS Base                 |             | In development |
| Prometheus                   |             | In development |
| ElasticSearch                |             | In development |
| GitLab                       |             | In development |
| NuoDB EE                     |             | In development |
| MongoDB                      |             | In development |
| PostgreSQL                   |             | In development |
| Cassandra CE                 |             | In development |
| Minio object storage         |             | In development |
| Redis                        |             | In development |
| MySQL                        |             | In development |
| Percona                      |             | In development |
| WordPress - NFS for RWM PVCs |             | In development |





##Pipeline stages

Each of the pipelines has five stages

1. OpenShift cluster setup
2. OpenEBS setup
3. Funcational tests
4. Chaos tests
5. Cleanup everything



##How it works?



`.gitlab-ci.yaml` in the master branch of this repository runs the OpenEBS-Base pipeline. Branches are created from the master for each of the other pipelines. All branches contain the same code of the master except the `.gitlab-ci.yaml` file, which will be customized and maintained for that specific pipeline.



