# e2e-openshift
This repository contains platform execution code to run OpenEBS and workloads E2E testing pipelines on Openshift platform. The platform is built around GitLab and OpenEBS E2E Test cases.

## Pipeline stages

Each of the pipelines has the following five stages

1. Konvoy cluster setup
2. OpenEBS setup
3. Functional tests
4. Chaos tests
5. Cleanup

