### Fill data.

#### Description
The test goal is to fill the pool capacity with data.

#### Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.

#### Procedure
- Create pvc in the desired storage pool.
- Obtain the free capacity of storage pool.
- Use fio tool to pump io traffic.
- Check if the data can be filled upto the maximum capacity.

#### Test Result
