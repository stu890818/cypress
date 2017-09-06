*** Keywords ***
# -------- Element --------

# -------- Keyword --------
Go To Login Page
    [Documentation]    Go to login page
    [Arguments]    ${url}
    Go To       ${url}
    Wait Until Page Contains    LOGIN
    Title Should Be    管端后台系统

Log In
    [Arguments]    ${userName}    ${password}    ${url}
    Go To Login Page    ${url}
    Input User Username    ${userName}
    Input User Password    ${password}
    Click 登入 Button
    Wait Until Keyword Succeeds    2 min    5 sec    Wait Until Element Contains    //*[@id="root"]//div[2]/div[1]/span[2]    玩家列表

# -------- Verify --------
