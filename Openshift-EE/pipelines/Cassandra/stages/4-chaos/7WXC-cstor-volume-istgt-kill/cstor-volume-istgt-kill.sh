#!/bin/bash
set -x

pod() {
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip -p $port 'cd e2e-openshift && bash Openshift-EE/pipelines/Cassandra/stages/4-chaos/7WXC-cstor-volume-istgt-kill/cstor-volume-istgt-kill '"'$CI_JOB_ID'"'' '"'$CI_PIPELINE_ID'"' '"'$CI_COMMIT_SHA'"'
}

node() {

#Gitlab job id obtain from the gitlab env ($CI_JOB_ID).
job_id=$1

# Gitlab pipeline id obtained from gitlab env ($CI_PIPELINE_ID).
pipeline_id=$2 

#Gitlab commit id Obtained fron gilab env ($CI_COMMIT_SHA).
commit_id=$3 

#test case ID.
case_id=7WXC

#github token to push the test result into github mayadata-io/e2e-openshift repository.
#This token is set as an env in ~/.profile file in the test cluster.
source ~/.profile
gitToken=$github_token

time="date"
current_time=$(eval $time)

present_dir=$(pwd)
echo $present_dir

bash Openshift-EE/utils/pooling jobname:app-kill
bash Openshift-EE/utils/e2e-cr jobname:cstor-volume-istgt-kill jobphase:Running init_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

echo "*******Performing Cstor pool Management kill**********"

run_id="istgt";test_name=$(bash Openshift-EE/utils/generate_test_name testcase=openebs-target-failure metadata=${run_id})
echo $test_name

cd litmus
cp experiments/chaos/openebs_target_failure/run_litmus_test.yml run_targetistgt_kill_test.yml

# Update the environmental variables in litmus job spec.

: << EOF
  ---------------------------------------------------------------------------------------------------------------------
 | specAttribute     | kind   |         default value                 | test specifc value                             |
  ---------------------------------------------------------------------------------------------------------------------|
 | pvcName           | env    | value: percona-mysql-claim            | value: openebs-cassandra                       | 
 | Litmus Job name   | name   | generateName: openebs-target-failure  | generateName: openebs-target-istgt-kill        |
 | Litmus job label  | label  | name: openebs-target-failure          | name: openebs-target-istgt-kill                |
 | appLabel          | env    | value: name=percona                   | value: app=cassandra                           |
 | appNamespace      | env    | app-percon-ns                         | app-cass-ns                                    | 
  ---------------------------------------------------------------------------------------------------------------------
EOF

sed -i -e 's/value: percona-mysql-claim/value: openebs-cassandra/g' \
-e 's/generateName: openebs-target-failure/generateName: openebs-target-istgt-kill/g' \
-e 's/name: openebs-target-failure/name: openebs-target-istgt-kill/g' \
-e 's/value: target-zrepl-kill/value: target-kill/g' \
-e 's/value: cstor-volume-mgmt/value: cstor-istgt/g' \
-e 's/value: openebs-cstor-sparse/value: openebs-cstor-disk/g' \
-e 's/value: '\''name=percona'\''/value: '\''app=cassandra'\''/g' \
-e 's/value: app-percona-ns/value: app-cass-ns/g' run_targetistgt_kill_test.yml

sed -i '/command:/i \
          - name: RUN_ID\
            value: '"$run_id"'\
' run_targetistgt_kill_test.yml

cat run_targetistgt_kill_test.yml

# Run the Litmus job and get the details of the litmus job from litmus_job_runner utils.

bash ../Openshift-EE/utils/litmus_job_runner label='name:openebs-target-istgt-kill' job=run_targetistgt_kill_test.yml

cd ..

# Get the cluster state Once the litmus jobs completed.
bash Openshift-EE/utils/dump_cluster_state;

# Update the e2e event for the job.
bash Openshift-EE/utils/event_updater jobname:cstor-volume-istgt-kill $test_name jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

rc_val=$(echo $?)

# Obtain the status of the test using litmusresult(lr) 
testResult=$(kubectl get litmusresult ${test_name} --no-headers -o custom-columns=:spec.testStatus.result)

current_time=$(eval $time)

# Update the e2e cr once the job is completed
bash Openshift-EE/utils/e2e-cr jobname:cstor-volume-istgt-kill jobphase:Completed end_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id" test_result:$testResult

python3 Openshift-EE/utils/result/result_update.py $job_id $case_id $gitlab_stage 'Induce chaos on cstor-target container(cstor-istgt) and check the behaviour' $testResult $pipeline_id "$current_time" $commit_id $gittoken

if [ "$rc_val" != "0" ]; then
exit 1;
fi
}

if [ "$1" == "node" ];then
  node $2 $3 $4
else
  pod
fi
