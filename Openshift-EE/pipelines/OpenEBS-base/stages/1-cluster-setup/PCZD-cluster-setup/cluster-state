#!/bin/bash
set -x

echo "*************************Checking the Cluster's Health********************"

echo "Checking for the number of nodes in ready state*******************************"
ready_nodes=$(sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip kubectl get nodes | grep Ready | wc -l)

if [ "$ready_nodes" -eq 6 ]; then
echo "Number of nodes in ready state is $ready_nodes"
echo "******Cluster is in Healthy state****"
echo "*************Dumping cluster state********"
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip kubectl get nodes
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip kubectl get pod --all-namespaces
else
echo "All nodes are not ready"
echo "******Cluster is in Unhealthy state*******"
exit;
fi

echo "********Disabling Selinux on nodes********"
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip 'ssh root@10.23.1.11 setenforce 0'
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip 'ssh root@10.23.1.12 setenforce 0'
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip 'ssh root@10.23.1.13 setenforce 0'
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip 'ssh root@10.23.1.14 setenforce 0'
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip 'ssh root@10.23.1.15 setenforce 0'