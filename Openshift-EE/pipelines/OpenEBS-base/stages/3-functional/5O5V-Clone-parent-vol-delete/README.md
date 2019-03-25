### Restricting Parent volume deletion in presence of clones.

#### Description
The goal of this test is to ensure that the parent volumes are not deletable in presence of its clones.

#### Procedure
- Deploy busybox application.
- Create snapshot using the PVC name name and application namespace as arguments.
- Create clone volume using the above snapshot.
- Try to delete the volume which has snapshot and clone.
- OpenEBS admission controller should prevent the deletion by throwing appropriate error message.


#### Test Result
