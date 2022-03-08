*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}    localhost
${BROWSER}    Firefox
${ID1}    51
${ID2}    52
${ID3}    53
${LOGIN PAGE}    http://${SERVER}/authentication/login/?next=/home/
${HOME PAGE}    http://localhost/#/home/
${WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/
${PREVIEW WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/${ID1}/preview/
${CREATE WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/create/
${WORKFLOWS STATES PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/${ID1}/states/
${WORKFLOWS DOCUMENTS PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/${ID1}/documents/
${WORKFLOWS TEMPLATES}      http://localhost/#/workflows/workflow_templates/    
${DELAY}    1
${VALID USERNAME}    staff
${VALID PASSWORD}    iLoveCP@KKU

*** Test Cases ***
Open Login Page
	Open Browser    ${LOGIN PAGE}    ${BROWSER}
	Location Should Be    ${LOGIN PAGE}

Login To Home Page
	Input Text    username    ${VALID USERNAME}
	Input Text    password    ${VALID PASSWORD}
    Click Button    submit
	Location Should Contain    ${HOME PAGE}    

Go To Workflows Page
	Wait Until Element Is Visible    xpath://a[@aria-controls="collapse-workflows"]
	Click Link    xpath://a[@aria-controls="collapse-workflows"]
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_runtime_proxies/"]
	Click Link    xpath://a[@href="/workflows/workflow_runtime_proxies/"]
	Location Should Contain    ${WORKFLOWS PAGE}     

Preview Workflows
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/${ID1}/preview/"]  ${DELAY} 
	Click Link    xpath://a[@href="/workflows/workflow_templates/${ID1}/preview/"]
	Location Should Contain    ${PREVIEW WORKFLOWS PAGE}

Go to Workflow Templates
    Wait Until Element Is Visible    id:menu-actions
    Click Link    xpath=//*[@id="menu-actions"]    
    Wait Until Element Is Visible    xpath://a[@href="workflows/workflow_templates/"]
    Click Link    xpath://a[@href="workflows/workflow_templates/"]
    Location Should Contain    ${WORKFLOWS TEMPLATES} 

Go to Workflow Delete
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/5/delete/"]
    Click Link    xpath://a[@href="/workflows/workflow_templates/${ID2}/delete/"]
    Click Button    class:btn btn-primary
    Location Should Contain    ${WORKFLOWS TEMPLATES} 
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/5/delete/"]
    Click Link    xpath://a[@href="/workflows/workflow_templates/${ID2}/delete/"]
    Click Button    class:btn btn-danger
    Location Should Contain    ${WORKFLOWS TEMPLATES} 

Go to Workflow launch
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/1/launch/"]    
    Click Link    xpath://a[@href="/workflows/workflow_templates/${ID3}/launch/"]
    Click Button    class:btn btn-danger
    Location Should Contain    ${WORKFLOWS TEMPLATES}

Go to Workflow launch
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/1/edit/"]
    Click Link    xpath://a[@href="/workflows/workflow_templates/${ID3}/edit/"]
    Location Should Contain    ${CREATE WORKFLOWS PAGE}
    Input Text    id_label    แก้ไขครั้งที่หนึ่ง
    Input Text    id_internal_name    ทดสอบครั้งที่หนึ่ง
    Input Text    id_start_datetime_0    03/06/2022
    Input Text    id_start_datetime_1    10:45AM
    Input Text    id_end_datetime_0    03/30/2022
    Input Text    id_end_datetime_1    11:59PM
    Click Button    submit
    #Click Button    class:btn btn-primary btn-hotkey-default
    Location Should Contain    ${WORKFLOWS TEMPLATES}