*** Keywords ***
# -------- Element --------
Input Agent Account
    [Arguments]    ${account}
    Wait Until Page Contains Element    //*[@id="app"]//div[1]/div[1]//input
    Selenium2Library.Input Text    //*[@id="app"]//div[1]/div[1]//input    ${account}

Input Agent Account Commission
    [Arguments]    ${comm}
    Wait Until Page Contains Element    //*[@id="app"]//div[5]//input
    Selenium2Library.Input Text    //*[@id="app"]//div[5]//input    ${comm}

Input Agent Account Nick Name
    [Arguments]    ${name}
    Wait Until Page Contains Element    //*[@id="app"]//div[3]/div/input
    Selenium2Library.Input Text    //*[@id="app"]//div[3]/div/input    ${name}

Input Agent Account Password
    [Arguments]    ${pwd}
    Wait Until Page Contains Element    //*[@id="app"]/div//div[1]/div[2]//input
    Selenium2Library.Input Text    //*[@id="app"]/div//div[1]/div[2]//input    ${pwd}

# -------- Keyword --------
Create A New User
    [Arguments]    ${account}    ${pwd}    ${name}    ${comm}
    Input Agent account    ${account}
    Input Agent Account Password    ${pwd}
    Input Agent Account Nick Name    ${name}
    Input Agent Account Commission    ${comm}
    Click 确定 Button

Go To Parent Create Page
    Go To    ${CYPRESS_QA_URL}/#/Dashboard/createAgetn
    Wait Until Keyword Succeeds    2 min    5 sec    Wait Until Element Contains    //*[@id="app"]/*/div[2]/div[2]/div/div[1]    新增代理

Set Random Create Agent Value
    ${random} =    Generate Random String  8  [LETTERS][NUMBERS]
    ${comm} =    Evaluate    random.randint(0,10)    modules=random
    Set Test Variable    ${agentAccount}    qa${random}
    Set Test Variable    ${accountPwd}    ${random}
    Set Test Variable    ${accountName}    ${random}
    Set Test Variable    ${comm}

# -------- Verify --------
Verify Show Create New Role Sneak Bar Is Success
    Wait Until Element Is Visible    //*[contains(.,'成功')]
    Wait Until Keyword Succeeds    2 min    5 sec    Wait Until Element Is Not Visible    //*[contains(.,'成功')]
