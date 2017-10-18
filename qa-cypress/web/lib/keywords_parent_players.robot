*** Keywords ***
# -------- Element --------

# -------- Keyword --------
Go To Parent Players Page
    [Arguments]    ${domain}
    Go To    ${domain}/#/parent/players
    Wait Until Keyword Succeeds    2 min    5 sec    Wait Until Element Contains    //*[@id="root"]//div[2]/div[1]/span[2]    代理玩家报表

Search Player Report With Player Account
    [Arguments]    ${playerAccount}
    Input Player Account    ${playerAccount}
    Click 搜索 Button

# -------- Verify --------
Verify The CS Exist In The Customer Service List
    [Arguments]    ${csAccount}
    Wait Until Page Contains Element    //a[contains(.,'${csAccount}')]
    Page Should Contain Element    //a[contains(.,'${csAccount}')]
