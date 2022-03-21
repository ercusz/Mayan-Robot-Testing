*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME}     user
${PASSWORD}   iLoveCP@KKU
${BROWSER}    Firefox
${HOME PAGE}    http://localhost/#/home/
${SET UP PAGE}    http://localhost/#/setup/
${DELAY}    0.2

*** Test Cases ***
#User can't change theme
	
User Can Not Change Theme
    Set Delay
    Open Browser    ${HOME PAGE}   ${BROWSER}
    Login as a admin
    Wait Until Element Is Visible    xpath://a[@href="#"]
    Click Link    xpath://div[@id="navbar"]/ul/li/a
    Wait Until Element Is Visible    xpath://a[@href="/setup/"]
    Click Link    xpath://a[@href="/setup/"]
    Wait Until Element Is Visible    id:content-title
    Element Should Not Be Visible    xpath://a[@href="/appearance/themes/"]
    Location Should Be    ${SET UP PAGE}
    [Teardown]  Close Browser

*** Keywords ***
Login as a admin
    Wait Until Element Is Visible  class:panel-body
    Input Text    id_username    ${USERNAME}
    Input Text    id_password    ${PASSWORD}
    Click Button    class:btn-primary

Set Delay
    Set Selenium Speed    ${DELAY}

