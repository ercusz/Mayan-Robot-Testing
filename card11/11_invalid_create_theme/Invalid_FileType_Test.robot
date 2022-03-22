*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}    localhost
${BROWSER}    Firefox
${LOGIN PAGE}    http://localhost/authentication/login/?next=/home/
${HOME PAGE}    http://localhost/#/home/
${CREATE NEW THEME PAGE}    http://localhost/#/appearance/themes/create/
${THEME PAGE}    http://localhost/#/appearance/themes/
${CREATE THEME USERNAME}    admin
${CREATE THEME PASSWORD}    QUGaFF9fLE


*** Test Cases ***
Admin Upload Invalid Logo File Type
	Set Selenium Speed    0.1
	Open Login Page
	Login To Home Page 
	Go to Create New Theme Page
    Input Invalid Logo File Type Test

Admin Upload Invalid Font File Type
	Open Login Page
	Login To Home Page 
	Go to Create New Theme Page
    Input Invalid Font File Type Test

Admin Upload Invalid Font Header File Type
	Open Login Page
	Login To Home Page 
	Go to Create New Theme Page
    Input Invalid Font Header File Type Test


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
	
Input Invalid Logo File Type Test
    Select Checkbox    name:default
    Input Text    id_label    Invalid Logo File Type Test 
    Choose File    id=id_logo_file    D:\\SE\\Srisakdi-Regular.ttf
	Click Button    submit
	Page Should Contain    อัพโหลดรูปที่ถูกต้อง. ไฟล์ที่อัพโหลดไปไม่ใช่รูป หรือรูปเสียหาย.
	[Teardown]    Close Browser

Input Invalid Font File Type Test
    Select Checkbox    name:default
    Input Text    id_label    Invalid Font File Type Test 
    Choose File    id=id_font_file    D:\\SE\\kku.png
	Click Button    submit
	Page Should Contain    File extension 'png' is not allowed. Allowed extensions are: 'woff2, woff, ttf, otf'.
	[Teardown]    Close Browser

Input Invalid Font Header File Type Test
    Select Checkbox    name:default
    Input Text    id_label    Invalid Font Header File Type Test 
    Choose File    id=id_font_header_file    D:\\SE\\kku.png
	Click Button    submit
	Page Should Contain    File extension 'png' is not allowed. Allowed extensions are: 'woff2, woff, ttf, otf'.
	[Teardown]    Close Browser





	
    
	
