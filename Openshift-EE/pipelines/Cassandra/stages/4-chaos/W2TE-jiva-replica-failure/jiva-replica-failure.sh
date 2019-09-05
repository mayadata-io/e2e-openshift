#!/bin/bash
set -x

pod() {
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip -p $port 'cd e2e-openshift && bash Openshift-EE/pipelines/Cassandra/stages/4-chaos/W2TE-jiva-replica-failure/jiva-replica-failure node '"'$CI_JOB_ID'"'' '"'$CI_PIPELINE_ID'"' '"'$CI_COMMIT_SHA'"'
}

node() {

#Gitlab job id obtain from the gitlab env ($CI_JOB_ID).
job_id=$1

# Gitlab pipeline id obtained from gitlab env ($CI_PIPELINE_ID).
pipeline_id=$2 

#Gitlab commit id Obtained fron gilab env ($CI_COMMIT_SHA).
commit_id=$3 

#test case ID.
case_id=W2TE

#github token to push the test result into github mayadata-io/e2e-openshift repository.
#This token is set as an env in ~/.profile file in the test cluster.
source ~/.profile
gitToken=$github_token

time="date"
current_time=$(eval $time)

present_dir=$(pwd)
echo $present_dir

bash Openshift-EE/utils/pooling jobname:jiva-replica-network-delay
bash Openshift-EE/utils/e2e-cr jobname:jiva-replica-failure jobphase:Running init_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"


################
# LitmusBook 1 #
################


run_id="jiva";test_name=$(bash Openshift-EE/utils/generate_test_name testcase=openebs-volume-replica-failure metadata=${run_id})
echo $test_name

cd litmus
cp experiments/chaos/openebs_volume_replica_failure/run_litmus_test.yml run_rep_fail_test_jiva.yml

: << EOF
  ---------------------------------------------------------------------------------------------------------------------
 | specAttribute     | kind   |         default value                        | test specifc value                       |
  --------------------------------------------------------------------------------------------------------------------- |
 | appLabel          | env    | name=percona                                 | app=cassandra-jiva                       | 
 | appPVC            | env    | value: percona-mysql-claim                   | value: openebs-cassandra-jiva            |
 | Litmus Job name   | name   | generateName: openebs-volume-replica-failure | generateName: replica-failure-jiva       |
 | Litmus job label  | label  | name: openebs-volume-replica-failure         | name: replica-failure-jiva               |
 | appNamespace      | env    | app-percona-ns                               | app-cass-ns-jiva                         | 
  ----------------------------------------------------------------------------------------------------------------------
EOF

sed -i -e 's/name=percona/app=cassandra-jiva/g' \
-e 's/value: app-percona-ns/value: app-cass-ns-jiva/g' \
-e 's/generateName: openebs-volume-replica-failure/generateName: replica-failure-jiva/g' \
-e 's/name: openebs-volume-replica-failure/name: replica-failure-jiva/g' \
-e 's/value: percona-mysql-claim/value: openebs-cassandra-jiva/g' run_rep_fail_test_jiva.yml

sed -i '/command:/i \
          - name: RUN_ID\
            value: '"$run_id"'\
' run_rep_fail_test_jiva.yml

cat run_rep_fail_test_jiva.yml

bash ../Openshift-EE/utils/litmus_job_runner label='name:replica-failure-jiva' job=run_rep_fail_test_jiva.yml
cd ..
bash Openshift-EE/utils/dump_cluster_state;
bash Openshift-EE/utils/event_updater jobname:jiva-replica-failure $test_name jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"


rc_val=$(echo $?)

testResult=$(kubectl get litmusresult ${test_name} --no-headers -o custom-columns=:spec.testStatus.result)


current_time=$(eval $time)

bash Openshift-EE/utils/e2e-cr jobname:jiva-replica-failure jobphase:Completed end_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id" test_result:$testResult
python3 Openshift-EE/utils/result/result_update.py $job_id $case_id 4-chaos "Fails Jiva Replica and verify successful recovery" $testResult $pipeline_id "$current_time" $commit_id $gittoken

if [ "$rc_val" != "0" ]; then
exit 1;
fi
}

if [ "$1" == "node" ];then
  node $2 $3 $4
else
  pod
fi