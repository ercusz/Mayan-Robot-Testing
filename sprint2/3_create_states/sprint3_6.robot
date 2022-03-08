*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${USER_ID}     staff
${USER_PASS}   iLoveCP@KKU
${BROWSER}    Firefox
${CREATE_FIRST_STATE}    xpath://div[2]/a[@href="/workflows/workflow_templates/97/states/create/"]
${CREATE_NEXT_STATE}    xpath://li[13]/a[@href="/workflows/workflow_templates/97/states/create/"]
${URL_BROWSER}    http://localhost/#/workflows/workflow_templates/97/states/

*** Test Case ***

#Invalid date ของ state ที่ 1
Create Invalid First States 
    Open Browser    ${URL_BROWSER}   ${BROWSER}
    Login as a admin
    Wait Until Element Is Visible  id:menu-actions
    Click Element    xpath=//*[@id="menu-actions"]
    Wait Until Element Is Visible  ${CREATE_FIRST_STATE}
    Click Link    ${CREATE_FIRST_STATE}
    Select Checkbox    name:initial
    Input Text    id_label    ทดสอบ First states
    Click Element    id:id_start_datetime_0
    Create Invalid State Test
    Element Text Should Be    xpath://div[@class="alert alert-danger"]              วันเวลาที่เริ่มไม่ควรมากกว่าวันเวลาที่จบ
    [Teardown]  Close Browser

#Valid date ของ state ที่ 1
Create Valid First States 
    Open Browser    ${URL_BROWSER}   ${BROWSER}
    Login as a admin
    Wait Until Element Is Visible  id:menu-actions
    Click Element    xpath=//*[@id="menu-actions"]
    Wait Until Element Is Visible  ${CREATE_FIRST_STATE}
    Click Link    ${CREATE_FIRST_STATE}
    Select Checkbox    name:initial
    Input Text    id_label    ทดสอบ First states
    Click Element    id:id_start_datetime_0
    Create Valid State Test
    Location Should Contain    ${URL_BROWSER}
    Element Text Should Be    xpath://div[@class="toast-message"]  สร้าง สถานะของเวิร์กโฟลว์ สำเร็จแล้ว
    [Teardown]  Close Browser

#Invalid date ของ state ที่ 2
Create Invalid Next States 
    Open Browser    ${URL_BROWSER}   ${BROWSER}
    Login as a admin
    Wait Until Element Is Visible  id:menu-actions
    Click Element    xpath=//*[@id="menu-actions"]
    Wait Until Element Is Visible  ${CREATE_NEXT_STATE}
    Click Link    ${CREATE_NEXT_STATE}
    Input Text    id_label    ทดสอบ Next states
    Click Element    id:id_start_datetime_0
    Create Invalid State Test
    Element Text Should Be    xpath://div[@class="alert alert-danger"]              วันเวลาที่เริ่มไม่ควรมากกว่าวันเวลาที่จบ
    [Teardown]  Close Browser

#Valid date ของ state ที่ 2
Create Valid Next States 
    Open Browser    ${URL_BROWSER}   ${BROWSER}
    Login as a admin
    Wait Until Element Is Visible  id:menu-actions
    Click Element    xpath=//*[@id="menu-actions"]
    Wait Until Element Is Visible  ${CREATE_NEXT_STATE}
    Click Link    ${CREATE_NEXT_STATE}
    Input Text    id_label    ทดสอบ Next states
    Click Element    id:id_start_datetime_0
    Create Valid State Test
    Location Should Contain    ${URL_BROWSER}
    Element Text Should Be    xpath://div[@class="toast-message"]  สร้าง สถานะของเวิร์กโฟลว์ สำเร็จแล้ว
    [Teardown]  Close Browser

*** Keywords ***
Login as a admin
    Wait Until Element Is Visible  class:panel-body
    Input Text    id_username    ${USER_ID}
    Input Text    id_password    ${USER_PASS}
    Click Button    class:btn-primary

Create Valid State Test
    Log    Typing text
    Press Keys    //input[@name="start_datetime_0"]    03/20/2022
    Set Focus To Element    //button[@name="submit"]
    Press Keys    //input[@name="start_datetime_1"]    10:45AM
    Press Keys    //input[@name="end_datetime_0"]    03/30/2022
    Press Keys    //input[@name="end_datetime_1"]    11:59PM
    Log    Text entered
    Click Button    submit

Create Invalid State Test
    Log    Typing text
    Press Keys    //input[@name="start_datetime_0"]    03/20/2022
    Set Focus To Element    //button[@name="submit"]
    Press Keys    //input[@name="start_datetime_1"]    10:45AM
    Press Keys    //input[@name="end_datetime_0"]    03/10/2022
    Press Keys    //input[@name="end_datetime_1"]    11:59PM
    Log    Text entered
    Click Button    submit