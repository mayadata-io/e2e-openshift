import github
import re
import sys


token = sys.argv[2]
git_auth = github.Github(token)

username = "mayadata-io"
repos = "automation"
repo = git_auth.get_repo("{owner}/{repo_name}".format(owner=username, repo_name=repos))
file = repo.get_file_contents("README.md")
file_content=str(file.decoded_content)
file_content=str(file.decoded_content, 'utf-8')


if "Overall%20E2E%20Runs" in file_content:
	url = int(re.findall(r'Overall%20E2E%20Runs-(.*)-orange',file_content)[0])
	print(url)
	num_tests = str(int(sys.argv[1]) + url)
	num_tests = 'Overall%20E2E%20Runs-' + num_tests + '-orange'
	updated_url = re.sub(r'Overall%20E2E%20Runs-(.*)-orange',num_tests,file_content)
	updated_url = re.sub(r'\\n','\\n',updated_url)		
	updated_url = updated_url.strip("b\'\'")


# update README.md file
repo.update_file("README.md", "Overall E2E Runs update",updated_url , file.sha)




