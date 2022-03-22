*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}    localhost
${BROWSER}    Firefox
${LOGIN PAGE}    http://localhost/authentication/login/?next=/home/
${HOME PAGE}    http://localhost/#/home/
${CREATE THEME USERNAME}    admin
${CREATE THEME PASSWORD}    QUGaFF9fLE


*** Test Cases ***
Admin Choose Heading Text Font Size Less Than 12
	Set Selenium Speed    0.1
	Open Login Page
	Login To Home Page 
	Go to Create New Theme Page
    Invalid Heading Text Size Less Than 12 

Admin Choose Heading Text Font Size More Than 36 
	Open Login Page
	Login To Home Page 
	Go to Create New Theme Page
    Invalid Heading Text Size More Than 36 



*** Keywords ***
Open Login Page
	Open Browser    ${LOGIN PAGE}    ${BROWSER}
	Location Should Be    ${LOGIN PAGE}
	
Login To Home Page 
	Input Text    username    ${CREATE THEME USERNAME}
	Input Text    password    ${CREATE THEME PASSWORD}
    Click Button    submit
	Location Should Be    ${HOME PAGE}
	
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
	
Invalid Heading Text Size Less Than 12 
    Select Checkbox    name:default
    Input Text    id_label    Invalid Heading Text Size Less Than 12 
    Input Text    id_header_text_brand_size    11
	Click Button    submit
	Page Should Contain    ค่านี้ต้องมากกว่าหรือเท่ากับ 12
	[Teardown]    Close Browser

Invalid Heading Text Size More Than 36
    Select Checkbox    name:default
    Input Text    id_label    Invalid Heading Text Size More Than 36
    Input Text    id_header_text_brand_size    37
	Click Button    submit
	Page Should Contain    ค่านี้ต้องน้อยกว่าหรือเท่ากับ 36
	[Teardown]    Close Browser







	
    
	
