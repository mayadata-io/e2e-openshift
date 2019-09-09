#!/bin/bash
set -x

pod() {
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip -p $port 'cd e2e-openshift && bash Openshift-EE/pipelines/Cassandra/stages/4-chaos/ADXV-cstor-volume-mgmt-kill/cstor-volume-mgmt-kill node '"'$CI_JOB_ID'"'' '"'$CI_PIPELINE_ID'"' '"'$CI_COMMIT_SHA'"'
}

node() {

#Gitlab job id obtain from the gitlab env ($CI_JOB_ID).
job_id=$1

# Gitlab pipeline id obtained from gitlab env ($CI_PIPELINE_ID).
pipeline_id=$2 


#Gitlab commit id Obtained fron gilab env ($CI_COMMIT_SHA).
commit_id=$3 

#test case ID.
case_id=ADXV

#github token to push the test result into github mayadata-io/e2e-openshift repository.
#This token is set as an env in ~/.profile file in the test cluster.
source ~/.profile
gitToken=$github_token

time="date"
current_time=$(eval $time)

present_dir=$(pwd)
echo $present_dir

bash Openshift-EE/utils/pooling jobname:cstor-pool-delete 
bash Openshift-EE/utils/e2e-cr jobname:cstor-volume-mgmt-kill jobphase:Running init_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"


# Performing Cstor volume Management kill
##Generating test name using test case name

run_id="mgmt";test_name=$(bash Openshift-EE/utils/generate_test_name testcase=openebs-target-failure metadata=${run_id})
echo $test_name

cd litmus
# copy the content of chaos `run_litmus_test.yml` litmusbook into a different file to update the test specific parameters.
cp experiments/chaos/openebs_target_failure/run_litmus_test.yml run_cstor_volume_mgmt_kill_test.yml

# Update the environmental variables in litmus job spec.

: << EOF
  ---------------------------------------------------------------------------------------------------------------------
 | specAttribute     | kind   |         default value                 | test specifc value                             |
  ---------------------------------------------------------------------------------------------------------------------|
 | pvcName           | env    | value: percona-mysql-claim            | value: openebs-cassandra                       | 
 | Litmus Job name   | name   | generateName: openebs-target-failure  | generateName: cstor-volume-mgmt-kill           |
 | Litmus job label  | label  | name: openebs-target-failure          | name: cstor-volume-mgmt-kill                         |
 | appLabel          | env    | value: name=percona                   | value: app=cassandra                           |
 | appNamespace      | env    | app-percon-ns                         | app-cass-ns                                    | 
  ---------------------------------------------------------------------------------------------------------------------
EOF

sed -i -e 's/value: percona-mysql-claim/value: openebs-cassandra/g' \
-e 's/generateName: openebs-target-failure/generateName: cstor-volume-mgmt-fkill/g' \
-e 's/name: openebs-target-failure/name: cstor-volume-mgmt-kill/g' \
-e 's/value: '\''name=percona'\''/value: '\''app=cassandra'\''/g' \
-e 's/value: app-percona-ns/value: app-cass-ns/g' run_cstor_volume_mgmt_kill_test.yml

sed -i '/command:/i \
          - name: RUN_ID\
            value: '"$run_id"'\
' run_cstor_volume_mgmt_kill_test.yml

cat run_cstor_volume_mgmt_kill_test.yml

# Run the Litmus job and get the details of the litmus job from litmus_job_runner utils.
bash ../Openshift-EE/utils/litmus_job_runner label='name:cstor-volume-mgmt-kill' job=run_cstor_volume_mgmt_kill_test.yml
cd ..

# Print the cluster state once the litmus job is completed.
bash Openshift-EE/utils/dump_cluster_state;

# Update the e2e event for the job.
bash Openshift-EE/utils/event_updater jobname:cstor-volume-mgmt-kill $test_name jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"


rc_val=$(echo $?)

# Obtain the status of the test using litmusresult(lr) 
testResult=$(kubectl get litmusresult ${test_name} --no-headers -o custom-columns=:spec.testStatus.result)

# Update the e2e cr once the job is completed
bash Openshift-EE/utils/e2e-cr jobname:cstor-volume-mgmt-kill jobphase:Completed end_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id" test_result:$testResult

python3 Openshift-EE/utils/result/result_update.py $job_id $case_id 4-chaos "Induce failure on cstor-volume-mgmt container in cstor-pool pod and check if it doesn't affect the application availability" $testResult $pipeline_id "$current_time" $commit_id $gittoken

if [ "$rc_val" != "0" ]; then
exit 1;
fi
}

if [ "$1" == "node" ];then
node $2 $3 $4
else
pod
fi
