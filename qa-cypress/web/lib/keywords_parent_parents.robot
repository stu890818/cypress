*** Keywords ***
# -------- Element --------


# -------- Keyword --------
Go To Parent Parents Page
    [Documentation]    Go to parent parents page
    [Arguments]    ${domain}
    Go To    ${domain}/#/parent/parents
    Wait Until Keyword Succeeds    2 min    5 sec    Wait Until Element Contains    //*[@id="root"]//div[2]/div[1]/span[2]    代理报表

# -------- Verify --------