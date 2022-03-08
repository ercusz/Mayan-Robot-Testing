*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    edge
${SERVER}    localhost
${VALID USERNAME}    staff
${VALID PASSWORD}    iLoveCP@KKU
${LOGIN PAGE}    http://${SERVER}/authentication/login/?next=/home/
${HOME PAGE}    http://localhost/#/home/
${WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/
${PREVIEW WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/2/preview/
${CREATE WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/create/
${WORKFLOWS STATES PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/2/states/
${WORKFLOWS DOCUMENTS PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/2/documents/
${WORKFLOWS DOCUMENTS INSIDE}    http://localhost/#/documents/documents/3/preview/
${WORKFLOWS DOCUMENTS TRANSITIONS}    http://localhost/#/workflows/documents/3/workflows/
${WORKFLOWS DOCUMENTS DESCRIPTION}    http://localhost/#/workflows/documents/workflows/3/

*** Test Cases ***
Set Delay
    Set Selenium Speed    0.3
    
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

Workflow Documents
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_runtime_proxies/2/documents/"]
	Click Link    xpath://a[@href="/workflows/workflow_runtime_proxies/2/documents/"]
	Location Should Contain    ${WORKFLOWS DOCUMENTS PAGE}
	
Go to Documents #03
    Wait Until Element Is Visible    xpath://a[@href="/documents/documents/3/preview/"] 
    Click Link    xpath://a[@href="/documents/documents/3/preview/"]
    Location Should Contain    ${WORKFLOWS DOCUMENTS INSIDE}

Go To Workflow Documents
    Wait Until Element Is Visible    xpath://a[@href="/workflows/documents/3/workflows/"] 
    Click Link    xpath://a[@href="/workflows/documents/3/workflows/"]
    Location Should Contain    ${WORKFLOWS DOCUMENTS TRANSITIONS}

Go To Description
    Wait Until Element Is Visible    xpath://a[@href="/workflows/documents/workflows/3/"] 
    Click Link    xpath://a[@href="/workflows/documents/workflows/3/"]
    Location Should Contain    ${WORKFLOWS DOCUMENTS DESCRIPTION}
    [Teardown]  Close Browser





