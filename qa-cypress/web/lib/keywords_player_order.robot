*** Keywords ***
# -------- Element --------
Input Player Account
    [Arguments]    ${playerAccount}
    Wait Until Page Contains Element    //*[@id="root"]//div[2]/div/div/form/div[1]/div[2]/div/div/input
    Selenium2Library.Input Text    //*[@id="root"]//div[2]/div/div/form/div[1]/div[2]/div/div/input    ${playerAccount}

# -------- Exo-Keyword --------
Go To Player Order Page
    [Documentation]    Go to player order page
    [Arguments]    ${domain}
    Go To    ${domain}/#/player/order
    Wait Until Element Contains    //*[@id="root"]//div[2]/div[1]/span[2]    注单查询

Search Order With Player Account
    [Arguments]    ${playerAccount}
    Input Player Account    ${playerAccount}
    Click 搜索 Button

# -------- Exo-Verify --------
