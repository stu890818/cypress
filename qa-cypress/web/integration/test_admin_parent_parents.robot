*** Settings ***
Documentation     Test suite of admin parent parents page
Resource          ../init.robot

Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
Test Timeout    300

*** Test Cases ***
Admin should can search agent report
    [Setup]    Player Spin Game    ${generalToken}
    Login Cypress And Search Agent Report    ${ADMIN_USER}    ${ADMIN_USER_PASSWORD}    ${roleGen}    ${roleAgn}
    Verify Should Can Search Agent Report Success    ${agentAccount}    1    ${betMoney}    ${totalWin}    ${balValue}0    ${currency}    ${retRateValue}%    1    1    1    ${avgBetValue}
    Verify Should Be Redirected To Parent Payers Page    ${roleGen}    ${dayTime}    ${dayTime}    day    ${currency}    ${roleAgn}

*** Keywords ***
Login Cypress And Search Agent Report
    [Arguments]    ${user}    ${pwd}    ${general}    ${agent}
    Open Default Browser    ${CYPRESS_QA_URL}
    Log In    ${user}    ${pwd}    ${CYPRESS_QA_URL}    代理列表
    Go To Parent Parents Page    ${CYPRESS_QA_URL}
    Admin Search Agent Report    ${general}    ${agent}

Player Spin Game
    [Arguments]    ${token}
    TestSetUpForGetGameLink    ${token}
    Open Default Browser    ${gameLink}
    Wait Until Keyword Succeeds    2 min    5 sec    Wait Until Screen Contain    1_tittle.png    10
    Wait Until Keyword Succeeds    2 min    5 sec    SikuliLibrary.Click    1_start.png
    Sleep    10s
    Wait Until Keyword Succeeds    2 min    5 sec    SikuliLibrary.Click    1_start.png

SuiteSetup
    ${time} =    Evaluate    time.strftime("%Y%m%d%H%M%S")    time
    ${comm} =    Evaluate    random.randint(1, 10)    random
    Set Regular Fruit King Info
    Set Regular Get Any Game Link Date    1
    Set Create Random Player Data    ${time}
    Set Suite Variable    ${imageDir}    ${CURDIR}/../res/1_picture/
    Set Suite Variable    ${roleGen}    roleG${time}
    Set Suite Variable    ${roleAgn}    roleA${time}
    Set Suite Variable    ${currency}    CNY
    Set Suite Variable    ${totalWin}    150.00
    Set Suite Variable    ${spinCount}    1
    Add Image Path    ${imageDir}
    Get Day Gap Format
    Create A Random Role User    ${ADMIN_USER}    ${ADMIN_USER_PASSWORD}    ${roleGen}    ${roleGen}    ${comm}    代理列表
    ${generalToken} =    Get User SYS Token    ${roleGen}    ${roleGen}    玩家列表
    Create A Random Role User    ${roleGen}    ${roleGen}    ${roleAgn}    ${roleAgn}    ${comm}    玩家列表
    ${agentToken} =    Get User SYS Token    ${roleAgn}    ${roleAgn}    玩家列表

SuiteTeardown
    Log Out
    Close All Browsers

TestSetUpForGetGameLink
    [Arguments]    ${token}
    ${time} =    Evaluate    time.strftime("%Y%m%d%H%M%S")    time
    Set Test Variable    ${playerA}    playerA${time}
    Gameboy Player Post    ${playerA}    ${playerA}    ${playerA}    ${token}
    ${resp} =    Gameboy Player Login Post    ${playerA}    ${playerA}    ${playerA}    ${token}
    Set Test Variable    ${playerToken}    ${resp.json()['data']['usertoken']}
    ${resp} =    Gameboy Player Gamelink Post    ${playerToken}    ${gameHall}    ${gametech}    ${gameplat}    1    ${gametype}    ${lang}
    Set Test Variable    ${gameLink}    ${resp.json()['data']['url']}
    ${resp} =    Gameboy Player Deposit Post    100    ${playerA}

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
