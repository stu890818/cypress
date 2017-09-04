*** Keywords ***
# -------- Element --------

# -------- Exo-Keyword --------
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
    Wait Until Page Contains Element    //*[@id="root"]//aside/div[1]/div[1]/div

# -------- Exo-Verify --------
