#!/bin/bash
set -x

pod() {
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip -p $port 'cd e2e-openshift && bash Openshift-EE/pipelines/cassandra/stages/4-chaos/target-network-loss/target-network-loss node '"'$CI_JOB_ID'"'' '"'$CI_PIPELINE_ID'"' '"'$CI_COMMIT_SHA'"'
}

node() {
source ~/.profile
gittoken=$(echo "$github_token")

job_id=$(echo $1)
pipeline_id=$(echo $2)
commit_id=$(echo $3)
case_id=

time="date"
current_time=$(eval $time)

present_dir=$(pwd)
echo $present_dir

bash Openshift-EE/utils/pooling jobname:cstore-pool-delete
bash Openshift-EE/utils/e2e-cr jobname:target-loss jobphase:Waiting
bash Openshift-EE/utils/e2e-cr jobname:target-loss jobphase:Running init_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"



################
# LitmusBook 1 #
################

echo "*******Performing Network loss on target**********"

test_name=$(bash Openshift-EE/utils/generate_test_name testcase=openebs-target-network-loss metadata="")
echo $test_name

cd litmus
cp experiments/chaos/openebs_target_network_loss/run_litmus_test.yml run_targetloss_test.yml

sed -i -e 's/value: percona-mysql-claim/value: openebs-cassandra/g' \
-e 's/value: '\''name=percona'\''/value: '\''app=cassandra'\''/g' \
-e 's/value: '\''enable'\''/value: '\'""\''/g' \
-e 's/value: app-percona-ns/value: app-cass-ns/g' run_targetloss_test.yml


cat run_targetloss_test.yml

bash ../Openshift-EE/utils/litmus_job_runner label='name:openebs-target-network-loss' job=run_targetloss_test.yml
cd ..
bash Openshift-EE/utils/dump_cluster_state;
bash Openshift-EE/utils/event_updater jobname:target-loss $test_name jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

if [ "$?" != "0" ]; then
python3 Openshift-EE/utils/result/result_update.py $job_id QCA4 4-chaos "Induce cstor target network loss and check if it gets recovered successfully" Fail $pipeline_id "$current_time" $commit_id $gittoken
exit 1;
fi


if [ "$rc_val" != "0" ]; then
exit 1;
fi
}

if [ "$1" == "node" ];then
  node $2 $3 $4
else
  pod
fi