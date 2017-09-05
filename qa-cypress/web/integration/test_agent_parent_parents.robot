*** Settings ***
Documentation     Test suite of agent parents parent page
Resource          ../init.robot

# Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
Test Timeout    300

*** Variables ***
${imageDir}    ${CURDIR}/../res/1_picture/

*** Test Cases ***
Test 1
    Open Default Browser    ${CYPRESS_QA_URL}
    Log In    ${GENERAL_AGENT_USER}    ${GENERAL_AGENT_USER_PASSWORD}    ${CYPRESS_QA_URL}
    Go To Parent List Parent Info Page    ${CYPRESS_QA_URL}
    ${meg} =    Get Agent Sys Token
    Log to console    ${meg}
# Agent should can search agent report
#     [Setup]    TestSetupForSpinFGame1DefineValue
#     Agent Player Spin Game ID 1    ${GENERAL_AGENT_USER}  ${GENERAL_AGENT_USER_PASSWORD}  ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerNickname}
#     Login Cypress And Search Agent Report    ${agentAccount}    ${accountPwd}    ${CYPRESS_QA_URL}    ${agentPlayerAccount}


*** Keywords ***
Agent Player Spin Game ID 1
    [Arguments]    ${user}    ${pwd}    ${playerAccount}    ${playerPassword}    ${playerNickname}
    Create Player And Get Game Link    ${user}    ${pwd}    ${CYPRESS_QA_URL}    ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerNickname}
    Open Default Browser    ${gameLink}
    Add Image Path    ${imageDir}
    Wait Until Screen Contain    1_tittle.png    10
    Press Combination    Key.space
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

Create Player And Get Game Link
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
    Screenshot.Take Screenshot    agent_parents_parent_1.jpg    width=800px
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