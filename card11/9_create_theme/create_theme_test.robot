*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME}     admin
${PASSWORD}   QUGaFF9fLE
${USER_USERNAME}     user
${USER_PASSWORD}   iLoveCP@KKU
${BROWSER}    Firefox
${HOME PAGE}    http://localhost/#/home/
${CREATE NEW THEME PAGE}    http://localhost/#/appearance/themes/create/
${THEME PAGE}    http://localhost/#/appearance/themes/
${EDIT THEME}    xpath://a[@href="/appearance/themes/${ID}/edit/"]
${DELAY}    0.3
${ID}    23


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
    Input Font Header Test
    Input Text    id_header_text_brand    Dobby
    Input Text    id_header_text_brand_size    25
    Input Theme Test
    Wait Until Element Is Visible    xpath://div[@class="toast-message"]
    Element Text Should Be    xpath://div[@class="toast-message"]  สร้าง ธีม สำเร็จแล้ว
    Location Should Be    ${THEME PAGE} 
    [Teardown]  Close Browser

Create Invalid Label Theme #T02
    Open Browser    ${HOME PAGE}   ${BROWSER}
    Login as a admin
    Go to Create New Theme Page
    Location Should Be    ${CREATE NEW THEME PAGE}
    Select Checkbox    name:default
    Input Text    id_label    Theme Test
    Input Logo Test
    Input Font Test
    Input Font Header Test
    Input Text    id_header_text_brand    Dobby
    Input Text    id_header_text_brand_size    25
    Click Button    submit
    Set Focus To Element    xpath://*[@id="id_label"]
    Page Should Contain    ธีม และ ป้ายกำกับ มีอยู่แล้ว
    Page Should Contain    สร้างธีมใหม่ 
    [Teardown]  Close Browser

Edit Theme #T03
    Open Browser    ${THEME PAGE}   ${BROWSER}
    Login as a admin
    Wait Until Element Is Visible    ${EDIT THEME}
    Click Link    ${EDIT THEME}
    Page Should Contain    แก้ไขธีม
    Input Text    id_label    Edit Theme Test
    Input Edit Logo Test
    Input Edit Font Test
    Input Edit Header Font Test
    Input Text    id_header_text_brand    ด๊อบบี้มาแว้วววว
    Input Text    id_header_text_brand_size    36
    Input Edit Theme Test
    Wait Until Element Is Visible    xpath://div[@class="toast-message"]
    Element Text Should Be    xpath://div[@class="toast-message"]  อัปเดต ธีม สำเร็จแล้ว
    Location Should Be    ${THEME PAGE} 
    [Teardown]  Close Browser

User sees the theme admin has changed
    Set Delay
    Open Browser    ${HOME PAGE}   ${BROWSER}
    Login as a user
    Input User Theme Test
    [Teardown]    Close Browser

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
	Choose File    id=id_logo_file    ${EXECDIR}${/}\\resource\\hogwarts.png

Input Font Test
	Checkbox Should Be Selected    xpath=//input[@type="checkbox"]
	Choose File    id=id_font_file    ${EXECDIR}${/}\\resource\\Taviraj-Regular.ttf

Input Font Header Test
	Checkbox Should Be Selected    xpath=//input[@type="checkbox"]
	Choose File    id=id_font_header_file    ${EXECDIR}${/}\\resource\\TA16BIT-Regular.ttf

Input Invalid Font Test
	Checkbox Should Be Selected    xpath=//input[@type="checkbox"]
	Choose File    id=id_font_file    ${EXECDIR}${/}\\resource\\hogwarts.png

Input Invalid Font Header Test
	Checkbox Should Be Selected    xpath=//input[@type="checkbox"]
	Choose File    id=id_font_file    ${EXECDIR}${/}\\resource\\dobby_pwned.txt

Login as a user
    Wait Until Element Is Visible  class:panel-body
    Input Text    id_username    ${USER_USERNAME}
    Input Text    id_password    ${USER_PASSWORD}
    Click Button    submit
	Location Should Be    ${HOME PAGE}

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

Input User Theme Test
    ${test_color_header_bg}=   Execute Javascript  return window.getComputedStyle(document.querySelector(".navbar"), null).getPropertyValue('background-color');
    Should Be Equal As Strings    rgb(74, 124, 89)    ${test_color_header_bg}
    ${test_color_header_text}=   Execute Javascript  return window.getComputedStyle(document.querySelector(".navbar a"), null).getPropertyValue('color');
    Should Be Equal As Strings    rgb(254, 254, 254)    ${test_color_header_text}
    ${test_color_body_bg}=   Execute Javascript  return window.getComputedStyle(document.querySelector("body"), null).getPropertyValue('background-color');
    Should Be Equal As Strings    rgb(136, 212, 152)    ${test_color_body_bg}
    ${test_color_body_text}=   Execute Javascript  return window.getComputedStyle(document.querySelector("body"), null).getPropertyValue('color');
    Should Be Equal As Strings    rgb(13, 12, 12)    ${test_color_body_text}
    ${test_color_body_block}=   Execute Javascript  return window.getComputedStyle(document.querySelector(".center-block"), null).getPropertyValue('background-color');
    Should Be Equal As Strings    rgb(200, 213, 185)    ${test_color_body_block}
    ${test_color_body_primary_btn}=   Execute Javascript  return window.getComputedStyle(document.querySelector(".btn-primary"), null).getPropertyValue('background-color');
    Should Be Equal As Strings    rgb(53, 70, 73)    ${test_color_body_primary_btn}
    ${test_color_lpanel_bg}=   Execute Javascript  return window.getComputedStyle(document.querySelector("#menu-main"), null).getPropertyValue('background-color');
    Should Be Equal As Strings    rgb(143, 192, 169)    ${test_color_lpanel_bg}
    ${test_color_lpanel_collapse_btn_bg}=   Execute Javascript  return window.getComputedStyle(document.querySelector(".panel.panel-default"), null).getPropertyValue('background-color');
    Should Be Equal As Strings    rgb(80, 81, 79)    ${test_color_lpanel_collapse_btn_bg}
    ${test_color_lpanel_collapse_btn_text}=   Execute Javascript  return window.getComputedStyle(document.querySelector("#accordion-sidebar > .panel > div > h4 > a"), null).getPropertyValue('color');
    Should Be Equal As Strings    rgb(245, 244, 244)    ${test_color_lpanel_collapse_btn_text}
    ${test_color_lpanel_collapsed_panel_bg}=   Execute Javascript  return window.getComputedStyle(document.querySelector("#accordion-sidebar .panel-body"), null).getPropertyValue('background-color');
    Should Be Equal As Strings    rgb(129, 178, 154)    ${test_color_lpanel_collapsed_panel_bg}
    ${test_color_rnav_panelex_bg}=   Execute Javascript  return window.getComputedStyle(document.querySelector(".dropdown-menu, .dropdown-menu li a"), null).getPropertyValue('background-color');
    Should Be Equal As Strings    rgb(59, 96, 100)    ${test_color_rnav_panelex_bg}
    ${test_color_rnav_panelex_text}=   Execute Javascript  return window.getComputedStyle(document.querySelector(".dropdown-menu > li > a"), null).getPropertyValue('color');
    Should Be Equal As Strings    rgb(255, 245, 245)    ${test_color_rnav_panelex_text}

Input Edit Logo Test
    Checkbox Should Be Selected    xpath=//input[@type="checkbox"]
    Choose File    id=id_logo_file    ${EXECDIR}${/}\\resource\\dobby.png

Input Edit Font Test
    Checkbox Should Be Selected    xpath=//input[@type="checkbox"]
    Choose File    id=id_font_file    ${EXECDIR}${/}\\resource\\TA16BIT-Regular.ttf

Input Edit Header Font Test
    Checkbox Should Be Selected    xpath=//input[@type="checkbox"]
    Choose File    id=id_font_header_file    ${EXECDIR}${/}\\resource\\SOV_wang.ttf

Input Edit Theme Test
    Wait Until Element Is Visible 	xpath://*[@id="id_header_bg"]
    Set Focus To Element    xpath://*[@id="id_body_link_hover"]
    Execute Javascript    document.getElementById("id_body_bg").value = "#88D498"
    Set Focus To Element    //button[@name="submit"]
    Click Button    submit

Set Delay
    Set Selenium Speed    ${DELAY}