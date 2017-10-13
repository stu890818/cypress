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
Create A Random Role User
    [Arguments]    ${userName}    ${password}    ${account}    ${pwd}    ${comm}
    Log In    ${userName}    ${password}    ${CYPRESS_QA_API_URL}
    Create A New User    ${account}    ${pwd}    ${account}    ${comm}
    Log Out

Get User SYS Token
    [Arguments]    ${userName}    ${password}
    Log In    ${userName}    ${password}    ${CYPRESS_QA_API_URL}
    Go To Parent List Parent Info Page
    ${sysToken} =     Get Sys Token
    Set Test Variable    ${sysToken}
    Log Out

Get Column Text And Verify Should Be Equal
    [Arguments]    ${line}    ${column}    ${data}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[3]/div[2]/div[2]/div[1]/div/div/table/tbody/${line}/td[${column}]
    Should Be Equal As Strings    ${msg}    ${data}

Get Column Text And Verify Should Be Equal For Player Manage
    [Arguments]    ${line}    ${column}    ${data}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[2]/table/tbody/${line}/td${column}
    Should Be Equal As Strings    ${msg}    ${data}

Open Default Browser
    [Arguments]    ${url}
    Open Browser    ${url}    ${DEFAULT_BROWSER}
    Set Window Size    ${WINDOW_WEIGHT}    ${WINDOW_HEIGHT}

Set Create Random Player Data
    [Arguments]    ${time}
    Set Suite Variable    ${agentPlayerAct}    Player${time}
    Set Suite Variable    ${agentPlayerPwd}    Password${time}
    Set Suite Variable    ${agentPlayerNke}    Nickname${time}

Set Regular Fruit King Info
    Set Suite Variable    ${gameName}    钻石水果王
    Set Suite Variable    ${betMoney}    9.00

Set Regular Get Any Game Link Date
    [Arguments]    ${gameCode}
    Set Suite Variable    ${gameHall}    CQ9
    Set Suite Variable    ${gametech}    html5
    Set Suite Variable    ${gameplat}    mobile
    Set Suite Variable    ${gamecode}    ${gameCode}
    Set Suite Variable    ${gametype}    slot
    Set Suite Variable    ${lang}    zh-cn

# -------- Verify --------
