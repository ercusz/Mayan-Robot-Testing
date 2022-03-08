*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}    localhost
${BROWSER}    Chrome
${LOGIN PAGE}    http://localhost/authentication/login/?next=/home/
${HOME PAGE}    http://localhost/#/home/
${WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/
${PREVIEW WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/1/preview/
${WORKFLOWS STATES PAGE}    http://localhost/#/workflows/workflow_templates/1/states/
${CREATE WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/create/
${TRANSITIONS WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/1/transitions/
${EVENTS WORKFLOWS PAGE}    http://localhost/#/events/object/document_states/workflow/1/events/
${WORKFLOWS DOCUMENT TYPE PAGE}    http://localhost/#/workflows/workflow_templates/1/document_types/
${WORKFLOWS TEMPLATES}    http://localhost/#/workflows/workflow_templates/
${COPY WORKFLOWS PAGE}    http://localhost/#/object/document_states/workflow/1/copy/
${VALID USERNAME}    admin
${VALID PASSWORD}    TrwquxR9xc


*** Test Cases ***

Go to Transitions 
	Open Login Page
	Login To Home Page
	Go To Preview Workflows Page
	Go to Workflow Templates
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/1/transitions/"]
	Click Link    xpath://a[@href="/workflows/workflow_templates/1/transitions/"]
	Location Should Contain    ${TRANSITIONS WORKFLOWS PAGE}
	[Teardown]    Close Browser
	
Go to Preview 
	Open Login Page
	Login To Home Page
	Go To Preview Workflows Page
	Go to Workflow Templates
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/1/preview/"]
	Click Link    xpath://a[@href="/workflows/workflow_templates/1/preview/"]
	Location Should Contain    ${PREVIEW WORKFLOWS PAGE}
	[Teardown]    Close Browser
	
Go to Document Type 
	Open Login Page
	Login To Home Page
	Go To Preview Workflows Page
	Go to Workflow Templates
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/1/document_types/"]
	Click Link    xpath://a[@href="/workflows/workflow_templates/1/document_types/"]
	Location Should Contain    ${WORKFLOWS DOCUMENT TYPE PAGE}
	[Teardown]    Close Browser
	
Go to States 
	Open Login Page
	Login To Home Page
	Go To Preview Workflows Page
	Go to Workflow Templates
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/1/states/"]
	Click Link    xpath://a[@href="/workflows/workflow_templates/1/states/"]
	Location Should Contain    ${WORKFLOWS STATES PAGE}
	[Teardown]    Close Browser
	
	

	
*** Keywords ***

Open Login Page
	Open Browser    ${LOGIN PAGE}    ${BROWSER}
	Location Should Be    ${LOGIN PAGE}
	
Login To Home Page
	Input Text    username    ${VALID USERNAME}
	Input Text    password    ${VALID PASSWORD}
    Click Button    submit
	Location Should Contain    ${HOME PAGE}
	
Go To Preview Workflows Page
	Wait Until Element Is Visible    xpath://a[@aria-controls="collapse-workflows"]
	Click Link    xpath://a[@aria-controls="collapse-workflows"]
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_runtime_proxies/"]
	Click Link    xpath://a[@href="/workflows/workflow_runtime_proxies/"]
	Location Should Contain    ${WORKFLOWS PAGE}
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/1/preview/"]
	Click Link    xpath://a[@href="/workflows/workflow_templates/1/preview/"]
	Location Should Contain    ${PREVIEW WORKFLOWS PAGE}
	
Go to Workflow Templates
    Wait Until Element Is Visible  id:menu-actions
    Click Element    xpath=//*[@id="menu-actions"]  
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/"]
    Click Link    xpath://a[@href="/workflows/workflow_templates/"]
    Location Should Contain    ${WORKFLOWS TEMPLATES} 
	