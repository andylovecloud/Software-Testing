
# Test cases:

# 1. Does all product categories have a "landing page" (mandatory)
# 2. Test search feature from main page (search keyword is: ps5) (mandatory)
# ...    robot takes element screenshot from first product
# ...    robot drills down to product page
# ...    robot checks that there is something in product page what matches to keyword what was used in search
# 3. Can you find link "Lisää koriin" from product page (mandatory)
# 4. Can you find icon related to link "Lisää koriin". Robot takes element screenshot from icon. (mandatory)
# 5. Login:
# ...    Create account successfully
# ...    Login successfully after registered
# 6. Test list down products and filter by price after selected sub-categories in Computer tab/page.
# 7. Test from homepage can find the Read more, which navigate to Blog page
# 8. Test comment function in Blog articles (topic), it should require the user input their email and name (bug report)
# 9. Check the Product details price should equal with product search.
# 10. Robot adds product into shopping cart (mandatory)
# 11. Check process checkout, auto-fill the address, and payment method.

*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}    https://shell.hamk.fi/~SampolaP1/wp/
${BROWSER}    Chrome

*** Keywords ***
Open website
    Open Browser    ${URL}    ${BROWSER}
    ...    options=add_argument("--disable-search-engine-choice-screen");add_experimental_option("detach", True)
    Maximize Browser Window
    Sleep    2s

* Test Cases *
# 1. Does all product categories have a "landing page" (MANDATORY)
1. Check All Product Categories Have Landing Page
    Open website
    @{categories}=    Get WebElements    xpath=/html/body/div[2]/header/div[1]/div/div/div/div/div[2]/div/div/div/nav
    ${length}=    Get Length    ${categories}
    FOR    ${i}    IN RANGE    1    ${length}+1
        ${a}=    Get WebElement    xpath=//*[@id="ast-hf-menu-1"]/nav/ul/li[${i}]/a
        ${nav_text}=    Get Text    ${a}
        ${nav_text}=    Convert To Lower Case    ${nav_text}
        Click Element    ${a}
        Run Keyword And Continue On Failure    Page Should Contain    ${nav_text}
        Sleep    2s
        # ${landing_page_text}=    Get Text    //*[@id="jim-main"]/div[2]/div/div[2]/div[2]/h1
        # ${landing_page_text}=    Convert To Lower Case    ${landing_page_text}
        # Run Keyword And Continue On Failure    Should Contain     ${landing_page_text}    ${nav_text}
    END
    # Close Browser
    Sleep    1s

# # 2. Test search feature from main page (search keyword is: ps5) (MANDATORY)
# 2. Test Search Feature From Main Page
#     ${path}=    Set Variable    https://github.com/hiephamk/RobotFrameworkProject
#     Set Screenshot Directory    ${path}
#     Open website
#     Click Element    name:q
#     Input Text    name:q    ps5
#     Press Key    xpath://input[@type='text']    \\13
#     Sleep    1s
#     # Robot takes element screenshot from first product
#     Capture Page Screenshot
#     Sleep    1s
#     # Robot drills down to product page
#     Click Element    //a[@class="js-gtm-product-link"]
#     Sleep    1s
#     # Robot checks if the product name in product page matches to search keyword
#     ${text}=    Get Text    xpath://main
#     Log    ${text}
#     ${text}=    Convert To Lower Case    ${text}
#     Should Contain    ${text}    ps5
#     Sleep    1s

# # 3. Can you find link "Lisää koriin" from product page (MANDATORY)
# 3. Can find link "Lisää koriin" from product page
#     Page Should Contain Link    xpath://a[@title="Lisää koriin"]
#     Sleep    1s

# # 4. Can you find icon related to link "Lisää koriin" (MANDATORY)
# 4. Can you find icon related to link "Lisää koriin". Robot takes element screenshot from icon.
#     Open website
#     Page Should Contain Element    xpath=//a[@title="Lisää koriin"]/span
#     Sleep    1s
#     # Robot takes element screenshot from icon.
#     Capture Element Screenshot    xpath=//a[@title="Lisää koriin"]/span
#     Close Browser

# *** Test Cases ***
# # Test Case 5: Test account creation and login 
# ## 5.1. Account creation
# Test Account Creation
#     [Documentation]    Test account creation and successful login.
#     Click Link    xpath=/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a
#     Click Button    xpath=/html/body/main/div/div[1]/div/div/div/div[2]/input
#     Input Text    id=pf-EmailAddress    test2@abc.com    # Change the email everytime you run the test
#     Input Password    id=pf-Password    123456
#     Input Password    id=pf-ConfirmPassword    123456
#     Input Text    id=pf-FirstName   UserTest
#     Input Text    id=pf-LastName   Abc
#     Input Text    id=pf-Address   Hameenlinna
#     Input Text    id=pf-PostalCode   13100
#     Input Text    id=pf-City    Hameenlinna
#     Input Text    id=pf-Phone    0401234567
#     Scroll Element Into View    xpath=/html/body/main/div/div[2]/div[2]/div/div/div/form/div[8]/div/input
#     Click Element    xpath=/html/body/main/div/div[2]/div[2]/div/div/div/form/div[8]/div/input    #GDPR
#     Scroll Element Into View   xpath=/html/body/main/div/div[2]/div[2]/div/div/div/form/div[9]
#     ${status}=    Run Keyword And Return Status    Click Element  xpath=/html/body/main/div/div[2]/div[2]/div/div/div/form/div[9]
#     Run Keyword If    '${status}' == 'True'    
#      ...  Log    Your account has been created
#      ...  ELSE    Log    Your account has not been created


# *** Test Cases ***
# ## 5.2. Login
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
# # Test Case 6: Test listing and filtering products by price in Computer tab/page
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

# *** Test Cases ***
# # 9. Check if the product details price matches with product search price
# Verify the product details price
#     Open website
#     # Search for product
#     Input Text    id=searchinput     ps5
#     Sleep    1s
#     Press Key    id=searchinput    \\13
#     Sleep    1s

#     # Store the price of the first in-stock product on the search result
#     ${searchPrice} =    Get Text    xpath://html/body/main/div[2]/div/div[2]/div[5]/div/div[3]/product-box/div[2]/div[3]/div/span/span
#     ${searchPrice} =    Remove String    ${searchPrice}    €
#     Log    ${searchPrice}
#     Set Global Variable    ${searchPrice}

#     # Go to the product details page
#     Scroll Element Into View    xpath://html/body/main/div[2]/div/div[2]/div[5]/div/div[3]/product-box/div[2]/div[2]/h5/a
#     Sleep    1s
#     Click Element    xpath://html/body/main/div[2]/div/div[2]/div[5]/div/div[3]/product-box/div[2]/div[2]/h5/a

#     # Store the price of the product
#     ${productPrice} =    Get Text    xpath://html/body/main/div[1]/div[2]/div[1]/jim-product-cta-box/div/div[3]/div[1]/div[1]/span/span/span
#     ${productPrice} =    Remove String    ${productPrice}    €
#     Log    ${productPrice}
#     Set Global Variable    ${productPrice}

#     # Compare the prices
#     Run Keyword And Continue On Failure    Should Be Equal    ${searchPrice}    ${productPrice}

#     Sleep    2s
#     Close Browser

# *** Test Cases ***
# # 10. Robot adds product into shopping cart (MANDATORY)
# Add product to shopping cart
#     Open website
#     # Search for product & go to the product details page
#     Input Text    id=searchinput     ps5
#     Press Key    id=searchinput    \\13
#     Sleep    1s
#     Scroll Element Into View    xpath://html/body/main/div[2]/div/div[2]/div[5]/div/div[3]/product-box/div[2]/div[2]/h5/a
#     Sleep    1s
#     Click Element    xpath://html/body/main/div[2]/div/div[2]/div[5]/div/div[3]/product-box/div[2]/div[2]/h5/a

#     # Add the product to the shopping cart
#     Click Element    xpath://html/body/main/div[1]/div[2]/div[1]/jim-product-cta-box/div/div[3]/div[2]/addto-cart-wrapper/div/a

#     # Check if the product is added to the shopping cart
#     Run Keyword And Continue On Failure    Page Should Contain    Tuote lisätty ostoskoriin
#     Sleep    2s
#     Close Browser

# *** Test Cases ***
# # 11. Check process checkout, auto-fill the address, and verify payment method
# Process checkout
#     Open website
#     # Search & add the product to the shopping cart
#     Input Text    id=searchinput     ps5
#     Press Key    id=searchinput    \\13
#     Sleep    1s
#     Scroll Element Into View    xpath://html/body/main/div[2]/div/div[2]/div[5]/div/div[3]/product-box/div[2]/div[2]/h5/a
#     Sleep    1s
#     Click Element    xpath://html/body/main/div[2]/div/div[2]/div[5]/div/div[3]/product-box/div[2]/div[2]/h5/a
#     Sleep    2s
#     Click Element    xpath://html/body/main/div[1]/div[2]/div[1]/jim-product-cta-box/div/div[3]/div[2]/addto-cart-wrapper/div/a
#     Sleep    1s

#     # Go to the shopping cart & proceed to checkout
#     Click Element    xpath://html/body/header/div/div[3]/jim-cart-dropdown/div/a
#     Scroll Element Into View    xpath://html/body/main/div/div/div/div[2]/div/div[3]/a
#     Sleep    2s
#     Click Element    xpath://html/body/main/div/div/div/div[2]/div/div[3]/a
#     Sleep    1s

#     # Choose to order without account
#     Click Element    xpath://html/body/main/div/div/div/div[1]/div/div/div/div[3]/input
#     Sleep    1s
#     Click Element    xpath://html/body/main/div/div/div/div[2]/div[4]/div/div/form/input[3]
#     Sleep    1s

#     # Fill in the information
#     Input Text    name=FirstName    Katie
#     Sleep    500ms
#     Input Text    name=LastName    Nguyen
#     Sleep    500ms
#     Input Text    name=Address    1234 Street
#     Sleep    500ms
#     Input Text    name=PostalCode    13100
#     Sleep    500ms
#     Input Text    name=City    Hameenlinna
#     Sleep    500ms
#     Input Text    name=EmailAddress    chi123@gmail.com
#     Sleep    500ms
#     Input Text    name=Phone    0412345678
#     Sleep    500ms

#     # Click to accept privacy statement & go to next step
#     Click Element    xpath://html/body/main/div/div[2]/div/div[1]/form/div/div[6]/input
#     Sleep    1s
#     Scroll Element Into View    xpath://html/body/main/div/div[2]/div/div[1]/form/div/input
#     Sleep    1s
#     Click Element    xpath://html/body/main/div/div[2]/div/div[1]/form/div/input
#     Sleep    1s

#     # Choose delivery method
#     Click Element    xpath://html/body/main/div/div[2]/div/div[1]/div/div/div[1]/div/form/ul/li[2]/div/input
#     Sleep    1s
#     Scroll Element Into View    xpath://html/body/main/div/div[2]/div/div[1]/div/div/div[1]/div/form/input[2]
#     Sleep    1s
#     Click Element    xpath://html/body/main/div/div[2]/div/div[1]/div/div/div[1]/div/form/input[2]
#     Sleep    1s

#     # Choose the pick up point
#     Click Element    xpath://html/body/main/div/div[2]/div/div[1]/div/div/div[2]/div/div/form/div[2]/ul/li[4]/div/input
#     Sleep    1s
#     Scroll Element Into View    xpath://html/body/main/div/div[2]/div/div[1]/div/div/div[2]/div/div/form/div[2]/input
#     Sleep    1s
#     Click Element    xpath://html/body/main/div/div[2]/div/div[1]/div/div/div[2]/div/div/form/div[2]/input
#     Sleep    1s

#     # Choose Jim's gift card as the payment method
#     Select Radio Button    PaymentMethodID    JGC
#     Sleep    1s
#     Scroll Element Into View    xpath://html/body/main/div/div[2]/div/div[1]/div/div/div[2]/div/form/input[2]
#     Sleep    1s
#     Click Element    xpath://html/body/main/div/div[2]/div/div[1]/div/div/div[2]/div/form/input[2]
#     Sleep    1s

#     # Enter the gift card code
#     Input Text    id=GiftCardCode    JGC123456789
#     Sleep    1s
#     Input Text    id=GiftCardCheck    123
#     Sleep    1s
#     Click Element    xpath://html/body/main/div/div[2]/div/div[1]/div/div/div[3]/div/div/div/form/div[1]/div[2]/input
#     Sleep    1s

#     # Verify the gift card (must be wrong code)
#     Page Should Contain    Lahjakorttia ei löydy antamallasi tiedoilla
#     Sleep    2s
#     Close Browser