*** Settings ***
Documentation     Test suite of admin parent parents page
Resource          ../init.robot

Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
Test Timeout    300

*** Test Cases ***
# Admin should can search all agent report
#     [Setup]    TestSetUpForCreateAnotherAgentAndSpinGame
#     Login Cypress And Search Agent Report    ${ADMIN_USER}    ${ADMIN_USER_PASSWORD}    ${roleGen}    ${EMPTY}
#     Verify Should Can Search Agent Report Success    ${roleAgn}    1    ${betMoney}    ${totalWin}    ${balValue}    ${currency}    ${retRateValue}%    1    1    1    ${avgBetValue}    tr
#     Verify Should Can Link To Parent Players Page    ${roleGen}    ${dayTime}    ${dayTime}    day    ${currency}    ${roleAgn}    tr[1]    td[13]
#     Verify Should Can Search Agent Report Success    ${roleAgnB}    1    ${betMoney}    ${totalWin}    ${balValue}    ${currency}    ${retRateValue}%    1    1    1    ${avgBetValue}    tr[2]
#     Verify Should Can Link To Parent Players Page    ${roleGen}    ${dayTime}    ${dayTime}    day    ${currency}    ${roleAgn}    tr[2]    td[13]

Admin should can search agent report
    Login Cypress And Search Agent Report    ${ADMIN_USER}    ${ADMIN_USER_PASSWORD}    ${roleGen}    ${roleAgn}
    Verify Should Can Search Agent Report Success    ${roleAgn}    ${currency}    1    ${betMoney}    ${totalWin}    ${balValue}    ${retRateValue}%    1    1    1    ${avgBetValue}    tr
    Verify Should Can Link To Parent Players Page    ${roleGen}    ${dayTime}    ${dayTime}    day    ${currency}    ${roleAgn}    tr[1]    td[13]

*** Keywords ***
Login Cypress And Search Agent Report
    [Arguments]    ${user}    ${pwd}    ${general}    ${agent}
    Open Default Browser    ${CYPRESS_QA_URL}
    Log In    ${user}    ${pwd}    ${CYPRESS_QA_URL}    代理列表
    Go To Parent Parents Page    ${CYPRESS_QA_URL}
    Admin Search Agent Report    ${general}    ${agent}

SuiteSetup
    ${time} =    Evaluate    time.strftime("%Y%m%d%H%M%S")    time
    ${comm} =    Evaluate    random.randint(1, 10)    random
    Set Regular Fruit King Info
    Set Regular Get Any Game Link Date    1
    Set Create Random Player Data    ${time}
    Set Suite Variable    ${imageDir}    ${CURDIR}/../res/1_picture/
    Set Suite Variable    ${roleGen}    testRoleG${time}
    Set Suite Variable    ${roleAgn}    testRoleA${time}
    Set Suite Variable    ${roleAgnB}    testRoleB${time}
    Set Suite Variable    ${spinCount}    1
    Add Image Path    ${imageDir}
    Get Day Gap Format
    Create A Random Role User    ${ADMIN_USER}    ${ADMIN_USER_PASSWORD}    ${roleGen}    ${COMMON_PASSWORD}    ${comm}    代理列表
    ${generalToken} =    Get User SYS Token    ${roleGen}    ${COMMON_PASSWORD}    玩家列表
    Set Suite Variable    ${generalToken}
    Create A Random Role User    ${roleGen}    ${COMMON_PASSWORD}    ${roleAgn}    ${COMMON_PASSWORD}    ${comm}    玩家列表
    ${agentToken} =    Get User SYS Token    ${roleAgn}    ${COMMON_PASSWORD}    玩家列表
    Set Suite Variable    ${agentToken}
    Player Spin Game    ${agentToken}    ${gameHall}    ${gametech}    ${gameplat}    1    ${gametype}    ${lang}    1_spin.png    1_takewin.png

SuiteTeardown
    Log Out
    Remove Image Path    ${imageDir}
    Close All Browsers

TestSetUpForCreateAnotherAgentAndSpinGame
    Create A Random Role User    ${roleGen}    ${COMMON_PASSWORD}    ${roleAgnB}    ${COMMON_PASSWORD}    ${comm}    玩家列表
    ${agentBToken} =    Get User SYS Token    ${roleAgnB}    ${COMMON_PASSWORD}    玩家列表
    Set Test Variable    ${agentBToken}
    Player Spin Game    ${agentBToken}    ${gameHall}    ${gametech}    ${gameplat}    ${gameID}    ${gametype}    ${lang}    1_spin.png    1_takewin.png

Verify Should Can Search Agent Report Success
    [Arguments]    ${account}    ${currency}    ${player}    ${bet}    ${win}    ${balance}    ${returnRate}    ${reaPlayer}    ${openGame}    ${gameCount}    ${avgBet}    ${line}
    Wait Until Page Contains Element    //*[@id="app"]//div[3]/table/tbody/tr/td[2]/div
    ${time} =    Evaluate    time.strftime("%Y-%m-%d", time.localtime())    time
    Set Test Variable    ${dayTime}    time
    Get Column Text And Verify Should Be Equal    ${line}    1    ${dayTime}
    Get Column Text And Verify Should Be Equal    ${line}    2    ${account}
    Get Column Text And Verify Should Be Equal    ${line}    3    ${currency}
    Get Column Text And Verify Should Be Equal    ${line}    4    ${player}
    Get Column Text And Verify Should Be Equal    ${line}    5    ${bet}
    Get Column Text And Verify Should Be Equal    ${line}    6    ${win}
    Get Column Text And Verify Should Be Equal    ${line}    7    ${balance}
    Get Column Text And Verify Should Be Equal    ${line}    8    ${returnRate}
    Get Column Text And Verify Should Be Equal    ${line}    9    ${reaPlayer}
    Get Column Text And Verify Should Be Equal    ${line}    10    ${openGame}
    Get Column Text And Verify Should Be Equal    ${line}    11    ${gameCount}
    Get Column Text And Verify Should Be Equal    ${line}    12    ${avgBet}

Verify Should Can Link To Parent Players Page
    [Arguments]    ${general}    ${from}    ${to}    ${groupby}    ${cur}    ${agent}    ${line}    ${column}
    Click Element    //*/${line}/${column}[contains(.,'代理玩家报表')]
    Verify Should Be Redirected To Parent Payers Page    ${general}    ${from}    ${to}    ${groupby}    ${cur}    ${agent}