The test cases in the Chaos stage are as follows:

| S.No | TID  | Test case description                                        |
| ---- | ---- | ------------------------------------------------------------ |
| 1    | RJKZ | Induce Cassandra pod failure and check if it can be recovered successfully. |
|2|78JT| Induce cstor target failure and check the behavior of cassandra instance |
|3|NGGB | Kill cstor pool pod and check the behavior of cassandra pod |
|4|OI4T |Induce network delay in cstor target and check the recovery |
|5|Q3ZJ | Delete the cstor pool pod and check the behavior of cassandra application |

