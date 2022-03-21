import fileinput
import os

import ascii_magic
import requests


def fetch_data():
    url = 'http://localhost/api/v4/workflow_templates/'
    res = requests.get(url, auth=('staff', 'iLoveCP@KKU'))
    return res

def fetch_docs_data():
    url = 'http://localhost/api/v4/workflow_templates/'
    res = requests.get(url, auth=('admin', 'QUGaFF9fLE'))
    return res

def get_list_of_ids(data):
    ids = []
    for x in data:
        ids.append(x['id'])
    return ids

def get_list_of_labels(data):
    labels = []
    for x in data:
        labels.append(x['label'])
    return labels

def update_id():
    res = fetch_data()
    data = res.json()
    if (res.status_code == 200):
        if (data['count'] > 0):
            ids = get_list_of_ids(data['results'])
            labels = get_list_of_labels(data['results'])
            doc_id = set_docs_id()
            replace_text(ids, doc_id, labels)
        else:
            print('Workflow not found.')
    else:
        print('fail to fetch data')

def set_docs_id():
    res = fetch_docs_data()
    data = res.json()
    if (res.status_code == 200):
        if (data['count'] > 0):
            doc_id = max(get_list_of_ids(data['results']))
            return doc_id + 1
        else:
            return 1
    else:
        print('fail to fetch data')
        exit(0)

def replace_text(id_list, doc_id, labels):
    file_names = [
        'card2/3_create_states/sprint3_6.robot', 
        'card2/4_create_transitions/sprint3_7_2.robot',
        'card2/5_workflows_page/test.robot',
        'card2/6_workflow_template/crudtest.robot',
        'card2/6_workflow_template/test4.robot',
        'card2/7_doc_trans/test_doctran.robot',
        'card2/8_acls/Test_ACL.robot'
    ]

    for filename in file_names:
        with fileinput.FileInput(filename, inplace=True, backup='.bak', encoding='utf-8') as file:
            for line in file:
                prefix1 = "${ID1}    "
                prefix2 = "${ID2}    "
                prefix3 = "${ID3}    "
                prefix4 = "${ID4}    "
                prefix5 = "${D_ID1}    "
                prefix6 = "${LABEL1}    "
                prefix7 = "${ID_NEXT}    "
                if line.startswith(prefix1):
                    line = prefix1 + str(id_list[0]) + "\n"
                elif line.startswith(prefix2):
                    line = prefix2 + str(id_list[1]) + "\n"
                elif line.startswith(prefix3):
                    line = prefix3 + str(id_list[2]) + "\n"
                elif line.startswith(prefix6):
                    line = prefix6 + str(labels[0]) + "\n"
                elif line.startswith(prefix7):
                    line = prefix7 + str(max(id_list)+1) + "\n"
                
                if (len(id_list) > 3):
                    if line.startswith(prefix4):
                        line = prefix4 + str(id_list[3]) + "\n"
                    elif line.startswith(prefix5):
                        line = prefix5 + str(doc_id) + "\n"

                print(line, end='')

def main():
    # Dobby's Adventures in the Mayan Empire
    txt = '''
___  ____ ___  ___  _   _ . ____    ____ ___  _  _ ____ _  _ ___ _  _ ____ ____ ____    
|  \ |  | |__] |__]  \_/  ' [__     |__| |  \ |  | |___ |\ |  |  |  | |__/ |___ [__     
|__/ |__| |__] |__]   |     ___]    |  | |__/  \/  |___ | \|  |  |__| |  \ |___ ___]    
                                                                                        
_ _  _    ___ _  _ ____    _  _ ____ _   _ ____ _  _    ____ _  _ ___  _ ____ ____      
| |\ |     |  |__| |___    |\/| |__|  \_/  |__| |\ |    |___ |\/| |__] | |__/ |___      
| | \|     |  |  | |___    |  | |  |   |   |  | | \|    |___ |  | |    | |  \ |___      
'''
    print(txt)

    while True:
        opt = input("Select option> ")
        if opt == '1':
            os.system('python -m robot card2/1_signin/login_test.robot')
        elif opt == '2':
            os.system('python -m robot card2/2_create_workflows/create_workflow.robot')
        elif opt == '3':
            update_id()
            os.system('python -m robot card2/3_create_states/sprint3_6.robot')
        elif opt == '4':
            update_id()
            os.system('python -m robot card2/4_create_transitions/sprint3_7_2.robot')
        elif opt == '5':
            update_id()
            os.system('python -m robot card2/5_workflows_page/test.robot')
        elif opt == '6':
            update_id()
            os.system('python -m robot card2/6_workflow_template/test4.robot')
            os.system('python -m robot card2/6_workflow_template/crudtest.robot')
        elif opt == '7':
            update_id()
            os.system('python -m robot card2/7_doc_trans/test_doctran.robot')
        elif opt == '8':
            update_id()
            os.system('python -m robot card2/8_acls/Test_ACL.robot')
        elif opt == 'set-id':
            update_id()
        elif opt == 'clean':
            os.system('git clean -Xdf')


if __name__ == '__main__':
    main()
