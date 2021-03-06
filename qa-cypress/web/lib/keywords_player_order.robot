*** Keywords ***
# -------- Element --------

# -------- Keyword --------
Go To Player Order Page
    [Documentation]    Go to player order page
    [Arguments]    ${domain}
    Go To    ${domain}/#/player/order
    Wait Until Keyword Succeeds    2 min    5 sec    Wait Until Element Contains    //*[@id="root"]//div[2]/div[1]/span[2]    注单查询

Search Order With Player Account
    [Arguments]    ${playerAccount}
    Input Player Account    ${playerAccount}
    Click 搜索 Button

# -------- Verify --------
