*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${USER_ID}     staff
${USER_PASS}   iLoveCP@KKU
${BROWSER}    Firefox
${ID1}    64
${URL_BACHELOR}   /workflows/workflow_templates/1/preview/
${CREATE_TRANSITION}    xpath://div[2]/a[@href="/workflows/workflow_templates/${ID1}/transitions/create/"]
${TRANSITION}    xpath://li/a[@href="/workflows/workflow_templates/${ID1}/transitions/"]
${STATE}    http://localhost/#/workflows/workflow_templates/${ID1}/states/
${LOCATION_TRANSITION}    http://localhost/#/workflows/workflow_templates/${ID1}/transitions/
${CREATE_NEXT_TRANSITION}    xpath://li[13]/a[@href="/workflows/workflow_templates/${ID1}/transitions/create/"]


*** Test Case ***

Create Transitions 
    Set Delay
    Open Browser    ${STATE}   ${BROWSER}
    Login as a admin
    Wait Until Element Is Visible  id:sidebar
    Click Link    ${TRANSITION}
    Wait Until Element Is Visible  ${CREATE_TRANSITION}
    Click Link    ${CREATE_TRANSITION}
    Create Transitions Test
    Location Should Contain    ${LOCATION_TRANSITION}
    Element Text Should Be    xpath://div[@class="toast-message"]    สร้าง Workflow transition สำเร็จแล้ว
    [Teardown]  Close Browser

Create Next Transitions 
    Set Delay
    Open Browser    ${LOCATION_TRANSITION}   ${BROWSER}
    Login as a admin
    Wait Until Element Is Visible  id:menu-actions
    Click Element    xpath=//*[@id="menu-actions"]
    Wait Until Element Is Visible  ${CREATE_NEXT_TRANSITION}
    Click Link    ${CREATE_NEXT_TRANSITION}
    Create Next Transitions Test
    Element Text Should Be    xpath://div[@class="toast-message"]    สร้าง Workflow transition สำเร็จแล้ว
    [Teardown]  Close Browser

*** Keywords ***
Login as a admin
    Wait Until Element Is Visible  class:panel-body
    Input Text    id_username    ${USER_ID}
    Input Text    id_password    ${USER_PASS}
    Click Button    class:btn-primary

Set Delay
    Set Selenium Speed    0.3

Create Transitions Test
    Wait Until Element Is Visible  id:id_label
    Input Text    id_label    เส้นทางถัดไป
    Click Element    xpath=//select[@id="id_origin_state"]
    Select From List by Index    xpath=//select[@id="id_origin_state"]    1
    Select From List by Index  xpath=//select[@name="destination_state"]    2
    Input Text    id_condition_template    คอมเมนต์ทดสอบเส้นเชื่อมต่อ
    Click Button    submit

Create Next Transitions Test
    Wait Until Element Is Visible  id:id_label
    Input Text    id_label    เส้นทางกลับ
    Click Element    xpath=//select[@id="id_origin_state"]
    Select From List by Index    xpath=//select[@id="id_origin_state"]    2
    Select From List by Index  xpath=//select[@name="destination_state"]    1
    Input Text    id_condition_template    คอมเมนต์ทดสอบเส้นเชื่อมต่ออีกครั้ง
    Click Button    submit