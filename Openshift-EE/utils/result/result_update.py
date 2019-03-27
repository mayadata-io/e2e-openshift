import github
import re
import sys

#command line arguments
job_id = sys.argv[1]
job_dir_name = sys.argv[2].lower()
stage = sys.argv[3] 
test_desc = sys.argv[4]
test_result = sys.argv[5]
pipeline_id = "\'"+str(sys.argv[6])+"\'"
time_stamp = sys.argv[7]
commit_sha = "\'"+str(sys.argv[8])+"\'"
token = sys.argv[9]

#url
job_url = "<a href=\"https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/{0}\">{0}</a>".format(job_id)

efk_link = "\"https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:{0},type:phrase),type:phrase,value:{0}),query:(match:(commit_id:(query:{0},type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:{1},type:phrase),type:phrase,value:{1}),query:(match:(pipeline_id:(query:{1},type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))\"".format(commit_sha,pipeline_id)

efk_url = "<a href={0}>{1}</a>".format(efk_link,test_result)


#github user-specific token authentication
git_auth = github.Github(token)

# repo-name 
username = "openebs"
repos = "e2e-openshift"
repo = git_auth.get_repo("{owner}/{repo_name}".format(owner=username, repo_name=repos))
path = 'Openshift-EE/pipelines/OpenEBS-base/stages/{}'.format(stage)
job_folder = "" 
dir = repo.get_dir_contents(path)
for i in dir:
    if str(i).lower().find(job_dir_name)>0:
        required_folder = str(i)
        job_folder = re.findall(r'{}\/(.*)\"\)'.format(stage),required_folder)[0]
        


updated_path = "Openshift-EE/pipelines/OpenEBS-base/stages/{}/{}/README.md".format(stage,job_folder)
print("https://github.com/"+username+'/'+repos+'/'+"tree/master/"+updated_path)
file = repo.get_file_contents(updated_path)
file_content=str(file.decoded_content)
file_content=str(file.decoded_content, 'utf-8')


content_list = file_content.split('\n')
#print(content_list)

# updating result's table if it is already there
if file_content.find('|')>0:
    new_job = '|     {}           |  {}           | {}  | {} |'.format(job_url,test_desc,time_stamp ,efk_url)
    index = content_list.index('| Job ID |   Test Description         | Execution Time |Test Result   |')
    content_list.insert(index+2,new_job)
    string = ('\n').join(content_list)
    
# creating result's table for first entry 
else:
    string =           '| Job ID |   Test Description         | Execution Time |Test Result   |\n'
    string = string + (' |---------|---------------------------| --------------|--------|\n')
    string = string + (' |    {}   |  {}           |  {}     |{}  |\n'.format(job_url,test_desc,time_stamp, efk_url))
    index = len(content_list)
    content_list.insert(index,string)
    string = ('\n').join(content_list)

# commit changes
commit_message = "new job result update"
repo.update_file(updated_path , commit_message , string , file.sha)



