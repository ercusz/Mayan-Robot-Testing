*** Settings ***
Library    SeleniumLibrary    timeout=3

*** Variables ***
${SERVER}    localhost
${BROWSER}    Firefox
${LOGIN PAGE}    http://${SERVER}/authentication/login/?next=/home/
${HOME PAGE}    http://localhost/#/home/
${WORKFLOW_MENU}    xpath://a[@aria-controls="collapse-workflows"]
${WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/
${CREATE_WORKFLOW}    xpath://a[@href="/workflows/workflow_templates/create/"]
${CREATE WORKFLOWS PAGE}    http://localhost/#/workflows/workflow_templates/create/
${DELAY}    0.15
${USER_ID}    staff
${USER_PASS}    iLoveCP@KKU

*** Test Cases ***

Create Invalid Workflow #Invalid date #TC001
    Set Delay
    Open Browser    ${HOME PAGE}   ${BROWSER}
    Login as a staff
    Wait Until Element Is Visible  ${WORKFLOW_MENU}
    Double Click Element    ${WORKFLOW_MENU}
    Wait Until Element Is Visible    ${CREATE_WORKFLOW}
    Double Click Element    ${CREATE_WORKFLOW}
    Wait Until Element Is Visible  ${CREATE_WORKFLOW}
    Input Invalid date Workflow Test
    Wait Until Element Contains    xpath://div[@class="alert alert-danger"]              วันเวลาที่เริ่มไม่ควรมากกว่าวันเวลาที่จบ
    [Teardown]  Close Browser

Create Valid Workflow #Valid date #TC002
    Open Browser    ${HOME PAGE}   ${BROWSER}
    Login as a staff
    Wait Until Element Is Visible  ${WORKFLOW_MENU}
    Double Click Element    ${WORKFLOW_MENU}
    Wait Until Element Is Visible    ${CREATE_WORKFLOW}
    Double Click Element    ${CREATE_WORKFLOW}
    Wait Until Element Is Visible  ${CREATE_WORKFLOW}
    Input Workflow Test
    Location Should Contain    ${WORKFLOWS PAGE}
    Wait Until Element Contains    xpath://div[@class="toast-message"]    สร้าง เวิร์กโฟลว์ สำเร็จแล้ว
    [Teardown]  Close Browser

Create Workflow Empty Label #TC003
    Open Browser    ${LOGIN PAGE}    ${BROWSER}
    Login as a staff
    Location Should Contain    ${HOME PAGE}
    Wait Until Element Is Visible  ${WORKFLOW_MENU}
    Double Click Element    ${WORKFLOW_MENU}
    Wait Until Element Is Visible    ${CREATE_WORKFLOW}
    Click Link    ${CREATE_WORKFLOW}
    Location Should Contain    ${CREATE WORKFLOWS PAGE} 
    Input Text    id_label    ${EMPTY}
    Input Text    id_internal_name    workflow2
    Input Workflow Date Test   
    Location Should Contain    ${CREATE WORKFLOWS PAGE}
    Wait Until Element Contains    xpath://div[@class="alert alert-danger"]                คุณจำเป็นต้องกรอกข้อมูลในฟิลด์ "ป้ายกำกับ"
    [Teardown]  Close Browser

Create Workflow Empty Internal #TC004
    Open Browser    ${LOGIN PAGE}    ${BROWSER}
    Login as a staff
    Location Should Contain    ${HOME PAGE}
    Wait Until Element Is Visible  ${WORKFLOW_MENU}
    Double Click Element    ${WORKFLOW_MENU}
    Wait Until Element Is Visible    ${CREATE_WORKFLOW}
    Click Link    ${CREATE_WORKFLOW}
    Location Should Contain    ${CREATE WORKFLOWS PAGE} 
    Input Text    id_label    เวิร์กโฟลว์2
    Input Text    id_internal_name    ${EMPTY}
    Input Workflow Date Test
    Location Should Contain    ${CREATE WORKFLOWS PAGE}
    Wait Until Element Contains    xpath://div[@class="alert alert-danger"]                คุณจำเป็นต้องกรอกข้อมูลในฟิลด์ "Internal name"
    [Teardown]  Close Browser

Create Workflow Empty All #TC005
    Open Browser    ${LOGIN PAGE}    ${BROWSER}
    Login as a staff
    Location Should Contain    ${HOME PAGE}
    Wait Until Element Is Visible  ${WORKFLOW_MENU}
    Double Click Element    ${WORKFLOW_MENU}
    Wait Until Element Is Visible    ${CREATE_WORKFLOW}
    Click Link    ${CREATE_WORKFLOW}
    Location Should Contain    ${CREATE WORKFLOWS PAGE} 
    Input Text    id_label    ${EMPTY}
    Input Text    id_internal_name    ${EMPTY}
    Input Workflow Empty Both Date Test
    Location Should Contain    ${WORKFLOWS PAGE}
    Page Should Contain                คุณจำเป็นต้องกรอกข้อมูลในฟิลด์ "ป้ายกำกับ"
    Page Should Contain                คุณจำเป็นต้องกรอกข้อมูลในฟิลด์ "Internal name"
    [Teardown]  Close Browser

Create Workflow Invalid Internal #TC006
    Open Browser    ${LOGIN PAGE}    ${BROWSER}
    Login as a staff
    Location Should Contain    ${HOME PAGE}
    Wait Until Element Is Visible  ${WORKFLOW_MENU}
    Double Click Element    ${WORKFLOW_MENU}
    Wait Until Element Is Visible    ${CREATE_WORKFLOW}
    Click Link    ${CREATE_WORKFLOW}
    Location Should Contain    ${CREATE WORKFLOWS PAGE} 
    Input Text    id_label    เวิร์กโฟลว์2
    Input Text    id_internal_name    /invalid#
    Input Workflow Date Test
    Location Should Contain    ${CREATE WORKFLOWS PAGE}
    Wait Until Element Contains    xpath://div[@class="alert alert-danger"]                Enter a valid 'internal name' consisting of letters, numbers, and underscores.
    [Teardown]  Close Browser


Create Workflow Empty Start Date #TC007
    Open Browser    ${LOGIN PAGE}    ${BROWSER}
    Login as a staff
    Location Should Contain    ${HOME PAGE}
    Wait Until Element Is Visible  ${WORKFLOW_MENU}
    Double Click Element    ${WORKFLOW_MENU}
    Wait Until Element Is Visible    ${CREATE_WORKFLOW}
    Click Link    ${CREATE_WORKFLOW}
    Location Should Contain    ${CREATE WORKFLOWS PAGE} 
    Input Workflow Empty Start Date Test
    Location Should Contain    ${WORKFLOWS PAGE}
    Wait Until Element Contains    xpath://div[@class="toast-message"]    สร้าง เวิร์กโฟลว์ สำเร็จแล้ว
    [Teardown]  Close Browser

Create Workflow Empty End Date #TC008
    Open Browser    ${LOGIN PAGE}    ${BROWSER}
    Login as a staff
    Location Should Contain    ${HOME PAGE}
    Wait Until Element Is Visible  ${WORKFLOW_MENU}
    Double Click Element    ${WORKFLOW_MENU}
    Wait Until Element Is Visible    ${CREATE_WORKFLOW}
    Click Link    ${CREATE_WORKFLOW}
    Location Should Contain    ${CREATE WORKFLOWS PAGE} 
    Input Workflow Empty End Date Test
    Location Should Contain    ${WORKFLOWS PAGE}
    Wait Until Element Contains    xpath://div[@class="toast-message"]    สร้าง เวิร์กโฟลว์ สำเร็จแล้ว
    [Teardown]  Close Browser

Create Workflow Empty Both Date #TC009
    Open Browser    ${LOGIN PAGE}    ${BROWSER}
    Login as a staff
    Location Should Contain    ${HOME PAGE}
    Wait Until Element Is Visible  ${WORKFLOW_MENU}
    Double Click Element    ${WORKFLOW_MENU}
    Wait Until Element Is Visible    ${CREATE_WORKFLOW}
    Click Link    ${CREATE_WORKFLOW}
    Location Should Contain    ${CREATE WORKFLOWS PAGE} 
    Input Text    id_label    เวิร์กโฟลว์4
    Input Text    id_internal_name    workflow4
    Input Workflow Empty Both Date Test
    Location Should Contain    ${WORKFLOWS PAGE}
    Wait Until Element Contains    xpath://div[@class="toast-message"]    สร้าง เวิร์กโฟลว์ สำเร็จแล้ว
    Get All Links
    [Teardown]  Close Browser

Create Workflow Exist Label #TC010
    Open Browser    ${LOGIN PAGE}    ${BROWSER}
    Login as a staff
    Location Should Contain    ${HOME PAGE}
    Wait Until Element Is Visible  ${WORKFLOW_MENU}
    Double Click Element    ${WORKFLOW_MENU}
    Wait Until Element Is Visible    ${CREATE_WORKFLOW}
    Click Link    ${CREATE_WORKFLOW}
    Location Should Contain    ${CREATE WORKFLOWS PAGE} 
    Input Text    id_label    เวิร์กโฟลว์1
    Input Text    id_internal_name    workflow5
    Input Workflow Date Test
    Location Should Contain    ${WORKFLOWS PAGE}
    Wait Until Element Contains    xpath://div[@class="alert alert-danger"]                เวิร์กโฟลว์ และ ป้ายกำกับ มีอยู่แล้ว
    [Teardown]  Close Browser

Create Workflow Exist Internal #TC011
    Open Browser    ${LOGIN PAGE}    ${BROWSER}
    Login as a staff
    Location Should Contain    ${HOME PAGE}
    Wait Until Element Is Visible  ${WORKFLOW_MENU}
    Double Click Element    ${WORKFLOW_MENU}
    Wait Until Element Is Visible    ${CREATE_WORKFLOW}
    Click Link    ${CREATE_WORKFLOW}
    Location Should Contain    ${CREATE WORKFLOWS PAGE} 
    Input Text    id_label    เวิร์กโฟลว์5
    Input Text    id_internal_name    workflow1
    Input Workflow Date Test
    Location Should Contain    ${WORKFLOWS PAGE}
    Wait Until Element Contains    xpath://div[@class="alert alert-danger"]                เวิร์กโฟลว์ และ Internal name มีอยู่แล้ว
    [Teardown]  Close Browser

Create Workflow Exist Label And Internal #TC012
    Open Browser    ${LOGIN PAGE}    ${BROWSER}
    Login as a staff
    Location Should Contain    ${HOME PAGE}
    Wait Until Element Is Visible  ${WORKFLOW_MENU}
    Double Click Element    ${WORKFLOW_MENU}
    Wait Until Element Is Visible    ${CREATE_WORKFLOW}
    Click Link    ${CREATE_WORKFLOW}
    Location Should Contain    ${CREATE WORKFLOWS PAGE} 
    Input Text    id_label    เวิร์กโฟลว์1
    Input Text    id_internal_name    workflow1
    Input Workflow Date Test
    Location Should Contain    ${WORKFLOWS PAGE}
    Page Should Contain                เวิร์กโฟลว์ และ ป้ายกำกับ มีอยู่แล้ว
    Page Should Contain                เวิร์กโฟลว์ และ Internal name มีอยู่แล้ว
    [Teardown]  Close Browser


*** Keywords ***
Login as a staff
    Wait Until Element Is Visible  class:panel-body
    Input Text    id_username    ${USER_ID}
    Input Text    id_password    ${USER_PASS}
    Click Button    class:btn-primary

Input Workflow Test
    Input Text    id_label    เวิร์กโฟลว์1
    Input Text    id_internal_name    workflow1
    Log    Typing text
    Press Keys    //input[@name="start_datetime_0"]    20/03/2022
    Press Keys    //input[@name="start_datetime_1"]    10:45AM
    Set Focus To Element    //button[@name="submit"]
    Press Keys    //input[@name="end_datetime_0"]    30/03/2022
    Press Keys    //input[@name="end_datetime_1"]    11:59PM
    Log    Text entered
    Click Button    submit
    
Input Invalid date Workflow Test
    Input Text    id_label    เวิร์กโฟลว์1
    Input Text    id_internal_name    workflow1
    Log    Typing text
    Press Keys    //input[@name="start_datetime_0"]    20/03/2022
    Press Keys    //input[@name="start_datetime_1"]    10:45AM
    Set Focus To Element    //button[@name="submit"]
    Press Keys    //input[@name="end_datetime_0"]    10/03/2022
    Press Keys    //input[@name="end_datetime_1"]    11:59PM
    Log    Text entered
    Click Button    submit

Input Workflow Date Test
    Log    Typing text
    Press Keys    //input[@name="start_datetime_0"]    20/03/2022
    Press Keys    //input[@name="start_datetime_1"]    10:45AM
    Set Focus To Element    //button[@name="submit"]
    Press Keys    //input[@name="end_datetime_0"]    30/03/2022
    Press Keys    //input[@name="end_datetime_1"]    11:59PM
    Log    Text entered
    Click Button    submit
    
Input Workflow Empty Start Date Test
    Input Text    id_label    เวิร์กโฟลว์2
    Input Text    id_internal_name    workflow2
    Log    Typing text
    Press Keys    //input[@name="start_datetime_0"]    ${EMPTY}
    Press Keys    //input[@name="start_datetime_1"]    ${EMPTY}
    Set Focus To Element    //button[@name="submit"]
    Press Keys    //input[@name="end_datetime_0"]    30/03/2022
    Press Keys    //input[@name="end_datetime_1"]    11:59PM
    Log    Text entered
    Click Button    submit

Input Workflow Empty End Date Test
    Input Text    id_label    เวิร์กโฟลว์3
    Input Text    id_internal_name    workflow3
    Log    Typing text
    Press Keys    //input[@name="start_datetime_0"]    20/03/2022
    Press Keys    //input[@name="start_datetime_1"]    10:45AM
    Set Focus To Element    //button[@name="submit"]
    Press Keys    //input[@name="end_datetime_0"]    ${EMPTY}
    Press Keys    //input[@name="end_datetime_1"]    ${EMPTY}
    Log    Text entered
    Click Button    submit

Input Workflow Empty Both Date Test
    Log    Typing text
    Press Keys    //input[@name="start_datetime_0"]    ${EMPTY}
    Press Keys    //input[@name="start_datetime_1"]    ${EMPTY}
    Set Focus To Element    //button[@name="submit"]
    Press Keys    //input[@name="end_datetime_0"]    ${EMPTY}
    Press Keys    //input[@name="end_datetime_1"]    ${EMPTY}
    Log    Text entered
    Click Button    submit

Set Delay
    Set Selenium Speed    ${DELAY}