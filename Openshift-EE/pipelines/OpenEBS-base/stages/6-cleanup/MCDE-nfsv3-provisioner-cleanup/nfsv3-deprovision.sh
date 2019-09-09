#!/bin/bash
set -x
pod() {

sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip -p $port 'cd e2e-openshift && bash Openshift-EE/pipelines/OpenEBS-base/stages/6-cleanup/MCDE-nfsv3-provisioner-cleanup/nfsv3-deprovision node '"'$CI_JOB_ID'"'' '"'$CI_PIPELINE_ID'"' '"'$CI_COMMIT_SHA'"'

}

node() {

job_id=$(echo $1)
pipeline_id=$(echo $2)
case_id=MCDE
commit_id=$(echo $3)
source ~/.profile
gittoken=$(echo "$github_token")

time="date"
current_time=$(eval $time)

#pooling over previous job to complete
bash Openshift-EE/utils/pooling jobname:nfsv4-deprovision
bash Openshift-EE/utils/e2e-cr jobname:nfsv3-deprovision jobphase:Running init_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

run_id="v3-deprovision";test_name=$(bash Openshift-EE/utils/generate_test_name testcase=nfs-provision metadata=${run_id})
echo $test_name
cd litmus

# copy the content of deployer run_litmus_test.yml into a different file to update the test specific parameters.
cp providers/nfs-provisioner/run_litmus_test.yml nfsv3-deprovision.yml

sed -i -e 's/imagePullPolicy: Always/imagePullPolicy: IfNotPresent/g' \
-e 's/value: app-nfs-ns/value: app-nfsv3-ns/g' \
-e 's/value: vers=4.1/value: vers=3/g' \
-e 's/  app: nfs-litmus/  app: nfsv3-deprovision-litmus/g' \
-e 's/value: provision/value: deprovision/g' \
-e 's/value: openebs-nfs/value: openebs-nfs3/g' nfsv3-deprovision.yml

sed -i '/command:/i \
          - name: RUN_ID\
            value: '"$run_id"'\
' nfsv3-deprovision.yml

#################
## RUNNER MAIN ##
#################
echo "Running the litmus test.."

cat nfsv3-deprovision.yml
rc_val=$(echo $?)

bash ../Openshift-EE/utils/litmus_job_runner label='app:nfsv3-deprovision-litmus' job=nfsv3-deprovision.yml
bash ../Openshift-EE/utils/dump_cluster_state;
cd ..
bash Openshift-EE/utils/event_updater jobname:nfsv3-deprovision $test_name jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

#################
## GET RESULT  ##
#################
#rc_val=$(echo $?)

## Check the test status & result from the litmus result custom resource
source ~/.profile
gittoken=$(echo "$github_token")
testResult=$(kubectl get litmusresult ${test_name} --no-headers -o custom-columns=:spec.testStatus.result)

current_time=$(eval $time)
bash Openshift-EE/utils/e2e-cr jobname:nfsv3-deprovision jobphase:Completed end_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id" test_result:Pass

python3 Openshift-EE/utils/result/result_update.py $job_id MCDE 2-setup "Cleanup NFS provisioner vers 3 and corresponding storage class" $testResult $pipeline_id "$current_time" $commit_id $gittoken
if [ "$rc_val" != "0" ]; then
exit 1;
fi
}

if [ "$1" == "node" ];then
  node $2 $3 $4
else
  pod
fi