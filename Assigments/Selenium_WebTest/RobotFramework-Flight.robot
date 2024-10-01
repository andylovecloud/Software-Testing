#MY NAME: Tran Huynh An Duy (Andy)

*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}     http://blazedemo.com/
${BROWSER}    Chrome

*** Keywords ***
Open website
    Open Browser    ${URL}    ${BROWSER}
    ...    options=add_argument("--disable-search-engine-choice-screen");add_experimental_option("detach", True)
    Maximize Browser Window
    Sleep    2s

*** Test Cases ***
Test input page
    #2.Test that the page says "Welcome to the Simple Travel Agency!"
    Open website
    Page Should Contain    Welcome to the Simple Travel Agency!        # Check if the page contains the text "Welcome to the Simple Travel Agency!"

    # 3. Select "Boston" as the starting city (store this information in the variable)
    ${departureCity}=    Set Variable    Boston   # Get the selected departure city
    Select From List By Value      xpath://select[@name='fromPort']  Boston       # Select the departure city Boston
    Set global variable    ${departureCity}    Boston
    

    # 4. Select "Cairo" as the destination (store this information in the variable)
    ${arrivalCity}=    Set Variable    Cairo   # Get the selected arrival city
    Select From List by Value      xpath://select[@name='toPort']    Cairo        # Select the departure city Boston
    set global variable    ${arrivalCity}    Cairo

    # 5. Check that the Find Flights button is selectable
    ${FindflightButton}=    Get Element Attribute    xpath:/html/body/div[3]/form/div/input  disabled
    Log   ${FindflightButton}
    Run Keyword If    ${FindflightButton}=='false' or ${FindflightButton} is None    

    # 6.Press the Find Flights button
    ...    Click Button    css:input[type='submit']    

*** Test Cases ***
Test flight selection
    # 7. Check that the page says Flights from Boston to Cairo: (check the city names with the variables you created)
    Page Should Contain    Flights from  ${departureCity} to ${arrivalCity}:

    # 8. Check that you have at least one flight choice visible
    Page Should Contain Element   //table[@class='table']//tr[1]    # Check if the table contains the flight information

    # 9. Select one of the flights -> store the price, number and airline of that flight in separate variables
    ${flightNumber}=    Get Text    xpath://html/body/div[2]/table/tbody/tr[1]/td[2]
    ${airFlight}=    Get Text    xpath:/html/body/div[2]/table/tbody/tr[1]/td[3]
    ${price}=    Get Text    xpath:/html/body/div[2]/table/tbody/tr[1]/td[6]

    Click Button    css:input[type='submit']

    #10. On the page that opens, check that the price, airline, and flight number of the trip you stored in the variables can be found on the page (note that here you need to slightly change the information you export to the variable (String library (?))
    Page Should Contain Element   xpath:/html/body/div[2]/p[1]    # Check if the page contains the flight information
    Page Should Contain Element    xpath:/html/body/div[2]/p[2]    # Check if the page contains the flight information
    

    #11. Store the total price of the flight in a new variable
    ${TotalPrice}=    Get Text    xpath:/html/body/div[2]/p[5]/em
    Set Global V ariable    ${TotalPrice}   

*** Test Cases ***
Auto fill the form
    #12. Fill in the passenger information on the form (set the month and year of the card as global variables)
    Click Element    name:inputName
    Input Text    name:inputName    Duy Tran

    Click Element    name:address
    Input Text    name:address    Visamaentie 23

    Click Element    name:city
    Input Text    name:city    Hameenlinna

    Click Element    name:state
    Input Text    name:state    Finland

    Click Element    name:zipCode
    Input Text    name:zipCode    13100

    #13. Choose Diner's Club as your credit card
    Click Element    id:cardType
    Select From List By Value    id:cardType       dinersclub
    
    Click Element    name:creditCardNumber
    Input Text    name:creditCardNumber    1234567890123456

    Click Element    id:creditCardMonth
    Input Text    name:creditCardMonth    11
    # ${creditCardMonth}=    Get Variable Value    name:creditCardMonth
    Set Global Variable   ${creditCardMonth}    11

    Click Element    id:creditCardYear
    Input Text    name:creditCardYear    2026
    Set Global Variable   ${creditCardYear}    2026    

    Click Element    id:nameOnCard
    Input Text    id:nameOnCard       Duy Tran

    #14.Click "Remember me" checkbox
    Click Element    id:rememberMe
    Select Checkbox  xpath://input[@id='rememberMe']    # Select the checkbox
    
    #15. Click "Purchase Flight"
    Click Button    xpath=/html/body/div[2]/form/div[11]/div/input

    #16. Check that the page says "Thank you for your purchase today!"
    Page Should Contain    Thank you for your purchase today!    

     Sleep  2s

*** Test Cases ***
Check expiration time in credit card
    #Expected: The expiration time is incorrect
    #17. Check that the expiration time is correct
    ${ExpirationTime}=    Get Text    xpath:/html/body/div[2]/div/table/tbody/tr[5]/td[2]
    Log    ${ExpirationTime} ${creditCardMonth}/${creditCardYear}
    Run Keyword If    ${creditCardMonth}/${creditCardYear}==${ExpirationTime}    
    ...    Log    The expiration time is correct
    ...    ELSE    Log    The expiration time is incorrect
    
*** Test Cases ***
Check total price  
    #Expected: The total price is incorrect
    #18. Check that the total price is correct (should be equal with the variable you stored in previous step)
    ${TotalPrice2}=    Get Text    xpath:/html/body/div[2]/div/table/tbody/tr[3]/td[2]
    ${TotalPrice2}=   Remove String    ${TotalPrice2}   USD  
    Log    Total Price 1: ${TotalPrice} Total Price 2: ${TotalPrice2}  

    Run Keyword If    ${TotalPrice}==${TotalPrice2}
    ...    Log    The total price is correct
    ...    ELSE    Log    The total price is incorrectAs

    Sleep  3s

    #19. Close the browser
    Close Browser
