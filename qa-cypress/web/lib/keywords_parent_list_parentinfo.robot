*** Keywords ***
# -------- Element --------


# -------- Keyword --------
Go To Parent List Parent Info Page
    [Documentation]    Go to parent list parent info page
    [Arguments]    ${domain}
    Wait Until Page Contains Element    //*[@id="root"]//aside/div[1]/div[1]/div/span
    Click Element    //*[@id="root"]//aside/div[1]/div[1]/div/span
    Wait Until Keyword Succeeds    2 min    5 sec    Wait Until Element Contains    //*[@id="root"]//div[2]/div/div[1]/div/div[1]/label    币别

Get Agent Sys Token
    [Arguments]
    Wait Until Page Contains Element    //*[@id="root"]//div[2]/label
    Mouse Over    //*[@id="root"]//div/div[1]/div/div[2]/div/div/span
    ${token} =    Selenium2Library.Get Text    //*[@id="root"]/div/div[3]/div[2]/div[2]/div[2]/div[2]/div/div[1]/div/div[2]/div/div/textarea
    [Return]    ${token}

# -------- Verify --------
