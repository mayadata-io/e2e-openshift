OpenEBS-base pipeline features various stages such as 
  - Platform setup
  - Storage Setup
  - Functional
  - Chaos
  - Cleanup.
  
  The tests are run against busybox application in both statefulset and deployment models.
  Each stage include several jobs which triggers the corresponding Litmus books to carry out the test.
  
