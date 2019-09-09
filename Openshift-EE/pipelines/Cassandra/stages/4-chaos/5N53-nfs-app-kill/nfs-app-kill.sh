#!/bin/bash
set -x

pod() {
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip -p $port 'cd e2e-openshift && bash Openshift-EE/pipelines/Cassandra/stages/4-chaos/5N53-nfs-app-kill/nfs-app-kill node '"'$CI_JOB_ID'"'' '"'$CI_PIPELINE_ID'"' '"'$CI_COMMIT_SHA'"'
}

node() {

#Gitlab job id obtain from the gitlab env ($CI_JOB_ID).
job_id=$1

# Gitlab pipeline id obtained from gitlab env ($CI_PIPELINE_ID).
pipeline_id=$2 

#Gitlab commit id Obtained fron gilab env ($CI_COMMIT_SHA).
commit_id=$3 

#test case ID.
case_id=5N53

#github token to push the test result into github mayadata-io/e2e-openshift repository.
#This token is set as an env in ~/.profile file in the test cluster.
source ~/.profile
gitToken=$github_token

time="date"
current_time=$(eval $time)

present_dir=$(pwd)
echo $present_dir

bash Openshift-EE/utils/pooling jobname:cstor-volume-istgt-kill
bash Openshift-EE/utils/e2e-cr jobname:nfs-app-kill jobphase:Running init_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

# Performing Application Pod Chaos

test_name=$(bash Openshift-EE/utils/generate_test_name testcase=application-pod-failure metadata="")
echo $test_name

cd litmus
# copy the content of deployer run_litmus_test.yml into a different file to update the test specific parameters.
cp experiments/chaos/app_pod_failure/run_litmus_test.yml nfs_app_kill.yml

# Update the environmental variables in litmus job spec.

: << EOF
---------------------------------------------------------------------------------------------------------------------
| specAttribute      | kind  | default value                        | test specifc value                             |
---------------------------------------------------------------------------------------------------------------------|
| appLabel           | env   | app=jenkins-app                      | app=cassandra                                  | 
| Litmus Job name    | name  | generateName: application-pod-failure| generateName: app-kill                         |
| Litmus job label   | label | name: application-pod-failure        | name: nfs-app-kill                                 |
| appNamespace       | env   | app-jenkins-ns                       | app-cass-ns                                    | 
----------------------------------------------------------------------------------------------------------------------
EOF

sed -i -e 's/value: '\''app=jenkins-app'\''/value: '\''app=cassandra'\''/g' \
-e 's/generateName: application-pod-failure/generateName: app-kill/g' \
-e 's/name: application-pod-failure/name: nfs-app-kill/g' \
-e 's/value: app-jenkins-ns/value: app-cass-ns/g' nfs_app_kill.yml

cat nfs_app_kill.yml

# Run the Litmus job and get the details of the litmus job from litmus_job_runner utils.

bash ../Openshift-EE/utils/litmus_job_runner label='name: nfs-app-kill' job=nfs_app_kill.yml
cd ..

# Get the cluster state Once the litmus jobs completed.
bash Openshift-EE/utils/dump_cluster_state;

# Update the e2e event for the job.
bash Openshift-EE/utils/event_updater jobname:nfs-app-kill $test_name jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

rc_val=$(echo $?)

# Obtain the status of the test using litmusresult(lr) 
testResult=$(kubectl get litmusresult ${test_name} --no-headers -o custom-columns=:spec.testStatus.result)

current_time=$(eval $time)

# Update the e2e cr once the job is completed
bash Openshift-EE/utils/e2e-cr jobname:nfs-app-kill jobphase:Completed end_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id" test_result:$testResult

python3 Openshift-EE/utils/result/result_update.py $job_id $case_id $gitlab_stage 'Induce application pod failure (nfs-app-kill) and check if it is recovered successfully' $testResult $pipeline_id "$current_time" $commit_id $gittoken

if [ "$rc_val" != "0" ]; then
exit 1;
fi
}

if [ "$1" == "node" ];then
  node $2 $3 $4
else
  pod
fi
