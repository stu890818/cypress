*** Keywords ***
# -------- Element --------

# -------- Keyword --------
Log Out
    [Documentation]    log out page
    Go To    ${CYPRESS_QA_URL}/#/logout
    Wait Until Page Contains    管端后台系统
    Title Should Be    管端后台系统

# -------- Verify --------
