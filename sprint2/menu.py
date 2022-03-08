import os
import requests

def fetch_data():
    url = 'http://localhost/api/v4/workflow_templates/'
    res = requests.get(url, auth=('staff', 'iLoveCP@KKU'))
    return res

def get_list_of_ids(data):
    ids = []
    for x in data:
        ids.append(x['id'])
    return ids

def main():
    res = fetch_data()
    data = res.json()

    while True:
        opt = int(input("Select option> "))
        if opt == 1:
            os.system('python -m robot 1_signin/login_test.robot')
        elif opt == 2:
            os.system('python -m robot 2_create_workflows/create_workflow.robot')
        elif opt == 3:
            os.system('python -m robot 3_create_states/sprint3_6.robot')
        elif opt == 0:
            if (res.status_code == 200):
                if (data['count'] > 0):
                    print(get_list_of_ids(data['results']))
                else:
                    print('Workflow not found.')
            else:
                print('fail to fetch data')


if __name__ == '__main__':
    main()