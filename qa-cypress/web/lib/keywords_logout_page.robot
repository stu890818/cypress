*** Keywords ***
# -------- Element --------

# -------- Keyword --------
Log Out
    [Documentation]    log out page
    Wait Until Page Contains Element    //*[@id="root"]//button[2]
    Click Element    //*[@id="root"]//button[2]
    Wait Until Page Contains    LOGIN
    Title Should Be    管端后台系统

# -------- Verify --------
