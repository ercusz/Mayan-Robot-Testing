*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Firefox
${SERVER}    localhost
${ID1}    1
${ID_NEXT}    5
${VALID USERNAME_1}    staff
${VALID USERNAME_2}    staff2
${VALID PASSWORD_1}    iLoveCP@KKU
${LOGIN PAGE}    http://${SERVER}/authentication/login/?next=/home/
${HOME PAGE}    http://localhost/#/home/
${WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/
${PREVIEW WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/${ID1}/preview/
${CREATE WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/create/

*** Test Cases ***
Set Delay
    Set Selenium Speed    0.3

Open Login Page
	Open Browser    ${LOGIN PAGE}    ${BROWSER}
	Location Should Be    ${LOGIN PAGE}

Login To Home Page
	Input Text    username    ${VALID USERNAME_1}
	Input Text    password    ${VALID PASSWORD_1}
    Click Button    submit
	Location Should Contain    ${HOME PAGE}

Go To Workflows Page
    Wait Until Element Is Visible    xpath://a[@aria-controls="collapse-workflows"]  
    Click Link    xpath://a[@aria-controls="collapse-workflows"]
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_runtime_proxies/"]
    Click Link    xpath://a[@href="/workflows/workflow_runtime_proxies/"]
    Location Should Contain    ${WORKFLOWS PAGE}

Workflow Preview
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/${ID1}/preview/"]
	Click Link    xpath://a[@href="/workflows/workflow_templates/${ID1}/preview/"]
	Location Should Contain    ${PREVIEW WORKFLOWS PAGE}

Go to Workflow Template
    Wait Until Element Is Visible    id:menu-actions
    Click Element    xpath=//*[@id="menu-actions"]
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/"]
    Click Link    xpath://a[@href="/workflows/workflow_templates/"]
    Location Should Contain  http://localhost/#/workflows/workflow_templates/

Editing Workflow
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/${ID1}/edit/"]
    Click Element    xpath://a[@href="/workflows/workflow_templates/${ID1}/edit/"]
    Location Should Contain    http://localhost/#/workflows/workflow_templates/${ID1}/edit/
    [Teardown]  Close Browser

Open Login Page_2
	Open Browser    ${LOGIN PAGE}    ${BROWSER}
	Location Should Be    ${LOGIN PAGE}

Login To Home Page_2
	Input Text    username    ${VALID USERNAME_2}
	Input Text    password    ${VALID PASSWORD_1}
    Click Button    submit
	Location Should Contain    ${HOME PAGE}

Go To Workflows Page_2
    Wait Until Element Is Visible    xpath://a[@aria-controls="collapse-workflows"]  
    Click Link    xpath://a[@aria-controls="collapse-workflows"]
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_runtime_proxies/"]
    Click Link    xpath://a[@href="/workflows/workflow_runtime_proxies/"]
    Location Should Contain    ${WORKFLOWS PAGE}

Workflow Preview_2
	Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/${ID1}/preview/"]
	Click Link    xpath://a[@href="/workflows/workflow_templates/${ID1}/preview/"]
	Location Should Contain    ${PREVIEW WORKFLOWS PAGE}

Go to Workflow Template_2
    Wait Until Element Is Visible    id:menu-actions
    Click Element    xpath=//*[@id="menu-actions"]
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/"]
    Click Link    xpath://a[@href="/workflows/workflow_templates/"]
    Location Should Contain  http://localhost/#/workflows/workflow_templates/

Editing Workflow_2
    Element Should Not Be Visible    xpath://a[@href="/workflows/workflow_templates/${ID1}/edit/"]
    Go To    http://localhost/#/workflows/workflow_templates/${ID1}/edit/
    Wait Until Page Contains    ไม่พบหน้าที่คุณกำลังตามหา
    [Teardown]  Close Browser
