*** Keywords ***
# -------- Element --------
Click ${text} Button
    Click Button    ${text}

Input Player Account
    [Arguments]    ${playerAccount}
    Wait Until Page Contains Element    //*[@id="root"]//div[2]/div/div/form/div[1]/div[2]/div/div/input
    Selenium2Library.Input Text    //*[@id="root"]//div[2]/div/div/form/div[1]/div[2]/div/div/input    ${playerAccount}

Input User Password
    [Arguments]    ${password}
    Wait Until Page Contains Element    //*[@placeholder="密码"]
    Selenium2Library.Input Text    //*[@placeholder="密码"]    ${password}

Input User Username
    [Arguments]    ${email}
    Wait Until Page Contains Element    //*[@placeholder="帐号"]
    Selenium2Library.Input Text    //*[@placeholder="帐号"]    ${email}

# -------- Keyword --------
Get Column Text And Verify Should Be Equal
    [Arguments]    ${line}    ${column}    ${data}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[3]/div[2]/div[2]/div[1]/div/div/table/tbody/${line}/td[${column}]
    Should Be Equal As Strings    ${msg}    ${data}

Open Default Browser
    [Arguments]    ${url}
    Open Browser    ${url}    ${DEFAULT_BROWSER}
    Set Window Size    ${WINDOW_WEIGHT}    ${WINDOW_HEIGHT}

# -------- Verify --------
