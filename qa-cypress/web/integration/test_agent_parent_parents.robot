*** Settings ***
Documentation     Test suite of agent parent parents page
Resource          ../init.robot

Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
Test Timeout    300

*** Variables ***
${imageDir}    ${CURDIR}/../res/1_picture/

*** Test Cases ***
Agent should can search agent report
    [Setup]    TestSetupForSpinGameDefineValue
    Agent Player Spin Game ID 1    ${GENERAL_AGENT_USER}  ${GENERAL_AGENT_USER_PASSWORD}  ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerNickname}
    Login Cypress And Search Agent Report    ${agentAccount}    ${accountPwd}    ${CYPRESS_QA_URL}    ${agentPlayerAccount}
    Verify Should Can Search Agent Report Success    ${agentAccount}    1    ${betMoney}    ${totalWin}    ${balValue}0    ${currency}    ${retRateValue}%    1    0    1    ${avgBetValue}0

*** Keywords ***
Agent Player Spin Game ID 1
    [Arguments]    ${user}    ${pwd}    ${playerAccount}    ${playerPassword}    ${playerNickname}
    Create Player And Agent Then Get Game Link    ${user}    ${pwd}    ${CYPRESS_QA_URL}    ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerNickname}
    Take Screen And Win

Create New Agent And Set Agent Token
    [Arguments]    ${user}    ${pwd}    ${url}
    Set Random Create Agent Value
    Open Default Browser    ${url}
    Log In    ${user}    ${pwd}    ${url}
    Go To Parent Create Page    ${url}
    Create A New Agent    ${agentAccount}    ${accountPwd}    ${accountName}    ${comm}
    Log Out
    Log In    ${agentAccount}    ${accountPwd}    ${url}
    Go To Parent List Parent Info Page    ${url}
    ${sysToken} =    Get Agent Sys Token
    Set Test Variable    ${sysToken}

Create Player And Agent Then Get Game Link
    [Arguments]    ${user}    ${pwd}    ${url}    ${playerAccount}    ${playerPassword}    ${playerNickname}
    Create New Agent And Set Agent Token    ${user}    ${pwd}    ${url}
    Gameboy Player Post    ${playerAccount}    ${playerPassword}    ${playerNickname}    ${sysToken}
    ${resp} =    Gameboy Player Login Post    ${playerAccount}    ${playerPassword}    ${playerNickname}    ${sysToken}
    Set Test Variable    ${playerToken}    ${resp.json()['data']['usertoken']}
    ${resp} =    Gameboy Player Gamelink Post    ${playerToken}    ${gameHall}    ${gametech}    ${gameplat}    ${gamecode}    ${gametype}    ${lang}
    Set Test Variable    ${gameLink}    ${resp.json()['data']['url']}
    ${resp} =    Gameboy Player Deposit Post    10000    ${playerAccount}

Login Cypress And Search Agent Report
    [Arguments]    ${user}    ${pwd}    ${url}    ${playerAccount}
    Open Default Browser    ${url}
    Log In    ${user}    ${pwd}    ${url}
    Go To Parent Parents Page    ${url}
    Click 搜索 Button

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

TestSetupForSpinGameDefineValue
    ${balValue} =    Evaluate    ${betMoney} - ${totalWin}
    ${retRateValue} =    Evaluate    round(((${totalWin} / ${betMoney}) * 100), 4)
    ${avgBetValue} =    Evaluate    (${betMoney} / ${spinCount}) * 1.00
    Set Test Variable    ${balValue}
    Set Test Variable    ${retRateValue}
    Set Test Variable    ${avgBetValue}

Take Screen And Win
    Go To    ${gameLink}
    Add Image Path    ${imageDir}
    Wait Until Screen Contain    1_tittle.png    10
    Press Combination    Key.space
    Sleep    10s
    Screenshot.Take Screenshot    agent_parent_parents_1.jpg    width=800px
    Press Combination    Key.space

Verify Should Can Search Agent Report Success
    [Arguments]    ${account}    ${player}    ${bet}    ${win}    ${balance}    ${currency}    ${returnRate}    ${reaPlayer}    ${openGame}    ${gameCount}    ${avgBet}
    Wait Until Page Contains Element    //*[@id="root"]//div[3]/div[2]/div[2]/div[1]/div/div/table/tbody/tr/td[2]
    Get Column Text And Verify Should Be Equal    tr    2    ${account}
    Get Column Text And Verify Should Be Equal    tr    3    ${player}
    Get Column Text And Verify Should Be Equal    tr    4    ${bet}
    Get Column Text And Verify Should Be Equal    tr    5    ${win}
    Get Column Text And Verify Should Be Equal    tr    6    ${balance}
    Get Column Text And Verify Should Be Equal    tr    7    ${currency}
    Get Column Text And Verify Should Be Equal    tr    8    ${returnRate}
    Get Column Text And Verify Should Be Equal    tr    9    ${reaPlayer}
    Get Column Text And Verify Should Be Equal    tr    10    ${openGame}
    Get Column Text And Verify Should Be Equal    tr    11    ${gameCount}
    Get Column Text And Verify Should Be Equal    tr    12    ${avgBet}
