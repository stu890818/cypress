*** Keywords ***
# -------- Element --------

# -------- Keyword --------
Go To Report Finance Page
    [Documentation]    Go to report finance page
    [Arguments]    ${domain}
    Go To    ${domain}/#/report/finance
    Wait Until Keyword Succeeds    2 min    5 sec    Wait Until Element Contains    //*[@id="root"]//div[2]/div[1]/span[2]    代理财务报表

# -------- Verify --------