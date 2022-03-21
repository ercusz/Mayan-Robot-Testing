*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME}     admin
${PASSWORD}   QUGaFF9fLE
${BROWSER}    Firefox
${HOME PAGE}    http://localhost/#/home/
${CREATE NEW THEME PAGE}    http://localhost/#/appearance/themes/create/
${THEME PAGE}    http://localhost/#/appearance/themes/
${EDIT THEME}    xpath://a[@href="/appearance/themes/${ID}/edit/"]
${DELAY}    0.2
${ID}    1


*** Test Cases ***
#Admin can create and edit theme

Create Theme #T01
    Set Delay
    Open Browser    ${HOME PAGE}   ${BROWSER}
    Login as a admin
    Go to Create New Theme Page
    Location Should Be    ${CREATE NEW THEME PAGE}
    Select Checkbox    name:default
    Input Text    id_label    Theme Test
    Input Logo Test
    Input Font Test
    Input Theme Test
    Page Should Contain    สร้าง ธีม สำเร็จแล้ว
    Location Should Be    ${THEME PAGE} 
    [Teardown]  Close Browser

Create Invalid Label Theme #T02
    Set Delay
    Open Browser    ${HOME PAGE}   ${BROWSER}
    Login as a admin
    Go to Create New Theme Page
    Location Should Be    ${CREATE NEW THEME PAGE}
    Select Checkbox    name:default
    Input Text    id_label    Theme Test
    Input Logo Test
    Input Font Test
    Input Theme Test
    Set Focus To Element    xpath://*[@id="id_label"]
    Page Should Contain    ธีม และ ป้ายกำกับ มีอยู่แล้ว
    Page Should Contain    สร้างธีมใหม่ 
    [Teardown]  Close Browser

Edit Theme  #T03
    Set Delay
    Open Browser    ${THEME PAGE}   ${BROWSER}
    Login as a admin
    Wait Until Element Is Visible    ${EDIT THEME}
    Click Link    ${EDIT THEME}
    Page Should Contain    แก้ไขธีม
    Input Text    id_label    Edit Theme Test
    Input Edit Logo Test
    Input Edit Font Test
    Input Edit Theme Test
    Page Should Contain    อัปเดต ธีม สำเร็จแล้ว
    Location Should Be    ${THEME PAGE} 

Delete Theme 
    Set Delay
    Open Browser    ${THEME PAGE}   ${BROWSER}
    Login as a admin
    Wait Until Element Is Visible    xpath://a[@href="/appearance/themes/${ID}/delete/"]
    Click Element    xpath://a[@href="/appearance/themes/${ID}/delete/"]
    Wait Until Element Is Visible    id:content-title
    Click Element    xpath://button[@class="btn btn-danger"]
    Page Should Contain    ลบ ธีม สำเร็จแล้ว
    Location Should Be    ${THEME PAGE}
    [Teardown]  Close Browser

*** Keywords ***
Login as a admin
    Wait Until Element Is Visible  class:panel-body
    Input Text    id_username    ${USERNAME}
    Input Text    id_password    ${PASSWORD}
    Click Button    class:btn-primary

Go to Create New Theme Page
    Wait Until Element Is Visible    xpath://a[@href="#"]
    Click Link    xpath://div[@id="navbar"]/ul/li/a
    Wait Until Element Is Visible    xpath://a[@href="/setup/"]
    Click Link    xpath://a[@href="/setup/"]
    Wait Until Element Is Visible    xpath://a[@href="/appearance/themes/"]
    Click Link    xpath://a[@href="/appearance/themes/"]
    Wait Until Element Is Visible  xpath=//*[@id="menu-actions"]
    Click Element    xpath=//*[@id="menu-actions"]
    Wait Until Element Is Visible    xpath://a[@href="/appearance/themes/create/"]
    Click Link    xpath://a[@href="/appearance/themes/create/"]

Input Logo Test
	Checkbox Should Be Selected    xpath=//input[@type="checkbox"]
	Choose File    id=id_logo_file    C:\\Users\\Windows\\Desktop\\MayanG1S2\\dobby.png 

Input Font Test
	Checkbox Should Be Selected    xpath=//input[@type="checkbox"]
	Choose File    id=id_font_file    C:\\Users\\Windows\\Desktop\\MayanG1S2\\Roboto-Black.ttf

Input Theme Test
    Wait Until Element Is Visible 	xpath://*[@id="id_header_bg"]
    Execute Javascript    document.getElementById("id_header_bg").value = "#4A7C59"
    Set Focus To Element    xpath://*[@id="id_body_primary_btn"]

    Execute Javascript    document.getElementById("id_header_text").value = "#FEFEFE"
    Execute Javascript    document.getElementById("id_body_bg").value = "#FAF3DD"
    Execute Javascript    document.getElementById("id_body_text").value = "#0D0C0C"

    Execute Javascript    document.getElementById("id_body_link_hover").value = "#1A936F"
    Execute Javascript    document.getElementById("id_body_block").value = "#C8D5B9"
    Set Focus To Element    xpath://*[@id="id_lpanel_collapse_btn_bg_hover"]

    Execute Javascript    document.getElementById("id_body_primary_btn").value = "#354649"
    Execute Javascript    document.getElementById("id_lpanel_bg").value = "#8FC0A9"
    Execute Javascript    document.getElementById("id_lpanel_collapse_btn_bg").value = "#50514F"
    Execute Javascript    document.getElementById("id_lpanel_collapse_btn_text").value = "#F5F4F4"
    Execute Javascript    document.getElementById("id_lpanel_collapse_btn_bg_hover").value = "#000000"
    Set Focus To Element    xpath://*[@id="id_rnav_bg_hover"]

    Execute Javascript    document.getElementById("id_lpanel_collapse_btn_text_hover").value = "#F3E9D2"
    Execute Javascript    document.getElementById("id_lpanel_collapsed_panel_bg").value = "#81B29A"
    Execute Javascript    document.getElementById("id_lpanel_collapsed_btn_text").value = "#FFFFFF"
    Execute Javascript    document.getElementById("id_lpanel_collapsed_btn_bg_hover").value = "#1A936F"
    Execute Javascript    document.getElementById("id_rnav_bg_hover").value = "#68B0AB"
    Set Focus To Element    xpath://*[@id="id_rnav_ex_text_hover"]

    Execute Javascript    document.getElementById("id_rnav_text_hover").value = "#000000"
    Execute Javascript    document.getElementById("id_rnav_panelex_bg").value = "#3B6064"
    Execute Javascript    document.getElementById("id_rnav_panelex_text").value = "#FFF5F5"
    Execute Javascript    document.getElementById("id_rnav_ex_bg_hover").value = "#000000"
    Execute Javascript    document.getElementById("id_rnav_ex_text_hover").value = "#88D498"
    Click Button    submit

Input Edit Logo Test
    Checkbox Should Be Selected    xpath=//input[@type="checkbox"]
    Choose File    id=id_logo_file    C:\\Users\\Windows\\Desktop\\MayanG1S2\\dobby.png

Input Edit Font Test
    Checkbox Should Be Selected    xpath=//input[@type="checkbox"]
    Choose File    id=id_font_file    C:\\Users\\Windows\\Desktop\\MayanG1S2\\Roboto-Light.ttf

Input Edit Theme Test
    Wait Until Element Is Visible 	xpath://*[@id="id_header_bg"]
    Set Focus To Element    xpath://*[@id="id_body_link_hover"]
    Execute Javascript    document.getElementById("id_body_bg").value = "#88D498"
    Set Focus To Element    //button[@name="submit"]
    Click Button    submit

Set Delay
    Set Selenium Speed    ${DELAY}

