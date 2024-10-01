*** Settings ***
Library   OperatingSystem
Library   String
Library   Collections
Library   BuiltIn
Library   String
Library   OperatingSystem


*** Test Cases ***
Read text file to variables and split them
    ${path}=   Set Variable   /Users/Andy_1/Desktop/
    ${file}=   Set Variable   webpages.txt
    ${text}=   Get file   ${path}${file}
    @{webList}=   Split string   ${text}
    Set global variable   ${webList}

*** Test Cases ***
Ping Websites
    [Documentation]    Ping each webpage and capture IP and ping time
    FOR    ${url}    IN    @{webList}
        ${output}=  Run And Return RC And Output  ping ${url} -c 4
        @{WordList}=    Split String    ${output} from  # Split the output from the word 'from'
            Log List    ${WordList}
        ${ip}=    Get From List   ${WordList}   9  # Get the IP address from the list
            Log    ${ip}
        ${PingTime}=    Get From List   ${WordList}    11  # Get the ping time from the list
            Log    ${PingTime}
        ${newIP}=    Remove String    ${ip}    :  # Remove the ':' from the IP address
            Log    ${newIP}
        
        @{PingTimelist}=    Split String    ${output} ttl=  # Split the output from the word 'ttl='
        Log List    ${PingTimelist}
        ${total_ping_time}=    Evaluate    sum([float(x.split('time=')[1].split(' ')[0]) for x in @{PingTimeList} if 'time=' in x])
        ${average_ping_time}=   Evaluate    ${total_ping_time} / 4
        Log    Average Ping Time: ${average_ping_time}        
      
        ${result_item}=    Create List  Pinging www:${url}    IP address:${newip}   Average Ping Time: ${average_ping_time}
      
        ${output_string}=    Catenate    SEPARATOR=\n   ${result_item}\n
        ${path}=   Set Variable   /Users/Andy_1/Desktop/
        Append To File    ${path}ping-result.txt    ${output_string}\n
    END
