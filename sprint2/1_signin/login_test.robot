*** Settings ***
Library    SeleniumLibrary    timeout=3

*** Variables ***
${BROWSER}    Firefox
${LOGIN PAGE}    http://localhost/authentication/login/
${HOME PAGE}    http://localhost/#/home/
${VALID USERNAME}    staff
${VALID PASSWORD}    iLoveCP@KKU
${INVALID USERNAME}    student
${INVALID PASSWORD}    123
${DELAY}    0.2

*** Test Cases ***
Login To Home Page Valid
	Set Selenium Speed    ${DELAY}
    Open Browser   ${LOGIN PAGE}    ${BROWSER}
	Location Should Be    ${LOGIN PAGE}
	Input Text    username    ${VALID USERNAME}
	Input Text    password    ${VALID PASSWORD}
    Click Button    submit
	Location Should Contain    ${HOME PAGE}
    [Teardown]  Close Browser

Login To Home Page Invalid#1
    Open Browser   ${LOGIN PAGE}    ${BROWSER}
	Input Text    username    ${INVALID USERNAME}
	Input Text    password    ${VALID PASSWORD}
    Click Button    submit
	Wait Until Element Contains    xpath://div[@class="alert alert-danger"]    กรุณาใส่ ชื่อผู้ใช้งาน และรหัสผ่านที่ถูกต้อง มีการแยกแยะตัวพิมพ์ใหญ่-เล็ก
	Location Should Be    ${LOGIN PAGE}
    [Teardown]  Close Browser    

Login To Home Page Invalid#2
    Open Browser   ${LOGIN PAGE}    ${BROWSER}
	Input Text    username    ${VALID USERNAME} 
	Input Text    password    ${INVALID PASSWORD}
    Click Button    submit
	Wait Until Element Contains    xpath://div[@class="alert alert-danger"]    กรุณาใส่ ชื่อผู้ใช้งาน และรหัสผ่านที่ถูกต้อง มีการแยกแยะตัวพิมพ์ใหญ่-เล็ก
	Location Should Be    ${LOGIN PAGE}
    [Teardown]  Close Browser  

Login To Home Page Invalid#3
    Open Browser   ${LOGIN PAGE}    ${BROWSER}
	Input Text    username    ${INVALID USERNAME}
	Input Text    password    ${INVALID PASSWORD}
    Click Button    submit
	Wait Until Element Contains    xpath://div[@class="alert alert-danger"]    กรุณาใส่ ชื่อผู้ใช้งาน และรหัสผ่านที่ถูกต้อง มีการแยกแยะตัวพิมพ์ใหญ่-เล็ก
	Location Should Be    ${LOGIN PAGE}
    [Teardown]  Close Browser  

Login To Home Page Empty#1
    Open Browser   ${LOGIN PAGE}    ${BROWSER}
	Input Text    username    ${VALID USERNAME}
    Click Button    submit
	Wait Until Page Contains    คุณจำเป็นต้องกรอกข้อมูลในฟิลด์ "รหัสผ่าน"
	Location Should Be    ${LOGIN PAGE}
    [Teardown]  Close Browser 

Login To Home Page Empty#2
    Open Browser   ${LOGIN PAGE}    ${BROWSER}
	Input Text    password    ${VALID PASSWORD}
    Click Button    submit
	Wait Until Page Contains    คุณจำเป็นต้องกรอกข้อมูลในฟิลด์ "ชื่อผู้ใช้งาน"
	Location Should Be    ${LOGIN PAGE}
    [Teardown]  Close Browser

Login To Home Page Empty#3
    Open Browser   ${LOGIN PAGE}    ${BROWSER}
    Click Button    submit
	Wait Until Page Contains    คุณจำเป็นต้องกรอกข้อมูลในฟิลด์ "ชื่อผู้ใช้งาน"
    Wait Until Page Contains    คุณจำเป็นต้องกรอกข้อมูลในฟิลด์ "รหัสผ่าน"
	Location Should Be    ${LOGIN PAGE}
    [Teardown]  Close Browser 

