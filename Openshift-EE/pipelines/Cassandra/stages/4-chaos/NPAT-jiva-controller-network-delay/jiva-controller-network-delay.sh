#!/bin/bash
set -x

pod() {
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip -p $port 'cd e2e-openshift && bash Openshift-EE/pipelines/Cassandra/stages/4-chaos/NPAT-jiva-controller-network-delay/jiva-controller-network-delay node '"'$CI_JOB_ID'"'' '"'$CI_PIPELINE_ID'"' '"'$CI_COMMIT_SHA'"'
}

node() {

#Gitlab job id obtain from the gitlab env ($CI_JOB_ID).
job_id=$1

# Gitlab pipeline id obtained from gitlab env ($CI_PIPELINE_ID).
pipeline_id=$2 

#Gitlab commit id Obtained fron gilab env ($CI_COMMIT_SHA).
commit_id=$3 

#test case ID.
case_id=NPAT

#github token to push the test result into github mayadata-io/e2e-openshift repository.
#This token is set as an env in ~/.profile file in the test cluster.
source ~/.profile
gitToken=$github_token

time="date"
current_time=$(eval $time)

present_dir=$(pwd)
echo $present_dir

bash Openshift-EE/utils/pooling jobname: nfs-app-kill
bash Openshift-EE/utils/e2e-cr jobname:jiva-controller-network-delay jobphase:Running init_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

echo "*******Performing network delay on controller**********"

run_id="jiva";test_name=$(bash Openshift-EE/utils/generate_test_name testcase=openebs-target-network-delay metadata=${run_id})
echo $test_name

cd litmus
cp experiments/chaos/openebs_target_network_delay/run_litmus_test.yml run_controller_delay_test_jiva.yml

: << EOF
  ----------------------------------------------------------------------------------------------------------------------------     
 | specAttribute     | kind   |         default value                       | test specifc value                              |
  -------------------------------------------------------------------------------------------------------------------         |
 | appLabel          | env    | name=percona                                | app=cassandra-jiva                              |
 | pvcName           | env    | percona-mysql-claim                         | openebs-cassandra-jiva                          | 
 | appNamespace      | env    | app-percona-ns                              | app-cass-ns-jiva                                |
 | Litmus Job name   | name   | generateName: openebs-target-network-delay- | generateName: openebs-target-network-delay-jiva |
 | Litmus job label  | label  | name: openebs-target-network-delay          | network-delay-test-jiva                         |
  ----------------------------------------------------------------------------------------------------------------------------
EOF

sed -i -e 's/value: percona-mysql-claim/value: openebs-cassandra-jiva/g' \
-e 's/generateName: openebs-target-network-delay-/generateName: openebs-target-network-delay-jiva/g' \
-e 's/name: openebs-target-network-delay/name: network-delay-test-jiva/g' \
-e 's/value: '\''name=percona'\''/value: '\''app=cassandra-jiva'\''/g' \
-e 's/value: app-percona-ns/value: app-cass-ns-jiva/g' run_controller_delay_test_jiva.yml

sed -i '/command:/i \
          - name: RUN_ID\
            value: '"$run_id"'\
' run_controller_delay_test_jiva.yml

cat run_controller_delay_test_jiva.yml

# Run the Litmus job and get the details of the litmus job from litmus_job_runner utils.
bash ../Openshift-EE/utils/litmus_job_runner label='name:network-delay-test-jiva' job=run_controller_delay_test_jiva.yml
cd ..

# Print the cluster state once the litmus job is completed.
bash Openshift-EE/utils/dump_cluster_state;

# Update the e2e event for the job.
bash Openshift-EE/utils/event_updater jobname:jiva-controller-network-delay $test_name jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

rc_val=$(echo $?)

# Obtain the status of the test using litmusresult(lr) 
testResult=$(kubectl get litmusresult ${test_name} --no-headers -o custom-columns=:spec.testStatus.result)

current_time=$(eval $time)

# Update the e2e cr once the job is completed
bash Openshift-EE/utils/e2e-cr jobname:jiva-controller-network-delay jobphase:Completed end_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id" test_result:$testResult

python3 Openshift-EE/utils/result/result_update.py $job_id $case_id $gitlab_stage 'Induce delay in jiva controller pod network and verify if the application is not impacted' $testResult $pipeline_id "$current_time" $commit_id $gittoken

if [ "$rc_val" != "0" ]; then
exit 1;
fi
}

if [ "$1" == "node" ];then
  node $2 $3 $4
else
  pod
fi
