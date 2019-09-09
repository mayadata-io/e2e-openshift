#!/bin/bash
set -x

pod() {
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip -p $port 'cd e2e-openshift && bash Openshift-EE/pipelines/Cassandra/stages/4-chaos/W831-jiva-replica-network-delay/jiva-replica-network-delay node '"'$CI_JOB_ID'"'' '"'$CI_PIPELINE_ID'"' '"'$CI_COMMIT_SHA'"'
}

node() {

#Gitlab job id obtain from the gitlab env ($CI_JOB_ID).
job_id=$1

# Gitlab pipeline id obtained from gitlab env ($CI_PIPELINE_ID).
pipeline_id=$2 

#Gitlab commit id Obtained fron gilab env ($CI_COMMIT_SHA).
commit_id=$3 

#test case ID.
case_id=W831

#github token to push the test result into github mayadata-io/e2e-openshift repository.
#This token is set as an env in ~/.profile file in the test cluster.
source ~/.profile
gitToken=$github_token

time="date"
current_time=$(eval $time)

present_dir=$(pwd)
echo $present_dir

bash Openshift-EE/utils/pooling jobname:jiva-single-replica-failure
bash Openshift-EE/utils/e2e-cr jobname:jiva-replica-network-delay jobphase:Running jobphase:Running init_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

##Generating test name using test case name

run_id="jiva";test_name=$(bash Openshift-EE/utils/generate_test_name testcase=openebs-replica-network-delay metadata=${run_id})
echo $test_name

cd litmus
cp experiments/chaos/openebs_replica_network_delay/run_litmus_test.yml run_rep_network_delay_jiva.yml

: << EOF
  ----------------------------------------------------------------------------------------------------------------------------
 | specAttribute     | kind   |         default value                      | test specifc value                               |
  ----------------------------------------------------------------------------------------------------------------------------|
 | appLabel          | env    | name=percona                               | app=cassandra-jiva                               | 
 | appPVC            | env    | value: percona-mysql-claim                 | value: openebs-cassandra-jiva                    |
 | Litmus Job name   | name   | generateName: openebs-replica-network-delay| generateName: openebs-replica-network-delay-jiva |
 | Litmus job label  | label  | name: openebs-replica-network              | name: openebs-replica-network-jiva               |
 | appNamespace      | env    | app-percona-ns                             | app-cass-ns-jiva                                 | 
  ----------------------------------------------------------------------------------------------------------------------------
EOF

-e 's/value: '\''name=percona'\''/value: '\''app=cassandra-jiva'\''/g' \
-e 's/value: app-percona-ns/value: app-cass-ns-jiva/g' \
-e 's/generateName: openebs-replica-network-delay/generateName: openebs-replica-network-delay-jiva/g' \
-e 's/name: openebs-replica-network/name: openebs-replica-network-jiva/g' \
-e 's/value: percona-mysql-claim/value: openebs-cassandra-jiva/g' run_rep_network_delay_jiva.yml

sed -i '/command:/i \
          - name: RUN_ID\
            value: '"$run_id"'\
' run_rep_network_delay_jiva.yml

cat run_rep_network_delay_jiva.yml

bash ../Openshift-EE/utils/litmus_job_runner label='name:openebs-replica-network-jiva' job=run_rep_network_delay_jiva.yml
cd ..

# Print the cluster state once the litmus job is completed.

bash Openshift-EE/utils/dump_cluster_state;

# Update the e2e event for the job.

bash Openshift-EE/utils/event_updater jobname:jiva-replica-network-delay $test_name jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"


rc_val=$(echo $?)
# Obtain the status of the test using litmusresult(lr) 

testResult=$(kubectl get litmusresult ${test_name} --no-headers -o custom-columns=:spec.testStatus.result)

# Update the e2e cr once the job is completed

bash Openshift-EE/utils/e2e-cr jobname:jiva-replica-network-delay jobphase:Completed end_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id" test_result:$testResult

python3 Openshift-EE/utils/result/result_update.py $job_id $case_id 4-chaos "Inject network delay in jiva replica & verify successful recovery" $testResult $pipeline_id "$current_time" $commit_id $gittoken

if [ "$rc_val" != "0" ]; then
exit 1;
fi

}

if [ "$1" == "node" ];then
  node $2 $3 $4
else
  pod
fi