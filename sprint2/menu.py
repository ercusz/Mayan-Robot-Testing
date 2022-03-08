import os
import requests
import json

res = requests.get('http://localhost/api/v4/workflow_templates/')
data = json.load(res)
print(data)
while True:
    opt = int(input("Select option> "))
    if opt == 1:
        os.system('python -m robot 1_signin/login_test.robot')
    elif opt == 2:
        os.system('python -m robot 2_create_workflows/create_workflow.robot')
    elif opt == 3:
        os.system('python -m robot 3_create_states/sprint3_6.robot')
        