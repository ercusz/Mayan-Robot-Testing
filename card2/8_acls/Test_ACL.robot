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
# TC001
(staff)Editing Workflow
    Set Delay
    Open Login Page
    Login To Home Page
    Go To Workflows Page
    Workflow Preview
    Go to Workflow Template
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_templates/${ID1}/edit/"]
    Click Element    xpath://a[@href="/workflows/workflow_templates/${ID1}/edit/"]
    Location Should Contain    http://localhost/#/workflows/workflow_templates/${ID1}/edit/
    Input Text    id_label    แก้ไขครั้งที่หนึ่ง
    Input Text    id_internal_name    testround1
    Input Text    id_start_datetime_0    06/03/2022
    Input Text    id_start_datetime_1    10:45AM
    Input Text    id_end_datetime_0    30/03/2022
    Input Text    id_end_datetime_1    11:59PM
    Click Button    submit
    Location Should Contain    http://localhost/#/workflows/workflow_templates/   
    [Teardown]  Close Browser

# TC002
(staff2)Find Edit and Delete buttons
    Set Selenium Speed
    Open Login Page_2
    Login To Home Page_2
    Go To Workflows Page_2
    Workflow Preview_2
    Go to Workflow Template_2
    Element Should Not Be Visible    xpath://a[@href="/workflows/workflow_templates/${ID1}/edit/"]
    Element Should Not Be Visible    xpath://a[@href="/workflows/workflow_templates/${ID1}/delete/"]

# TC003
(staff2)Go to Edit Page
    Go To    http://localhost/#/workflows/workflow_templates/${ID1}/edit/
    Wait Until Page Contains    ไม่พบหน้าที่คุณกำลังตามหา

# TC004
(staff2)Go to Delete Page
    Go To    http://localhost/#/workflows/workflow_templates/${ID1}/delete/
    Wait Until Page Contains    ไม่พบหน้าที่คุณกำลังตามหา
    [Teardown]  Close Browser


*** Keywords ***
Set Delay
    Set Selenium Speed    0.5

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