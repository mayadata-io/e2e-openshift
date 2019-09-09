#!/bin/bash
set -x
pod() {

sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip -p $port 'cd e2e-openshift && bash Openshift-EE/pipelines/OpenEBS-base/stages/6-cleanup/0FN8-nfsv4-provisioner-cleanup/nfs-provisioner-cleanup node '"'$CI_JOB_ID'"'' '"'$CI_PIPELINE_ID'"' '"'$CI_COMMIT_SHA'"'
}

node() {

job_id=$(echo $1)
pipeline_id=$(echo $2)
case_id=0FN8
commit_id=$(echo $3)
source ~/.profile
gittoken=$(echo "$github_token")
kubectl taint node gitlab-node1.mayalabs.io infra-aid:NoSchedule-
time="date"
current_time=$(eval $time)

#pooling over previous job to complete

bash Openshift-EE/utils/e2e-cr jobname:openebs-cleanup jobphase:Waiting
bash Openshift-EE/utils/e2e-cr jobname:spc-striped-pool-cleanup jobphase:Waiting 
bash Openshift-EE/utils/e2e-cr jobname:spc-mirrored-pool-cleanup jobphase:Waiting
bash Openshift-EE/utils/e2e-cr jobname:spc-raidz1-pool-cleanup jobphase:Waiting
bash Openshift-EE/utils/e2e-cr jobname:cleanup-cspc-striped-pool jobphase:Waiting
bash Openshift-EE/utils/e2e-cr jobname:nfsv3-deprovision jobphase:Waiting
bash Openshift-EE/utils/e2e-cr jobname:nfsv4-deprovision jobphase:Waiting
bash Openshift-EE/utils/e2e-cr jobname:nfsv4-deprovision jobphase:Running init_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

run_id="cleanup";test_name=$(bash Openshift-EE/utils/generate_test_name testcase=nfs-provision metadata=${run_id})
echo $test_name
cd litmus

# copy the content of deployer run_litmus_test.yml into a different file to update the test specific parameters.
cp providers/nfs-provisioner/run_litmus_test.yml nfsv4-deprovision.yml

#################
## RUNNER MAIN ##
#################
sed -i -e 's/app: nfs-litmus/app: nfsv4-deprovision-litmus/g' \
-e 's/imagePullPolicy: Always/imagePullPolicy: IfNotPresent/g' \
-e 's/value: app-nfs-ns/value: app-nfsv4-ns/g' \
-e 's/value: provision/value: deprovision/g' \
-e 's/value: openebs-nfs/value: openebs-nfs4/g' nfsv4-deprovision.yml

sed -i '/command:/i \
          - name: RUN_ID\
            value: '"$run_id"'\
' nfsv4-deprovision.yml

rc_val=$(echo $?)

echo "Running the litmus test.."

cat nfsv4-deprovision.yml

bash ../Openshift-EE/utils/litmus_job_runner label='app:nfsv4-deprovision-litmus' job=nfsv4-deprovision.yml
bash ../Openshift-EE/utils/dump_cluster_state;
cd ..
bash Openshift-EE/utils/event_updater jobname:nfsv4-deprovision $test_name jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id"

#################
## GET RESULT  ##
#################
#rc_val=$(echo $?)

## Check the test status & result from the litmus result custom resource
source ~/.profile
gittoken=$(echo "$github_token")
testResult=$(kubectl get litmusresult ${test_name} --no-headers -o custom-columns=:spec.testStatus.result)

current_time=$(eval $time)
bash Openshift-EE/utils/e2e-cr jobname:nfsv4-deprovision jobphase:Completed end_time:"$current_time" jobid:"$job_id" pipelineid:"$pipeline_id" testcaseid:"$case_id" test_result:Pass

python3 Openshift-EE/utils/result/result_update.py $job_id 0FN8 2-setup "Cleanup NFS provisioner and corresponding storage class" $testResult $pipeline_id "$current_time" $commit_id $gittoken
if [ "$rc_val" != "0" ]; then
exit 1;
fi
}

if [ "$1" == "node" ];then
  node $2 $3 $4
else
  pod
fi