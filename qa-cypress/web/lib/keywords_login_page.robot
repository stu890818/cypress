*** Keywords ***
# -------- Element --------

# -------- Keyword --------
Go To Login Page
    [Documentation]    Go to login page
    [Arguments]    ${url}
    Go To       ${url}
    Wait Until Page Contains    管端后台系统
    Title Should Be    管端后台系统

Log In
    [Arguments]    ${userName}    ${password}    ${url}    ${tittle}
    Go To Login Page    ${url}
    Input User Username    ${userName}
    Input User Password    ${password}
    Click 登入 Button
    Wait Until Keyword Succeeds    2 min    5 sec    Wait Until Element Contains    //*[@id="app"]/*/div[2]/div[2]/div/div[1]    ${tittle}

# -------- Verify --------
