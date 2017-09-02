*** Keywords ***
# -------- Element --------
Input Seq Number
    [Arguments]    ${seqNo}
    Wait Until Page Contains Element    //*[@id="root"]//input
    Selenium2Library.Input Text    //*[@id="root"]//input    ${seqNo}

# -------- Exo-Keyword --------
Go To Player History Page
    [Arguments]    ${domain}
    Go To    ${domain}/#/player/historyDetail
    Wait Until Element Contains    //*[@id="root"]/div/div[3]/div[2]/div[1]/span[2]    CQ9 游戏纪录细单

Search Seq Number
    [Arguments]    ${seqNo}
    Input Seq Number    ${seqNo}
    Click 搜寻 Button

# -------- Exo-Verify --------
Verify Should Show The Correct Base Game Infos
    [Arguments]    ${bet}    ${win}    ${winLine}
    Wait Until Page Contains Element    //*[@id="root"]//div[5]/div/div[2]/div[1]
    Element Text Should Be    //*[@id="root"]//div[5]/div/div[2]/div[1]    押注：${bet}
    Wait Until Page Contains Element    //*[@id="root"]//div[5]/div/div[2]/div[2]
    Element Text Should Be    //*[@id="root"]//div[5]/div/div[2]/div[2]    派彩：${win}
    Wait Until Page Contains Element    //*[@id="root"]//div[5]/div/div[2]/div[4]
    Element Text Should Be    //*[@id="root"]//div[5]/div/div[2]/div[4]    赢线数目：${winLine}

Verify Should Show The Correct Agent Account
    [Arguments]    ${generalAgentAccount}
    Wait Until Page Contains Element    //*[@id="root"]//span[4]/span
    Element Text Should Be    //*[@id="root"]//span[4]/span    ${generalAgentAccount}

Verify Should Show The Correct Round Detail Money
    [Arguments]    ${bet}    ${win}
    Wait Until Page Contains Element    //*[@id="root"]/div//div[3]/div[2]/div[3]
    Wait Until Page Contains Element    //*[@id="root"]//div[3]/div[3]/div[3]
    Element Text Should Be    //*[@id="root"]/div//div[3]/div[2]/div[3]    ${bet}
    Element Text Should Be    //*[@id="root"]//div[3]/div[3]/div[3]    ${win}

Verify Should Show The Correct Player Account
    [Arguments]    ${playerAccount}
    Wait Until Page Contains Element    //*[@id="root"]//span[3]/span
    Element Text Should Be    //*[@id="root"]//span[3]/span    ${playerAccount}

Verify Should Show The Correct Round Detail Operation
    Wait Until Page Contains Element    //*[@id="root"]/div//div[2]/div[3]/div[2]/div[2]
    Wait Until Page Contains Element    //*[@id="root"]/div//div[3]/div[3]/div[2]
    Element Text Should Be    //*[@id="root"]/div//div[2]/div[3]/div[2]/div[2]    bet
    Element Text Should Be    //*[@id="root"]/div//div[3]/div[3]/div[2]    win

Verify Should Show The Correct Single Number
    [Arguments]    ${number}
    Wait Until Element Contains    //*[@id="root"]//div/div[2]/div[2]/div[1]/span[1]/span    ${number}
    Element Text Should Be    //*[@id="root"]//div/div[2]/div[2]/div[1]/span[1]/span    ${number}

Verify Should Show The Correct Win
    [Arguments]    ${win}
    Wait Until Page Contains Element    //*[@id="root"]//span[2]/span
    Element Text Should Be    //*[@id="root"]//span[2]/span    ${win}

Verify Should Show The Single Number Text
    Wait Until Page Contains Element    //*[@id="root"]//div[2]/div[2]/div/div[1]/span[1]
    Element Text Should Be    //*[@id="root"]//div[2]/div[2]/div/div[1]/span[1]    单号：


