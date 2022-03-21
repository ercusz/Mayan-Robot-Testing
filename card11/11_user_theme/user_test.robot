*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}    localhost
${BROWSER}    Firefox
${LOGIN PAGE}    http://localhost/authentication/login/?next=/home/
${HOME PAGE}    http://localhost/#/home/
${USERNAME}    user
${PASSWORD}    iLoveCP@KKU

*** Test Cases ***
User sees the theme admin has changed
    Set Selenium Speed    0.1
    Open Browser    ${HOME PAGE}   ${BROWSER}
    Login as a user
    Input User Theme Test
    [Teardown]    Close Browser
    

*** Keywords ***
Login as a user
    Wait Until Element Is Visible  class:panel-body
    Input Text    id_username    ${USERNAME}
    Input Text    id_password    ${PASSWORD}
    Click Button    submit
	Location Should Be    ${HOME PAGE}

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

   

   
 
    
    
    
