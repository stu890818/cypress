*** Keywords ***
# -------- Element --------
Input Agent Account
    [Arguments]    ${account}
    Wait Until Page Contains Element    //*[@id="root"]//div[1]/div/div/input
    Selenium2Library.Input Text    //*[@id="root"]//div[1]/div/div/input    ${account}

Input Agent Account Commission
    [Arguments]    ${comm}
    Wait Until Page Contains Element    //*[@id="root"]//div[5]/div/div/input
    Selenium2Library.Input Text    //*[@id="root"]//div[5]/div/div/input    ${comm}

Input Agent Account Nick Name
    [Arguments]    ${name}
    Wait Until Page Contains Element    //*[@id="root"]//div[3]/div/div/input
    Selenium2Library.Input Text    //*[@id="root"]//div[3]/div/div/input    ${name}

Input Agent Account Password
    [Arguments]    ${pwd}
    Wait Until Page Contains Element    //*[@id="root"]//div[2]/div/div/input
    Selenium2Library.Input Text    //*[@id="root"]//div[2]/div/div/input    ${pwd}

# -------- Keyword --------
Create A New User
    [Arguments]    ${account}    ${pwd}    ${name}    ${comm}
    Input Agent account    ${account}
    Input Agent Account Password    ${pwd}
    Input Agent Account Nick Name    ${name}
    Input Agent Account Commission    ${comm}
    Click 确定 Button

Go To Parent Create Page
    [Arguments]    ${domain}
    Go To    ${domain}/#/parent/create
    Wait Until Keyword Succeeds    2 min    5 sec    Wait Until Element Contains    //*[@id="root"]/div/div[3]/div[2]/div[1]/span[2]    新增代理

Set Random Create Agent Value
    ${random} =    Generate Random String  8  [LETTERS][NUMBERS]
    ${comm} =    Evaluate    random.randint(0,10)    modules=random
    Set Test Variable    ${agentAccount}    qa${random}
    Set Test Variable    ${accountPwd}    ${random}
    Set Test Variable    ${accountName}    ${random}
    Set Test Variable    ${comm}

# -------- Verify --------