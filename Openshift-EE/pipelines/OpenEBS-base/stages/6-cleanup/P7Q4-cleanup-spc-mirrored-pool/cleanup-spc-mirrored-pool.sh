#!/bin/bash
set -x
pod() {
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip -p $port 'cd e2e-openshift && bash Openshift-EE/pipelines/OpenEBS-base/stages/6-cleanup/P7Q4-cleanup-spc-mirrored-pool/cleanup-spc-mirrored-pool node '"'$CI_JOB_ID'"'' '"'$CI_PIPELINE_ID'"' '"'$CI_COMMIT_SHA'"'

}

node() {

job_id=$(echo $1)
pipeline_id=$(echo $2)
case_id=P7Q4
commit_id=$(echo $3)
source ~/.profile
gittoken=$(echo "$github_token")

time="date"
current_time=$(eval $time)

#pooling over previous job to complete
bash Openshift-EE/utils/pooling jobname:spc-striped-pool-cleanup
bash Openshift-EE/utils/e2e-cr jobname:spc-mirrored-pool-cleanup jobphase:Running init_time:"$current_time"

run_id="cleanup-mirrored";test_name=$(bash Openshift-EE/utils/generate_test_name testcase=cstor-block-device-pool-provision metadata=${run_id})
echo $test_name
cd litmus

# copy the content of deployer run_litmus_test.yml into a different file to update the test specific parameters.
cp providers/cstor/cstor-block-device-pool/run_litmus_test.yml cleanup_mirrored_pool.yml

#################
## RUNNER MAIN ##
#################
echo "Running the litmus test.."

: << EOF
  ---------------------------------------------------------------------------------------------------------------------------------------------     
 | specAttribute     | kind   |         default value                           | test specifc value                                           |
  ---------------------------------------------------------------------------------------------------------------------------------------------
 | Litmus job label  | label  | app: cstor-block-device-pool-provision          | app: cstor-mirrored-pool-deprovision                         |
 | Litmus Job name   | name   | generateName: cstor-block-device-pool-provision | generateName: cstor-block-device-mirrored-pool-deprovision   |
 | ImagePullPolicy   | value  | Always                                          | IfNotPresent                                                 |
 | Pool name         | name   | cstor-block-disk-pool                           | cstor-block-disk-pool-mirror                                 |
 | Pool type         | value  | striped                                         | mirrored                                                     |
 | storage class     | env    | openebs-cstor-disk                              | openebs-cstor-mirror                                         |
   ---------------------------------------------------------------------------------------------------------------------------------------------
EOF

sed -i -e 's/app: cstor-block-device-pool-provision/app: cstor-mirrored-pool-deprovision/g' \
-e 's/generateName: cstor-block-device-pool-provision/generateName: cstor-block-device-mirrored-pool-deprovision/g' \
-e 's/imagePullPolicy: Always/imagePullPolicy: IfNotPresent/g' \
-e 's/value: cstor-block-disk-pool/value: cstor-block-disk-pool-mirror/g' \
-e 's/value: striped/value: mirrored/g' \
-e 's/value: create/value: delete/g' \
-e 's/value: openebs-cstor-disk/value: openebs-cstor-mirror/g' cleanup_mirrored_pool.yml

sed -i '/command:/i \
          - name: RUN_ID\
            value: '"$run_id"'\
' cleanup_mirrored_pool.yml

cat cleanup_mirrored_pool.yml

bash ../Openshift-EE/utils/litmus_job_runner label='app:cstor-mirrored-pool-deprovision' job=cleanup_mirrored_pool.yml
bash ../Openshift-EE/utils/dump_cluster_state;
cd ..
bash Openshift-EE/utils/event_updater jobname:spc-mirrored-pool-cleanup $test_name jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

#################
## GET RESULT  ##
#################
rc_val=$(echo $?)

## Check the test status & result from the litmus result custom resource
source ~/.profile
gittoken=$(echo "$github_token")
testResult=$(kubectl get litmusresult ${test_name} --no-headers -o custom-columns=:spec.testStatus.result)
#python3 Openshift-EE/utils/result/result_update.py $job_id P7Q4 2-setup "Create cStor based mirrored storage pool on disks and corresponding storage class" $testResult $pipeline_id "$current_time" $commit_id $gittoken

current_time=$(eval $time)
bash Openshift-EE/utils/e2e-cr jobname:spc-mirrored-pool-cleanup jobphase:Completed end_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id" test_result:Pass

python3 Openshift-EE/utils/result/result_update.py $job_id P7Q4 2-setup "Cleanup cStor based mirrored storage pool on disks and corresponding storage class" $testResult $pipeline_id "$current_time" $commit_id $gittoken
if [ "$rc_val" != "0" ]; then
exit 1;
fi
}

if [ "$1" == "node" ];then
  node $2 $3 $4
else
  pod
fi