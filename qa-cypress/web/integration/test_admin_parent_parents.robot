*** Settings ***
Documentation     Test suite of admin parent parents page
Resource          ../init.robot

Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
Test Timeout    300

*** Test Cases ***
Admin should can search agent report
    [Setup]    Player Spin Game    ${agentToken}
    Login Cypress And Search Agent Report    ${ADMIN_USER}    ${ADMIN_USER_PASSWORD}    ${roleGen}    ${roleAgn}
    Verify Should Can Search Agent Report Success    ${roleGen}    1    ${betMoney}    ${totalWin}    ${balValue}    ${currency}    ${retRateValue}%    1    1    1    ${avgBetValue}
    Verify Should Can Link To Parent Players Page    ${roleGen}    ${dayTime}    ${dayTime}    day    ${currency}    ${roleAgn}

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
    Wait Until Keyword Succeeds    2 min    5 sec    SikuliLibrary.Click    1_spin.png
    Sleep    5s
    Wait Until Keyword Succeeds    2 min    5 sec    SikuliLibrary.Click    1_takewin.png
    Sleep    1s

SuiteSetup
    ${time} =    Evaluate    time.strftime("%Y%m%d%H%M%S")    time
    ${comm} =    Evaluate    random.randint(1, 10)    random
    Set Regular Fruit King Info
    Set Regular Get Any Game Link Date    1
    Set Create Random Player Data    ${time}
    Set Suite Variable    ${imageDir}    ${CURDIR}/../res/1_picture/
    Set Suite Variable    ${roleGen}    roleG${time}
    Set Suite Variable    ${roleAgn}    roleA${time}
    Set Suite Variable    ${spinCount}    1
    Add Image Path    ${imageDir}
    Get Day Gap Format
    Create A Random Role User    ${ADMIN_USER}    ${ADMIN_USER_PASSWORD}    ${roleGen}    ${COMMON_PASSWORD}    ${comm}    代理列表
    ${generalToken} =    Get User SYS Token    ${roleGen}    ${COMMON_PASSWORD}    玩家列表
    Set Suite Variable    ${generalToken}
    Create A Random Role User    ${roleGen}    ${COMMON_PASSWORD}    ${roleAgn}    ${COMMON_PASSWORD}    ${comm}    玩家列表
    ${agentToken} =    Get User SYS Token    ${roleAgn}    ${COMMON_PASSWORD}    玩家列表
    Set Suite Variable    ${agentToken}

SuiteTeardown
    Log Out
    Remove Image Path    ${imageDir}
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
    ${time} =    Evaluate    time.strftime("%Y-%m-%d", time.localtime())    time
    Set Test Variable    ${dayTime}    time
    Get Column Text And Verify Should Be Equal    tr    1    ${dayTime}
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

Verify Should Can Link To Parent Players Page
    [Arguments]    ${general}    ${from}    ${to}    ${groupby}    ${cur}    ${agent}
    Click Element    //span[contains(.,'代理玩家报表')]
    Verify Should Be Redirected To Parent Payers Page    ${general}    ${from}    ${to}    ${groupby}    ${cur}    ${agent}