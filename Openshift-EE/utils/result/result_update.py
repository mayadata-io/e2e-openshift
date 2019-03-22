import github
import re
import sys

#command line arguments
test_id = sys.argv[1]
job_dir_name = sys.argv[2].lower()
stage = sys.argv[3] 
test_desc = sys.argv[4]
test_result = sys.argv[5]
token = sys.argv[6]

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
file = repo.get_file_contents(updated_path)
file_content=str(file.decoded_content)
file_content = re.sub(r'\\n','\\n',file_content)		
file_content = file_content.strip("b\'\'")

# updating result's table if it is already there
if file_content.find("Test Result")>0:
    content_list= file_content.split('\n')
    new_job = '|     {}                    |  {}           | {}  |'.format(test_id,test_desc,test_result)
    content_list.insert(2,new_job)
    string = ('\n').join(content_list)
    
# creating result's table for first entry 
else:
    string =           ' | Test ID |   Test Description               | Test Result   |\n'
    string = string + (' |---------|---------------------------| --------------|\n')
    string = string + (' |    {}   |  {}           |  {}     |\n'.format(test_id,test_desc,test_result))


# commit changes
commit_message = "new job result update"
repo.update_file(updated_path , commit_message , string , file.sha)
