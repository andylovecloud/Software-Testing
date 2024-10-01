*** Settings ***
Library    String
Library    ../../.venv/lib/python3.12/site-packages/robot/libraries/Dialogs.py
Library    Dialogs
Library    Collections


*** Variables ***
${one}    Donald
${two}    Duck

*** Test Cases ***
Check outcome
    ${three}=    Set Variable    Donald Duck
    Should Be Equal   ${three}  ${one} ${two}

***Test Cases***
Ask User Input
    ${User}=    Get Value From User    Please input your  text
    Should Be Equal   ${User}    Hello World

*Variables*    
@{list}    1    2    3    4

*** Test Cases ***
Check value from list
    ${number}=    Set Variable    ${list}[2]
    Should Be Equal   ${number}    3

*** Test Cases ***
Add values to list
    ${addition}=    Set Variable    333
    Append To List    ${list}    ${addition}
    Log To Console    ${list}[4]    333

*** Settings ***
Library    OperatingSystem

*** Test Cases ***
Make new directory
    Create Directory    /Users/Andy_1/Library/CloudStorage/OneDrive-Hämeenammattikorkeakoulu/HAMK/2nd-Year/Customer-Project/Software-Testing/CA23/RobotFiles/TestCreateFolder
    Directory Should Exist    path=/Users/Andy_1/Library/CloudStorage/OneDrive-Hämeenammattikorkeakoulu/HAMK/2nd-Year/Customer-Project/Software-Testing/CA23/RobotFiles/TestCreateFolder

*** Test Cases ***
Create new txt filename
    ${path}=    Set Variable    /Users/Andy_1/Library/CloudStorage/OneDrive-Hämeenammattikorkeakoulu/HAMK/2nd-Year/Customer-Project/Software-Testing/CA23/RobotFiles/TestCreateFolder/
    Create File   ${path}example.text    Hi, we must be having fun!
    File Should Exist   ${path}example.text
    File Should Not Be Empty    ${path}example.text

*** Test Cases ***
Delete file and folder
    ${path}=    Set Variable    /Users/Andy_1/Library/CloudStorage/OneDrive-Hämeenammattikorkeakoulu/HAMK/2nd-Year/Customer-Project/Software-Testing/CA23/RobotFiles/TestCreateFolder
    Remove File    ${path}example.text
    Directory Should Be Empty    ${path}
    ${variable}=    Set Variable    /Users/Andy_1/Library/CloudStorage/OneDrive-Hämeenammattikorkeakoulu/HAMK/2nd-Year/Customer-Project/Software-Testing/CA23/RobotFiles/TestCreateFolder
    Remove Directory    ${variable}TestCreateFolder