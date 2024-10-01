*** Settings ***
Library    SeleniumLibrary
Library    ../../.venv/lib/python3.12/site-packages/robot/libraries/String.py


*** Test Cases ***
Facebook register
    Open Browser    http://www.facebook.com/r.php    chrome
    ...    options=add_argument("--disable-search-engine-choice-screen");add_experimental_option("detach", True)
    
    Maximize Browser Window

    Click Element    xpath=/html/body/div[3]/div[2]/div/div/div/div/div[3]/div[2]/div/div[2]/div[1]/div/div[1]/div/span/span

    Page Should Contain    Create a new account    # Check if the page contains the text "Create a new account"

    Click Element    name:firstname                # Click on the first name field
    Input Text    name:firstname    Andy        # Input the text "Andy" in the first name field

    Click Element    name:lastname
    Input Text    name:lastname    Tran

    Click Element    name:reg_email__
    Input Text    name:reg_email__    a.t@d.com

    Click Element    name:reg_passwd__
    Input Password    name:reg_passwd__    123456

    Click Element    id:month
    Select From List By Label    id:month    Feb

    Click Element    id:day
    Select From List By Label    id:day    11
    
    Click Element    id:year
    Select From List By Label    id:year    1990

    Select Radio Button    sex    2            # Select sex option, 1 Female, 2 Male, 3 or -1 Custom

    Set Screenshot Directory    path=/Users/Andy_1/Library/CloudStorage/OneDrive-Hämeenammattikorkeakoulu/HAMK/2nd-Year/Customer-Project/Software-Testing/CA23/RobotFiles    # Set the directory to save the screenshot
    Capture Page Screenshot    filename=facebook_register.png    # Capture the screenshot of the page

    Close Browser

*** Test Cases ***
Ny Times
    Open Browser    https://www.nytimes.com/    chrome
    ...    options=add_argument("--disable-search-engine-choice-screen");add_experimental_option("detach", True)
    
    Sleep  1s
    Maximize Browser Window

    Click Button    xpath=//button[@data-testid='Accept all-btn'] 

    ${count}=    Get Element Count    xpath=/html/body/div[2]/div[2]/div[2]/header/div[4]/nav/ul/li[*]/a
    Log To Console    ${count}

    ${referencePosition}=    Get Vertical Position    xpath=/html/body/div[2]/div[2]/div[2]/header/div[4]/nav/ul/li[1]/a

    FOR    ${index}    IN RANGE    2    ${count}
        Log   ${index}
        ${testPosition}=    Get Vertical Position    xpath=/html/body/div[2]/div[2]/div[2]/header/div[4]/nav/ul/li[${index}]/a

        Should Be Equal    ${referencePosition}    ${testPosition}
    END