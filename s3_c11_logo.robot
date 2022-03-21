*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    edge
${VALID USERNAME_1}    admin
${VALID PASSWORD_1}    4TuNQjWBvG
${VALID USERNAME_2}    staff2
${VALID USERNAME_2}    CSKKU112
${LOGIN PAGE}    http://localhost:8000/authentication/login/?next=/home/
${HOME PAGE}    http://localhost:8000/#/home/
${CREATE NEW THEME PAGE}    http://localhost:8000/#/appearance/themes/create/
${THEME PAGE}    http://localhost:8000/#/appearance/themes/

*** Test Cases ***
Set Delay
    Set Selenium Speed    0.3

Open Login Page
	Open Browser    ${LOGIN PAGE}    ${BROWSER}
	Location Should Be    ${LOGIN PAGE}

Login To Home Page
	Input Text    username    ${VALID USERNAME_1}
	Input Text    password    ${VALID PASSWORD_1}
    Click Button    submit
	Location Should Contain    ${HOME PAGE}

Go to Create New Theme Page
	Wait Until Element Is Visible    xpath://a[@href="#"]
	Click Link    xpath://a[@href="#"]
	Wait Until Element Is Visible    xpath://a[@href="/setup/"]
	Click Link    xpath://a[@href="/setup/"]
	Wait Until Element Is Visible    xpath://a[@href="/appearance/themes/"]
	Click Link    xpath://a[@href="/appearance/themes/"]
	Wait Until Element Is Visible  xpath=//*[@id="menu-actions"]
    Click Element    xpath=//*[@id="menu-actions"]
	Wait Until Element Is Visible    xpath://a[@href="/appearance/themes/create/"]
	Click Link    xpath://a[@href="/appearance/themes/create/"]
	Location Should Be    ${CREATE NEW THEME PAGE}

Create Theme (Change Logo)
	Input Text    id_label    Robot Logo Test9
	Click Element    xpath=//input[@type="checkbox"]
	Checkbox Should Be Selected    xpath=//input[@type="checkbox"]
	Choose File    id=id_logo_file    D:\\sinua.jpg
	Click Button    submit
	Page Should Contain    Theme created successfully.
	Location Should Be    ${THEME PAGE} 

Editing Logo 
    Wait Until Element Is Visible    xpath://a[@href="/appearance/themes/9/edit/"]
    Click Element    xpath://a[@href="/appearance/themes/9/edit/"]
    Click Button    submit
    Page Should Contain    Theme updated successfully.
    Location Should Be    ${THEME PAGE}

Delete Logo
    Wait Until Element Is Visible    xpath://a[@href="/appearance/themes/9/delete/"]
    Click Element    xpath://a[@href="/appearance/themes/9/delete/"]
    Click Button    submit
    Page Should Contain    Theme deleted successfully.
    Location Should Be    ${THEME PAGE}
    
