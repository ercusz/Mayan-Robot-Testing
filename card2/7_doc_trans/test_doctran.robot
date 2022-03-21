*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Firefox
${SERVER}    localhost
${VALID USERNAME}    staff
${VALID PASSWORD}    iLoveCP@KKU
${ID1}    5
${D_ID1}    8
${LABEL1}    เวิร์กโฟลว์1
${LOGIN PAGE}    http://${SERVER}/authentication/login/?next=/home/
${HOME PAGE}    http://localhost/#/home/
${DOCUMENT TYPES PAGE}    http://localhost/#/documents/document_types/
${DOCUMENT TYPES CREATE}    http://localhost/#/documents/document_types/create/
${WORKFLOWS DOCUMENT TYPES}    http://localhost/#/workflows/workflow_templates/${ID1}/document_types/
${WORKFLOWS TEMPLATE PAGE}    http://localhost/#/workflows/workflow_templates/
${DOCUMENT UPLOAD PAGE}    http://localhost/#/sources/documents/create/from/local/multiple/
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

# Go To Document Types Page
#     Wait Until Element Is Visible    xpath://a[contains(text(),"ระบบ")]
# 	Click Element    xpath://a[contains(text(),"ระบบ")]
#     Wait Until Element Is Visible    xpath://a[@href="/setup/"]
#     Click Element    xpath://a[@href="/setup/"]
#     Wait Until Element Is Visible    xpath://a[@href="/documents/document_types/"]
#     Click Element    xpath://a[@href="/documents/document_types/"]

# Create Document Types
#     Wait Until Element Is Visible  id:menu-actions
#     Click Element    xpath=//*[@id="menu-actions"]
#     Wait Until Element Is Visible    xpath://a[@href="/documents/document_types/create/"]
#     Click Element    xpath://a[@href="/documents/document_types/create/"]
#     Location Should Be    ${DOCUMENT TYPES CREATE}
#     Input Text    id_label    ประเภทเอกสารสำหรับเวิร์กโฟลว์ไอดี=${ID1}
#     Click Button    submit
#     Wait Until Element Contains    xpath://div[@class="toast-message"]    สร้าง Document type สำเร็จแล้ว
#     Location Should Be    ${DOCUMENT TYPES PAGE}

Add New Document
    Wait Until Element Is Visible    xpath://a[@aria-controls="collapse-documents"]
    Double Click Element    xpath://a[@aria-controls="collapse-documents"]
    Wait Until Element Is Visible    xpath://a[@href="/sources/documents/create/from/local/multiple/"]
    Double Click Element    xpath://a[@href="/sources/documents/create/from/local/multiple/"]
    Location Should Be    ${DOCUMENT UPLOAD PAGE}
    Wait Until Element Is Visible    xpath://span[@class="select2-selection select2-selection--single"]
    Click Element    xpath://span[@class="select2-selection select2-selection--single"]
    Wait Until Element Is Visible    xpath://li[contains(text(), "${LABEL1}")]
    Click Element    xpath://li[contains(text(), "${LABEL1}")]
    Wait Until Element Is Visible    xpath://button[@class="btn btn-primary btn-hotkey-default"]
    Click Button    xpath://button[@class="btn btn-primary btn-hotkey-default"]
    Wait Until Element Is Visible    xpath://button[@class="dz-button"]
    Click Element    xpath://button[@class="dz-button"]
    Wait Until Element Contains    xpath://div[@class="toast-message"]    New document queued for upload and will be available shortly.    30s

Go To Workflow Document Page
    Wait Until Element Is Visible    xpath://a[@aria-controls="collapse-workflows"]
    Double Click Element    xpath://a[@aria-controls="collapse-workflows"]
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_runtime_proxies/"]
    Double Click Element    xpath://a[@href="/workflows/workflow_runtime_proxies/"]
    Wait Until Element Is Visible    xpath://a[@href="/workflows/workflow_runtime_proxies/${ID1}/documents/"]
    Click Element    xpath://a[@href="/workflows/workflow_runtime_proxies/${ID1}/documents/"]
    Wait Until Element Is Visible    xpath://a[@href="/documents/documents/${D_ID1}/preview/"]
    Click Element    xpath://a[@href="/documents/documents/${D_ID1}/preview/"]
    Wait Until Element Is Visible    xpath://a[@href="/workflows/documents/${D_ID1}/workflows/"]
    Click Element    xpath://a[@href="/workflows/documents/${D_ID1}/workflows/"]
    Wait Until Element Is Visible    xpath://a[contains(text(),"Transition")]
    Click Element    xpath://a[contains(text(),"Transition")]

Choose Transitions
    Wait Until Element Is Visible    xpath=//select[@id="id_transition"]
    Click Element    xpath=//select[@id="id_transition"]
    Select From List By Index    xpath=//select[@id="id_transition"]    1
    Click Button    submit
    Wait Until Element Is Visible    xpath=//textarea[@name="comment"]
    Click Element    xpath=//textarea[@name="comment"]
    Wait Until Element Is Visible    xpath://button[@class="btn btn-primary btn-hotkey-default"]
    Click Button    xpath://button[@class="btn btn-primary btn-hotkey-default"]
    [Teardown]  Close Browser