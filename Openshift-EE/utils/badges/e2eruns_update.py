import github
import re
import sys


token = sys.argv[2]
git_auth = github.Github(token)

repo = git_auth.get_repo("mayadata-io/automation")
file = repo.get_file_contents("README.md")
file_content=str(file.decoded_content)

updated_url = ''

if "E2E%20runs" in file_content:
	url = int(re.findall(r'runs-(.*)-orange',file_content)[0])
	print(url)
	num_tests = str(int(sys.argv[1]) + url)
	num_tests = 'runs-' + num_tests + '-orange'
	updated_url = re.sub(r'runs-(.*)-orange',num_tests,file_content)
	updated_url = re.sub(r'\\n','\\n',updated_url)		
	updated_url = updated_url.strip("b\'\'")
		

# update,
repo.update_file("README.md", "E2E runs update", updated_url, file.sha)




