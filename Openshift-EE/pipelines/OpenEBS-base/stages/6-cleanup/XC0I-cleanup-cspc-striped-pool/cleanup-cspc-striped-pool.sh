#!/bin/bash
set -x
pod() {
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip -p $port 'cd e2e-openshift && bash Openshift-EE/pipelines/OpenEBS-base/stages/6-cleanup/XC0I-cleanup-cspc-striped-pool/cleanup-cspc-striped-pool node '"'$CI_JOB_ID'"'' '"'$CI_PIPELINE_ID'"' '"'$CI_COMMIT_SHA'"'
}

node() {

job_id=$(echo $1)
pipeline_id=$(echo $2)
case_id=XC0I
commit_id=$(echo $3)
source ~/.profile
gittoken=$(echo "$github_token")

time="date"
current_time=$(eval $time)

#pooling over previous job to complete
echo "*******Cleaning cstor-pool**************"
bash Openshift-EE/utils/pooling jobname:spc-raidz1-pool-cleanup
bash Openshift-EE/utils/e2e-cr jobname:cleanup-cspc-striped-pool jobphase:Running init_time:"$current_time"

run_id="cleanup-cspc";test_name=$(bash Openshift-EE/utils/generate_test_name testcase=cstor-pool-provision metadata=${run_id})
echo $test_name
cd litmus

# copy the content of deployer run_litmus_test.yml into a different file to update the test specific parameters.
cp providers/cstor/cstor-cspc-pool/run_litmus_test.yml cleanup_cspc_striped_pool.yml

sed -i -e 's/app: cstor-cspc-pool-provision/app: cstor-cspc-pool-deprovision/g' \
-e 's/generateName: cstor-cspc-pool-provision/generateName: cstor-cspc-pool-deprovision/g' \
-e 's/imagePullPolicy: Always/imagePullPolicy: IfNotPresent/g' \
-e 's/value: create/value: delete/g' cleanup_cspc_striped_pool.yml

sed -i '/command:/i \
          - name: RUN_ID\
            value: '"$run_id"'\
' cleanup_cspc_striped_pool.yml

#################
## RUNNER MAIN ##
#################

cat cleanup_cspc_striped_pool.yml
rc_val=$(echo $?)

bash ../Openshift-EE/utils/litmus_job_runner label='app:cstor-cspc-pool-deprovision' job=cleanup_cspc_striped_pool.yml
bash ../Openshift-EE/utils/dump_cluster_state;
cd ..
bash Openshift-EE/utils/event_updater jobname:cleanup-cspc-striped-pool $test_name jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

#################
## GET RESULT  ##
#################
#rc_val=$(echo $?)

## Check the test status & result from the litmus result custom resource
source ~/.profile
gittoken=$(echo "$github_token")
testResult=$(kubectl get litmusresult ${test_name} --no-headers -o custom-columns=:spec.testStatus.result)

current_time=$(eval $time)
bash Openshift-EE/utils/e2e-cr jobname:cleanup-cspc-striped-pool jobphase:Completed end_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id" test_result:Pass

python3 Openshift-EE/utils/result/result_update.py $job_id XC0I 2-setup "Cleanup cStor cspc based Striped storage pool on disks and corresponding storage class" $testResult $pipeline_id "$current_time" $commit_id $gittoken
if [ "$rc_val" != "0" ]; then
exit 1;
fi
}

if [ "$1" == "node" ];then
  node $2 $3 $4
else
  pod
fi