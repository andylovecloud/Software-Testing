# *** Settings ***
# Library    SeleniumLibrary
# Library    String
# Library    ../../.venv/lib/python3.12/site-packages/robot/libraries/OperatingSystem.py
# Library    ../../.venv/lib/python3.12/site-packages/robot/libraries/XML.py


# *** Test Cases ***
# # Jimms website
# #     Open Browser   http://jimms.fi/  chrome
# #     ...    options=add_argument("--disable-search-engine-choice-screen");add_experimental_option("detach", True)
    

# *** Variables ***
# ${URL}    http://jimms.fi
# ${BROWSER}    Chrome

# *** Keywords ***
# Open website
#     Open Browser    ${URL}    ${BROWSER}
#     ...    options=add_argument("--disable-search-engine-choice-screen");add_experimental_option("detach", True)
#     Maximize Browser Window
#     Sleep    2s





# # Test Case 6: Test account creation and login 
# #     # 6.1. Account creation
# # Test Account Creation
# #     [Documentation]    Test account creation and successful login.
# #     Click Link    xpath=/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a
# #     Click Button    xpath=/html/body/main/div/div[1]/div/div/div/div[2]/input
# #     Input Text    id=pf-EmailAddress    test2@abc.com    # Change the email everytime you run the test
# #     Input Password    id=pf-Password    123456
# #     Input Password    id=pf-ConfirmPassword    123456
# #     Input Text    id=pf-FirstName   UserTest
# #     Input Text    id=pf-LastName   Abc
# #     Input Text    id=pf-Address   Hameenlinna
# #     Input Text    id=pf-PostalCode   13100
# #     Input Text    id=pf-City    Hameenlinna
# #     Input Text    id=pf-Phone    0401234567
# #     Scroll Element Into View    xpath=/html/body/main/div/div[2]/div[2]/div/div/div/form/div[8]/div/input
# #     Click Element    xpath=/html/body/main/div/div[2]/div[2]/div/div/div/form/div[8]/div/input    #GDPR
# #     Scroll Element Into View   xpath=/html/body/main/div/div[2]/div[2]/div/div/div/form/div[9]
# #     ${status}=    Run Keyword And Return Status    Click Element  xpath=/html/body/main/div/div[2]/div[2]/div/div/div/form/div[9]
# #     Run Keyword If    '${status}' == 'True'    
# #      ...  Log    Your account has been created
# #      ...  ELSE    Log    Your account has not been created


# *** Test Cases ***
# #     # 6.2. Login
# Test Account Login
#    Open website
#    Click Link    xpath=/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a
#    Page Should Contain Element     xpath=/html/body/main/div/div[1]/div/div/div/div[1]/input
#    Log    message
#    Input Text    id=l-UserName    test@abc.com
#    Input Password    id=l-Password    123456
#    ${status}=    Run Keyword And Return Status    Click Button    css:input[type='submit'] 
#    Run Keyword If    '${status}' == 'True'    
#    ...    Log    Account login successful
#    ...    ELSE    Log    Account login failed
    
#     ${output}=    Get Text   xpath=/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a/span
#     Run Keyword If    '${output}' == 'Test'    
#     ...   Log    Account login successful
#     ...   ELSE    Log    Account login failed

# # *** Test Cases ***
# # Test Case 7: Test listing and filtering products by price in Computer tab/page
# Filter Products By Price In Computer Tab
#     [Documentation]    Test listing and filtering products by price in the Computer tab/page.
#     Open website
#     Click Link    xpath=/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]/a
#     Click Link    xpath=/html/body/main/div[2]/div/div[1]/filtermenu/div/div[2]/div[1]/div/div[2]/div/ul/li[1]/div/div/a
#     Input Text    xpath=/html/body/main/div[2]/div/div[1]/filtermenu/div/div[2]/div[3]/div[2]/div[2]/div/div[1]/div/div[1]/div/input   100
#     Input Text    xpath=/html/body/main/div[2]/div/div[1]/filtermenu/div/div[2]/div[3]/div[2]/div[2]/div/div[1]/div/div[3]/div/input    500
#     ${maxprice} =    Get value    xpath=/html/body/main/div[2]/div/div[1]/filtermenu/div/div[2]/div[3]/div[2]/div[2]/div/div[1]/div/div[3]/div/input 
#     Log    ${maxprice}
#     Press Key    xpath=/html/body/main/div[2]/div/div[1]/filtermenu/div/div[2]/div[3]/div[2]/div[2]/div/div[1]/div/div[3]/div/input    \\13    # Enter key
#     Sleep    1s
#     ${filterPrice}=   Get Text    xpath://div[@class='product-list--filter-box__items']        
#     ${filterPrice}=    Remove String   ${filterPrice}    c    lose    <    €        # Remove unwanted characters
#     Log    ${filterPrice}
#     Run Keyword If  ${filterPrice} == ${maxprice} 
#     ...    Log    Filtered products by price successfully
#     ...    ELSE    Log    Filtered products by price failed


   