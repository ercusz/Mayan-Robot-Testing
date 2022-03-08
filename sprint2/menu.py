import os

while True:
    opt = int(input("Select option> "))
    if opt == 1:
        os.system('python -m robot 1_signin/login_test.robot')
    elif opt == 2:
        os.system('python -m robot 2_create_workflows/create_workflow.robot')
        