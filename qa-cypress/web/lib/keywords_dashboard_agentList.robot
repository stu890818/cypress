*** Keywords ***
# -------- Element --------


# -------- Keyword --------
Go To Parent List Parent Info Page
    [Documentation]    Go to parent list parent info page
    Go To    ${CYPRESS_QA_URL}/#/Dashboard/AccMgmt
    Wait Until Keyword Succeeds    2 min    5 sec    Wait Until Element Contains    //*[@id="app"]/div/div[2]/div[2]/div/div[1]    个人帐户管理

Get Sys Token
    [Documentation]    Get sys token
    Wait Until Page Contains Element    //*[@id="app"]//div[2]/div[2]//div[2]//div[2]/div[1]/div/div/div/div[1]/div[1]
    Mouse Over    //*[@id="app"]//div[2]/div[2]//div[2]//div[2]//div[2]/div/div[1]//i
    ${token} =    Selenium2Library.Get Text    //*[@id="app"]//div[2]/div[2]//div[2]//div[2]//div[2]/div/div[1]//i
    [Return]    ${token}

# -------- Verify --------
