*** Settings ***
Library    SeleniumLibrary  timeout=3

*** Variables ***
${SERVER}    localhost
${BROWSER}    Firefox
${ID1}    64
${ID2}    65
${ID3}    66
${LOGIN PAGE}    http://${SERVER}/authentication/login/?next=/home/
${HOME PAGE}    http://localhost/#/home/
${WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/
${PREVIEW WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/${ID1}/preview/
${CREATE WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/create/
${EDIT WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/${ID3}/edit
${WORKFLOWS STATES PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/${ID1}/states/
${WORKFLOWS DOCUMENTS PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/${ID1}/documents/
${WORKFLOWS TEMPLATES}      http://localhost/#/workflows/workflow_templates/    
${DELAY}    0.3
${VALID USERNAME}    staff
${VALID PASSWORD}    iLoveCP@KKU

*** Test Cases ***
Open Login Page
    Set Selenium Speed  ${DELAY}
	Open Browser    ${LOGIN PAGE}    ${BROWSER}
	Location Should Be    ${LOGIN PAGE}

Login To Home Page
	Input Text    username    ${VALID USERNAME}
	Input Text    password    ${VALID PASSWORD}
    Click Button    submit
	Location Should Contain    ${HOME PAGE}    

Go To Workflows Page
	Wait Until Element Is Visible    xpath://a[@aria-controls="collapse-workflows"]
	Double Click Element    xpath://a[@aria-controls="collapse-workflows"]
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_runtime_proxies/"]
	Double Click Element    xpath://a[@href="/workflows/workflow_runtime_proxies/"]
	Location Should Contain    ${WORKFLOWS PAGE}     

Preview Workflows
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/${ID1}/preview/"]  ${DELAY} 
	Click Link    xpath://a[@href="/workflows/workflow_templates/${ID1}/preview/"]
	Location Should Contain    ${PREVIEW WORKFLOWS PAGE}

Go to Workflow Templates
    Wait Until Element Is Visible  id:menu-actions
    Click Element    xpath=//*[@id="menu-actions"]
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/"]
    Click Element    xpath://a[@href="/workflows/workflow_templates/"]
    Location Should Contain    ${WORKFLOWS TEMPLATES} 

Go to Workflow Delete
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/${ID2}/delete/"]
    Click Element    xpath://a[@href="/workflows/workflow_templates/${ID2}/delete/"]
    Wait Until Element Is Visible    xpath://a[@class="btn btn-primary"]
    Click Element    xpath://a[@class="btn btn-primary"]
    Location Should Contain    ${WORKFLOWS TEMPLATES} 
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/${ID2}/delete/"]
    Click Element    xpath://a[@href="/workflows/workflow_templates/${ID2}/delete/"]
    Wait Until Element Is Visible    xpath://button[@class="btn btn-danger"]
    Click Element    xpath://button[@class="btn btn-danger"]
    Location Should Contain    ${WORKFLOWS TEMPLATES} 

Go to Workflow launch
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/${ID3}/launch/"]    
    Click Element    xpath://a[@href="/workflows/workflow_templates/${ID3}/launch/"]
    Wait Until Element Is Visible    xpath://button[@class="btn btn-danger"]
    Click Element    xpath://button[@class="btn btn-danger"]
    Location Should Contain    ${WORKFLOWS TEMPLATES}

Go to Workflow Edit
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/${ID3}/edit/"]
    Click Link    xpath://a[@href="/workflows/workflow_templates/${ID3}/edit/"]
    Location Should Contain    ${EDIT WORKFLOWS PAGE}
    Input Text    id_label    แก้ไขครั้งที่หนึ่ง
    Input Text    id_internal_name    testround1
    Input Text    id_start_datetime_0    06/03/2022
    Input Text    id_start_datetime_1    10:45AM
    Input Text    id_end_datetime_0    30/03/2022
    Input Text    id_end_datetime_1    11:59PM
    Click Button    submit
    #Click Button    class:btn btn-primary btn-hotkey-default
    Location Should Contain    ${WORKFLOWS TEMPLATES}