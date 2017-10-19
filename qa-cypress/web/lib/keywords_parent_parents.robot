*** Keywords ***
# -------- Element --------
Admin Input General Agent Account
    [Arguments]    ${generalAct}
    Wait Until Page Contains Element    //*[@id="root"]//div[1]/div/div/input
    Selenium2Library.Input Text    //*[@id="root"]//div[1]/div/div/input    ${generalAct}

Admin Agent Account
    [Arguments]    ${agentAct}
    Wait Until Page Contains Element    //*[@id="root"]//div[2]/div/div/input
    Selenium2Library.Input Text    //*[@id="root"]//div[2]/div/div/input    ${agentAct}

# -------- Keyword --------
Go To Parent Parents Page
    [Documentation]    Go to parent parents page
    [Arguments]    ${domain}
    Go To    ${domain}/#/parent/parents
    Wait Until Keyword Succeeds    2 min    5 sec    Wait Until Element Contains    //*[@id="root"]//div[2]/div[1]/span[2]    代理报表

Admin Search Agent Report
    [Arguments]    ${generalAct}    ${agentAct}
    Admin Input General Agent Account    ${generalAct}
    Admin Agent Account    ${agentAct}
    Click 搜索 Button

# -------- Verify --------