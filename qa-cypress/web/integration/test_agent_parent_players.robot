*** Settings ***
Documentation     Test suite of agent parent players page
Resource          ../init.robot

Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
Test Timeout    300

*** Variables ***
${agentSysToken}    eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiI1OTliZjZmZDU0MDBiMDAwMDE0MjlhNmYiLCJhY2NvdW50IjoicUVtbWEiLCJvd25lciI6IjU5NGNiNjk4OThjNGExMDAwMTFkMDBiYSIsInBhcmVudCI6IjU5NGNiNjk4OThjNGExMDAwMTFkMDBiYSIsImN1cnJlbmN5IjoiQ05ZIiwianRpIjoiMjc1NDM4ODM3IiwiaWF0IjoxNTAzMzkzNTMzLCJpc3MiOiJDeXByZXNzIiwic3ViIjoiU1NUb2tlbiJ9.Qj72m6-DmXQ1D8knQvJzQN-QSDJXT-INtxqIYP2Jj_Q
${imageDir}    ${CURDIR}/../res/1_picture/

*** Test Cases ***
Agent should can search agent player's report
    [Setup]    TestSetupForSpinFGame1DefineValue
    Agent Player Spin Game ID 1    ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerNickname}
    Login Cypress And Search Agent Player's Report    ${AGENT_USER}    ${AGENT_USER_PASSWORD}    ${CYPRESS_QA_URL}    ${agentPlayerAccount}
    Verify Should Can Search Agent Player's Report Success    ${agentPlayerAccount}    ${AGENT_USER}    ${gameHall}    ${gameName}    ${betMoney}    ${totalWin}    ${balValue}0    ${retRateValue}%    ${avgBetValue}    ${currency}

*** Keywords ***
Agent Player Spin Game ID 1
    [Arguments]    ${playerAccount}    ${playerPassword}    ${playerNickname}
    Create Player And Get Game Link    ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerNickname}
    Open Default Browser    ${gameLink}
    Add Image Path    ${imageDir}
    Wait Until Screen Contain    1_tittle.png    10
    Press Combination    Key.space
    Take Screen And Win

Create Player And Get Game Link
    [Arguments]    ${playerAccount}    ${playerPassword}    ${playerNickname}
    Gameboy Player Post    ${playerAccount}    ${playerPassword}    ${playerNickname}    ${agentSysToken}
    ${resp} =    Gameboy Player Login Post    ${playerAccount}    ${playerPassword}    ${playerNickname}    ${agentSysToken}
    Set Test Variable    ${playerToken}    ${resp.json()['data']['usertoken']}
    ${resp} =    Gameboy Player Gamelink Post    ${playerToken}    ${gameHall}    ${gametech}    ${gameplat}    ${gamecode}    ${gametype}    ${lang}
    Set Test Variable    ${gameLink}    ${resp.json()['data']['url']}
    ${resp} =    Gameboy Player Deposit Post    10000    ${playerAccount}

Login Cypress And Search Agent Player's Report
    [Arguments]    ${user}    ${pwd}    ${url}    ${playerAccount}
    Open Default Browser    ${url}
    Log In    ${user}    ${pwd}    ${url}
    Go To Parent Players Page    ${url}
    Search Player Report With Player Account    ${playerAccount}

SuiteSetup
    ${random} =    Generate Random String  6  [LETTERS]
    Screenshot.Set Screenshot Directory    ${CURDIR}/../res/screenshot
    Set Suite Variable    ${agentPlayerAccount}    agentPlayer${random}
    Set Suite Variable    ${agentPlayerPassword}    agentPassword${random}
    Set Suite Variable    ${agentPlayerNickname}    agentNickname${random}
    Set Suite Variable    ${gameHall}    CQ9
    Set Suite Variable    ${gametech}    html5
    Set Suite Variable    ${gameplat}    mobile
    Set Suite Variable    ${gamecode}    1
    Set Suite Variable    ${gametype}    slot
    Set Suite Variable    ${lang}    zh-cn
    Set Suite Variable    ${betMoney}    9.00
    Set Suite Variable    ${currency}    CNY
    Set Suite Variable    ${totalWin}    150.00
    Set Suite Variable    ${spinCount}    1
    Set Suite Variable    ${gameName}    钻石水果王

SuiteTeardown
    Log Out
    Close All Browsers

TestSetupForSpinFGame1DefineValue
    ${balValue} =    Evaluate    ${totalWin} - ${betMoney}
    ${retRateValue} =    Evaluate    round(((${totalWin} / ${betMoney}) * 100), 4)
    ${avgBetValue} =    Evaluate    int(${betMoney} / ${spinCount})
    Set Test Variable    ${balValue}
    Set Test Variable    ${retRateValue}
    Set Test Variable    ${avgBetValue}

Take Screen And Win
    Sleep    10s
    Screenshot.Take Screenshot    agent_parent_players_1.jpg    width=800px
    Press Combination    Key.space

Verify Should Can Search Agent Player's Report Success
    [Arguments]    ${playerAccount}    ${agent}    ${hall}    ${Name}    ${bet}    ${win}    ${balance}    ${returnRate}    ${avgBet}    ${currency}
    Wait Until Page Contains Element    //*[@id="root"]//div[3]/div[2]/div[2]/div[1]/div/div/table/tbody/tr/td[2]
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[3]/div[2]/div[2]/div[1]/div/div/table/tbody/tr/td[2]
    Should Be Equal As Strings    ${msg}    ${playerAccount}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[3]/div[2]/div[2]/div[1]/div/div/table/tbody/tr/td[3]
    Should Be Equal As Strings    ${msg}    ${agent}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[3]/div[2]/div[2]/div[1]/div/div/table/tbody/tr/td[4]
    Should Be Equal As Strings    ${msg}    ${hall}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[3]/div[2]/div[2]/div[1]/div/div/table/tbody/tr/td[5]
    Should Be Equal As Strings    ${msg}    ${Name}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[3]/div[2]/div[2]/div[1]/div/div/table/tbody/tr/td[6]
    Should Be Equal As Strings    ${msg}    ${bet}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[3]/div[2]/div[2]/div[1]/div/div/table/tbody/tr/td[7]
    Should Be Equal As Strings    ${msg}    ${win}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[3]/div[2]/div[2]/div[1]/div/div/table/tbody/tr/td[8]
    Should Be Equal As Strings    ${msg}    ${balance}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[3]/div[2]/div[2]/div[1]/div/div/table/tbody/tr/td[9]
    Should Be Equal As Strings    ${msg}    ${returnRate}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[3]/div[2]/div[2]/div[1]/div/div/table/tbody/tr/td[10]
    Should Be Equal As Strings    ${msg}    ${avgBet}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[3]/div[2]/div[2]/div[1]/div/div/table/tbody/tr/td[11]
    Should Be Equal As Strings    ${msg}    ${currency}
