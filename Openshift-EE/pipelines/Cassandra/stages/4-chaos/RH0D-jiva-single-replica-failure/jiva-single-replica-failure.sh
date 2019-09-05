#!/bin/bash
set -x

pod() {
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip -p $port 'cd e2e-openshift && bash Openshift-EE/pipelines/Cassandra/stages/4-chaos/RH0D-jiva-single-replica-failure/jiva-single-replica-failure node '"'$CI_JOB_ID'"'' '"'$CI_PIPELINE_ID'"' '"'$CI_COMMIT_SHA'"'
}

node() {

#Gitlab job id obtain from the gitlab env ($CI_JOB_ID).
job_id=$1

# Gitlab pipeline id obtained from gitlab env ($CI_PIPELINE_ID).
pipeline_id=$2 

#Gitlab commit id Obtained fron gilab env ($CI_COMMIT_SHA).
commit_id=$3 

#test case ID.
case_id=RH0D

#github token to push the test result into github mayadata-io/e2e-openshift repository.
#This token is set as an env in ~/.profile file in the test cluster.
source ~/.profile
gitToken=$github_token

time="date"
current_time=$(eval $time)

present_dir=$(pwd)
echo $present_dir
#Creating e2e custom resource result for all the tests running in this stage.
#In Gitlab, all the jobs in a stage runs parallely. Inorder to run this serially, each job in the stage waits for the other to get completed.

bash Openshift-EE/utils/pooling jobname:jiva-app-kill

bash Openshift-EE/utils/e2e-cr jobname:jiva-single-rep-kill jobphase:Running init_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

################
# LitmusBook 1 #
################

##### Run the litmus book to perform the Single Replica Failure failure on JIVA

## testcase name is defined in test_vars of LitmusBook.
run_id="single";test_name=$(bash Openshift-EE/utils/generate_test_name testcase=openebs-volume-replica-failure metadata=${run_id})
echo $test_name

cd litmus

# copy the content of chaos `run_litmus_test.yml` litmusbook into a different file to update the test specific parameters.

cp experiments/chaos/openebs_volume_replica_failure/run_litmus_test.yml run_single_rep_failure.yml

: << EOF
--------------------------------------------------------------------------------------------------------------------
| specAttribute      | kind | default value                                | test specifc value                         |
-------------------------------------------------------------------------------------------------------------------     |
| pvcName            | env  | value: percona-mysql-claim                   | value: openebs-cassandra-jiva              | 
| Litmus Job name    | name | generateName: openebs-volume-replica-failure | generateName: single-replica-failure-jiva  |
| Litmus job label   | label| name: openebs-volume-replica-failure         | name: single-replica-failure-jiva          |
| appLabel           | env  | value: name=percona                          | value: app=cassandra-jiva                  |
| appNamespace       | env  | app-percona-ns                               | app-cass-ns-jiva                           | 
--------------------------------------------------------------------------------------------------------------------
EOF

sed -i -e 's/percona-mysql-claim/openebs-cassandra-jiva/g'\
-e 's/generateName: openebs-volume-replica-failure/generateName: single-replica-failure-jiva/g' \
-e 's/openebs-volume-replica-failure/single-replica-failure-jiva/g' \
-e 's/name=percona/app=cassandra-jiva/g' \
-e 's/value: app-percona-ns/value: app-cass-ns-jiva/g' run_single_rep_failure.yml

sed -i '/command:/i \
- name: RUN_ID\
value: '"$run_id"'\
' run_single_rep_failure.yml

cat run_single_rep_failure.yml

# Run the Litmus job and get the details of the litmus job from litmus_job_runner utils.

bash ../Openshift-EE/utils/litmus_job_runner label='name:single-replica-failure-jiva' job=run_single_rep_failure.yml
cd ..

# Print the cluster state once the litmus job is completed.
bash Openshift-EE/utils/dump_cluster_state;

# Update the e2e event for the job.
bash Openshift-EE/utils/event_updater jobname:jiva-single-rep-kill $test_name jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

rc_val=$(echo $?)

current_time=$(eval $time)
# Obtain the status of the test using litmusresult(lr) 

testResult=$(kubectl get litmusresult ${test_name} --no-headers -o custom-columns=:spec.testStatus.result)

# Update the e2e cr once the job is completed

bash Openshift-EE/utils/e2e-cr jobname:jiva-single-rep-kill jobphase:Completed end_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id" test_result:$testResult

python3 Openshift-EE/utils/result/result_update.py $job_id $case_id $gitlab_stage 'Induce failure on JIVA single replica deployment and check if it gets scheduled immediately and the application is available' $testResult $pipeline_id "$current_time" $commit_id $gittoken

if [ "$rc_val" != "0" ]; then
exit 1;
fi
}

if [ "$1" == "node" ];then
node $2 $3 $4
else
pod
fi
