""" This script updates the gitalb job results to respective job readme.md """

# import sys to get command line arguments
import sys
# import re to find regular expression
import re
# import github to use github api 
import github

# command line arguments
# github job id to create gitlab job_url
job_id = sys.argv[1]
# respective job's github directory initials
job_dir_initials = sys.argv[2].lower()
# github jobs stage 
stage = sys.argv[3] 
# gitlab job description
test_desc = sys.argv[4]
# github job result: PASS or FAIL
test_result = sys.argv[5]
# pipeline id to create kibana url efk_url
pipeline_id = "\'"+str(sys.argv[6])+"\'"
# time of gitlab job run
time_stamp = sys.argv[7]
# commit_sha to create kibana url efk_url
commit_sha = "\'"+str(sys.argv[8])+"\'"
# github authentication token
token = sys.argv[9]

# Number of retries 
file_update_retries = 5

# github job log url using job_id
job_url = "<a href=\"https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/{0}\">{0}</a>".format(job_id)

# kibana url for the respective job using commit_sha and pipeline_id
efk_url = "\"https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:{0},type:phrase),type:phrase,value:{0}),query:(match:(commit_id:(query:{0},type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:{1},type:phrase),type:phrase,value:{1}),query:(match:(pipeline_id:(query:{1},type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))\"".format(commit_sha,pipeline_id)

# creating html link from kibana job url: efk_url
efk_link = "<a href={0}>{1}</a>".format(efk_url, test_result)

# github repo owner name 
username = "mayadata-io"
# github repo name
repos = "e2e-openshift"
# github authentication token 
git_auth = github.Github(token)
# github repo object
repo = git_auth.get_repo("{owner}/{repo_name}".format(owner=username, repo_name=repos))

# default github path appending stage name : 1-cluster-setup/2-setup/3-functional/4-chaos/5-cleanup
default_path = 'Openshift-EE/pipelines/OpenEBS-base/stages/{}'.format(stage)
job_dir = ""
# list of job folders in default_path
dir_contents = repo.get_dir_contents(default_path)
# matching default path contents with job_dir_initials to find out full name of job directory
flag = 0
for i in dir_contents:
    if str(i).lower().find(job_dir_initials)>0:
        flag = 1
        required_folder = str(i)
        # using regular expression to filter job_dir from required_folder object
        job_dir = re.findall(r'{}\/(.*)\"\)'.format(stage), required_folder)[0]
        break

# exit the python script if no job directory matching  
if  flag == 0:
 print("No Job {} directory found on path: {}".format(job_dir_initials, default_path))
 exit()

# creating respective gitlab job directory's github repo path       
job_dir_path = "Openshift-EE/pipelines/OpenEBS-base/stages/{}/{}".format(stage,job_dir)

# Check if the readme.md file present in job_dir_path
dir_contents = repo.get_dir_contents(job_dir_path)
flag = 0
for i in dir_contents:
    if str(i).lower().find('readme.md')>0:
     flag = 1
     break
# exit the python script if no readme.md file found at the job_dir_path
if  flag == 0:
 print("No Readme.md file found in the path: {}".format(job_dir_path))
 exit()

# readme.md file path
file_path = "Openshift-EE/pipelines/OpenEBS-base/stages/{}/{}/README.md".format(stage, job_dir)
print(file_path)
# print github url for respective job's readme.md
print("https://github.com/"+username+'/'+repos+'/'+"tree/master/"+file_path)


def fetch_file_content():
    """ fetching file contents of github file_path readme.md """
    file = repo.get_file_contents(file_path)
    file_content=str(file.decoded_content)
    file_content=str(file.decoded_content, 'utf-8')
    content_list = file_content.split('\n')
    content_list_nospace = file_content.split('\r\n')
    content_list_nospace = list(filter(lambda x: x != '', content_list_nospace))
    last_line = content_list_nospace[-1].lower()
    
    # creating result's table for first job result entry by checking if the last line of the Readme.md has `Test Result` or not
    if 'job id' in last_line:
        updated_file_content =  '| Job ID |   Test Description         | Execution Time |Test Result   |\n'
        updated_file_content = updated_file_content + (' |---------|---------------------------| --------------|--------|\n')
        updated_file_content = updated_file_content + (' |    {}   |  {}           |  {}     |{}  |\n'.format(job_url, test_desc, time_stamp, efk_link))
        index = len(content_list)
        content_list.insert(index, updated_file_content)
        updated_file_content = ('\n').join(content_list)

     # updating result's table if the table is already there
    else:
        new_job = '|     {}           |  {}           | {}  | {} |'.format(job_url,test_desc,time_stamp ,efk_link)
        index = content_list.index('| Job ID |   Test Description         | Execution Time |Test Result   |')
        content_list.insert(index+2,new_job)
        updated_file_content = ('\n').join(content_list)

    return file, updated_file_content
    
# github commit message 
commit_message = "new job result update"
exception = ''
# file update retry interator
loop_itr = 0
# file update try count
try_count = 1

# fetching readme.md file's content
file, updated_file_content = fetch_file_content()

# github exception handling
print("Trying to update readme.md file at path: {}".format(file_path))
try:
    print("README.md content update try: {}".format(try_count))
    try_count += 1
    repo.update_file(file_path, commit_message, updated_file_content, file.sha)
    print("Readme.md updated successfully")
except github.GithubException as e:
    exception = e
    print("Error message:{}".format(exception.data['message']))
    # retryng updating readme.md after refetching the file contents
    while loop_itr < file_update_retries:
     # 409 is github exception status in case of conflict
     # retry committing to respective job's readme.md in case of conflict by refetching readme.md file contents
     if exception.status == 409:
      # exception handling for github exception status: 409
      try:
       print("README.md content update try: {}".format(try_count))
       # refetch github readme.md file content
       file,updated_file_content = fetch_file_content()
       try_count += 1
       # retry committing readme.md file 
       repo.update_file(file_path, commit_message, updated_file_content, file.sha)
       print("Readme.md updated successfully")
       # exit the loop as file updated successfully
       break
      except github.GithubException as e:
       exception = e
       print("Error message:{}".format(exception.data['message']))
       loop_itr = loop_itr + 1
     # exit the loop if github exception is not 409
     else:
       print("Readme.md updation failed")
       break
