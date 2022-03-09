*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Firefox
${SERVER}    localhost
${VALID USERNAME}    staff
${VALID PASSWORD}    iLoveCP@KKU
${ID1}    60
${D_ID1}    60
${LOGIN PAGE}    http://${SERVER}/authentication/login/?next=/home/
${HOME PAGE}    http://localhost/#/home/
${DOCUMENT TYPES PAGE}    http://localhost/#/documents/document_types/create/
${WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/
${PREVIEW WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/${ID1}/preview/
${CREATE WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/create/
${WORKFLOWS STATES PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/${ID1}/states/
${WORKFLOWS DOCUMENTS PAGE}    http://localhost/#/workflows/workflow_runtime_proxies/${ID1}/documents/
${WORKFLOWS DOCUMENTS INSIDE}    http://localhost/#/documents/documents/${D_ID1}/preview/
${WORKFLOWS DOCUMENTS TRANSITIONS}    http://localhost/#/workflows/documents/${D_ID1}/workflows/
${WORKFLOWS DOCUMENTS SELECT TRANSITIONS}    http://localhost/#/workflows/documents/workflows/${D_ID1}/transitions/select/

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

Go To Document Types Page
    Wait Until Element Is Visible    xpath://a[contains(text(),"ระบบ")]
	Click Element    xpath://a[contains(text(),"ระบบ")]
    Wait Until Element Is Visible    xpath://a[@href="/setup/"]
    Click Element    xpath://a[@href="/setup/"]
    Wait Until Element Is Visible    xpath://a[@href="/documents/document_types/"]
    Click Element    xpath://a[@href="/documents/document_types/"]

Create Document Types
    Wait Until Element Is Visible  id:menu-actions
    Click Element    xpath=//*[@id="menu-actions"]
    Wait Until Element Is Visible    xpath://a[@href="/documents/document_types/create/"]
    Click Element    xpath://a[@href="/documents/document_types/create/"]
    Location Should Be    ${DOCUMENT TYPES PAGE}
    Input Text    id_label    ประเภทเอกสารสำหรับเวิร์กโฟลว์ไอดี=${ID1}
    Click Button    submit
    Wait Until Element Contains    xpath://div[@class="toast-message"]    สร้าง Document type สำเร็จแล้ว
    Location Should Be    ${DOCUMENT TYPES PAGE}
