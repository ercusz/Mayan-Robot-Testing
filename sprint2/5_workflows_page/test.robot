*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}    localhost
${BROWSER}    Chrome
${LOGIN PAGE}    http://localhost/authentication/login/?next=/home/
${HOME PAGE}    http://localhost/#/home/
${WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/
${PREVIEW WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/1/preview/
${CREATE WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/create/
${WORKFLOWS STATES PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/1/states/
${WORKFLOWS DOCUMENTS PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/1/documents/
${TOGGLE LIST ITEMS PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/?_list_mode=items
${TOGGLE LIST PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/?_list_mode=list
${VALID USERNAME}    admin
${VALID PASSWORD}    TrwquxR9xc


*** Test Cases ***

Login And Go To Workflows Page
	Open Login Page
	Login as a admin
	Go To Workflows Page
	
Preview Workflows
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/1/preview/"]
	Click Link    xpath://a[@href="/workflows/workflow_templates/1/preview/"]
	Location Should Contain    ${PREVIEW WORKFLOWS PAGE}
	[Teardown]    Close Browser
	
Workflow Documents
	Open Login Page
	Login as a admin
	Go To Workflows Page
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_runtime_proxies/1/documents/"]
	Click Link    xpath://a[@href="/workflows/workflow_runtime_proxies/1/documents/"]
	Location Should Contain    ${WORKFLOWS DOCUMENTS PAGE}
	[Teardown]    Close Browser

Workflow States
	Open Login Page
	Login as a admin
	Go To Workflows Page
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_runtime_proxies/1/states/"]
	Click Link    xpath://a[@href="/workflows/workflow_runtime_proxies/1/states/"]
	Location Should Contain    ${WORKFLOWS STATES PAGE}
	[Teardown]    Close Browser
	
Select All Workflows
	Open Login Page
	Login as a admin
	Go To Workflows Page
	Wait Until Element Is Visible    xpath://a[@class="btn btn-default btn-sm check-all"]
	Click Element    xpath://a[@class="btn btn-default btn-sm check-all"]
	Checkbox Should Be Selected  pk_1
	Checkbox Should Be Selected  pk_2
	Checkbox Should Be Selected  pk_6
	Location Should Contain    ${WORKFLOWS PAGE}
	
Deselect All Workflows
	Wait Until Element Is Visible    xpath://a[@class="btn btn-default btn-sm check-all"]
	Click Element    xpath://a[@class="btn btn-default btn-sm check-all"]
	Checkbox Should Not Be Selected  pk_1
	Checkbox Should Not Be Selected  pk_2
	Checkbox Should Not Be Selected  pk_6
	Location Should Contain    ${WORKFLOWS PAGE}
	
Toggle List View
	Wait Until Element Is Visible    xpath://a[@href="?_list_mode=items"]
	Click Element    xpath://a[@href="?_list_mode=items"]
	Location Should Contain    ${TOGGLE LIST ITEMS PAGE}

Click Toggle List Again
	Wait Until Element Is Visible    xpath://a[@href="?_list_mode=list"]
	Click Element    xpath://a[@href="?_list_mode=list"]
	Location Should Contain    ${TOGGLE LIST PAGE}	
	[Teardown]    Close Browser
	
	
	
*** Keywords ***
Open Login Page
	Open Browser    ${LOGIN PAGE}    ${BROWSER}
	Location Should Be    ${LOGIN PAGE}
	
Login as a admin
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
	

