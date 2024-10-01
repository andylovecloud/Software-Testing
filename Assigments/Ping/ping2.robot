#MY NAME: Tran Huynh An Duy (Andy)

*** Settings ***
Library   OperatingSystem
Library   String
Library   Collections
Library   BuiltIn
Library   String
Library   OperatingSystem
Library    ../../.venv/lib/python3.12/site-packages/SeleniumLibrary/__init__.py


*** Test Cases ***
Read text file to variables and split them
    ${path}=   Set Variable   /Users/Andy_1/Desktop/
    Set Global Variable    ${path}
    ${file}=   Set Variable   webpages.txt
    ${text}=   Get file   ${path}${file}
    @{webList}=   Split string   ${text}
    Set global variable   ${webList}

*** Test Cases ***
Ping Websites
    [Documentation]    Ping each webpage and capture IP and ping time
    Create File    ${path}ping-result.txt
    FOR    ${url}    IN    @{webList}
        ${output}=  Run And Return RC And Output  ping ${url} -c 4    #ping 4 times
        Log    ${output}
        @{WordList}=    Split String    ${output}[1]  
        Log List    ${WordList}
        Append To File    ${path}ping-result.txt    Pinging www:${url}\n    #write the website name to the file


        ${ip}=    Get Index From List   ${WordList}    from     #get the index of the IP address after 'from
        ${ip}=    Evaluate    ${ip} + 1
        Log    ${ip}
        ${webAddress}=    Set Variable   ${WordList}[${ip}]
        ${webAddress}=    Remove String    ${webAddress}    :  
        Append To File    ${path}ping-result.txt    IP address: ${webAddress}\n

        #ping-time-1
        ${ip}=    Evaluate    ${ip}+3        
        ${ping-time}=   Set Variable   ${WordList}[${ip}]
        ${ping-time}=    Remove String    ${ping-time}    time=
        Should Be True    ${ping-time}<50 
        Append To File    ${path}ping-result.txt    Ping Time: ${ping-time}\n

        
        #ping-time-2
        ${ip}=    Get Index From List   ${WordList}    from     ${ip}
        ${ip}=    Evaluate    ${ip}+4
        ${ping-time}=   Set Variable   ${WordList}[${ip}]
        ${ping-time}=    Remove String    ${ping-time}    time=
        Should Be True    ${ping-time}<50 
        Append To File    ${path}ping-result.txt    Ping Time: ${ping-time}\n

        #ping-time-3
        ${ip}=    Get Index From List   ${WordList}    from     ${ip}
        ${ip}=    Evaluate    ${ip}+4
        ${ping-time}=   Set Variable   ${WordList}[${ip}]
        ${ping-time}=    Remove String    ${ping-time}    time=
        Append To File    ${path}ping-result.txt    Ping Time: ${ping-time}\n
        Should Be True    ${ping-time}<50    

        #ping-time-4
        ${ip}=    Get Index From List   ${WordList}    from     ${ip}
        ${ip}=    Evaluate    ${ip}+4
        ${ping-time}=   Set Variable   ${WordList}[${ip}]
        ${ping-time}=    Remove String    ${ping-time}    time=
        Should Be True    ${ping-time}<50 
        Append To File    ${path}ping-result.txt    Ping Time: ${ping-time}\n
    
    #Average ping time
    ${average_ping_time}=   Evaluate    (${ping-time} + ${ping-time} + ${ping-time} + ${ping-time}) / 4

    Append To File    ${path}ping-result.txt    Average ping time: ${average_ping_time}\n\n
         
    END
    

