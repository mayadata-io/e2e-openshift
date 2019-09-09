#!/bin/bash
set -x
pod() {
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip -p $port 'cd e2e-openshift && bash Openshift-EE/pipelines/OpenEBS-base/stages/6-cleanup/XH12-cleanup-spc-raidz2-pool/cleanup-spc-raidz2-pool node '"'$CI_JOB_ID'"'' '"'$CI_PIPELINE_ID'"' '"'$CI_COMMIT_SHA'"'

}

node() {

job_id=$(echo $1)
pipeline_id=$(echo $2)
case_id=XH12
commit_id=$(echo $3)
source ~/.profile
gittoken=$(echo "$github_token")

time="date"
current_time=$(eval $time)

#pooling over previous job to complete
echo "*******Cleaning cstor-pool**************"
bash Openshift-EE/utils/pooling jobname:spc-raidz1-pool-cleanup
bash Openshift-EE/utils/e2e-cr jobname:spc-raidz2-pool-cleanup jobphase:Running init_time:"$current_time"

run_id="cleanup-raidz2";test_name=$(bash Openshift-EE/utils/generate_test_name testcase=cstor-block-device-pool-provision metadata=${run_id})
echo $test_name
cd litmus

# copy the content of deployer run_litmus_test.yml into a different file to update the test specific parameters.
cp providers/cstor/cstor-block-device-pool/run_litmus_test.yml cleanup_raidz2_pool.yml

#################
## RUNNER MAIN ##
#################
echo "Running the litmus test.."

: << EOF
  ---------------------------------------------------------------------------------------------------------------------------------------------     
 | specAttribute     | kind   |         default value                           | test specifc value                                           |
  ---------------------------------------------------------------------------------------------------------------------------------------------
 | Litmus job label  | label  | app: cstor-block-device-pool-provision          | app: cstor-raidz2-pool-deprovision                           |
 | Litmus Job name   | name   | generateName: cstor-block-device-pool-provision | generateName: cstor-block-device-raidz2-pool-deprovision     |
 | ImagePullPolicy   | value  | Always                                          | IfNotPresent                                                 |
 | Pool name         | name   | cstor-block-disk-pool                           | cstor-block-disk-pool-raidz2                                 |
 | Pool type         | value  | striped                                         | raidz2                                                       |
 | storage class     | env    | openebs-cstor-disk                              | openebs-cstor-raidz2                                         |
   ---------------------------------------------------------------------------------------------------------------------------------------------
EOF

sed -i -e 's/app: cstor-block-device-pool-provision/app: cstor-raidz2-pool-deprovision/g' \
-e 's/generateName: cstor-block-device-pool-provision/generateName: cstor-block-device-raidz2-pool-deprovision/g' \
-e 's/imagePullPolicy: Always/imagePullPolicy: IfNotPresent/g' \
-e 's/value: cstor-block-disk-pool/value: cstor-block-disk-pool-raidz2/g' \
-e 's/value: striped/value: raidz2/g' \
-e 's/value: create/value: delete/g' \
-e 's/value: openebs-cstor-disk/value: openebs-cstor-raidz2/g' cleanup_raidz2_pool.yml

sed -i '/command:/i \
          - name: RUN_ID\
            value: '"$run_id"'\
' cleanup_raidz2_pool.yml

cat cleanup_raidz2_pool.yml

bash ../Openshift-EE/utils/litmus_job_runner label='app:cstor-raidz2-pool-deprovision' job=cleanup_raidz2_pool.yml
bash ../Openshift-EE/utils/dump_cluster_state;
cd ..
bash Openshift-EE/utils/event_updater jobname:spc-raidz2-pool-cleanup $test_name jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

#################
## GET RESULT  ##
#################
rc_val=$(echo $?)

## Check the test status & result from the litmus result custom resource
source ~/.profile
gittoken=$(echo "$github_token")
testResult=$(kubectl get litmusresult ${test_name} --no-headers -o custom-columns=:spec.testStatus.result)

current_time=$(eval $time)
bash Openshift-EE/utils/e2e-cr jobname:spc-raidz2-pool-cleanup jobphase:Completed end_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id" test_result:Pass

python3 Openshift-EE/utils/result/result_update.py $job_id XH12 2-setup "Cleanup cStor based RAIDZ2 storage pool on disks and corresponding storage class" $testResult $pipeline_id "$current_time" $commit_id $gittoken
if [ "$rc_val" != "0" ]; then
exit 1;
fi
}

if [ "$1" == "node" ];then
  node $2 $3 $4
else
  pod
fi