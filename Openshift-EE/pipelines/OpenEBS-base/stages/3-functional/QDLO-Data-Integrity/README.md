### Data integrity Test\r
\r
#### Description\r
Ensure the data integrity in openebs volume using fio.\r
\r
#### Prerequisites\r
- OpenShift Cluster should be created and have the dependencies installed.\r
- cStor based storage pool should have been created.\r
- OpenEBS storage class should be created with the desired storage pool claim.\r
\r
#### Procedure\r
- Deploy an application using openebs storage class.\r
- Use fio tool to pump data traffic inside the application mount path.\r
- Induce the cStor target failure.\r
- Check if the target is recovered and ensure data integrity using fio\r
\r
#### Test Result\r
 | Test ID |   Test Description               | Test Result   |
 |---------|---------------------------| --------------|
 |    QDLO-   |  Ensure the data integrity in openebs volume using fio           |  Pass     |

