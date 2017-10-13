*** Settings ***
Documentation     Test suite of admin parent parents page
Resource          ../init.robot

Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
Test Timeout    300

*** Test Cases ***
Admin should can search agent report
    [Setup]    TestSetupForSpinGameDefineValue
    Agent Player Spin Game ID 1    ${GENERAL_AGENT_USER}  ${GENERAL_AGENT_USER_PASSWORD}  ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerNickname}
    Login Cypress And Search Agent Report    ${agentAccount}    ${accountPwd}    ${CYPRESS_QA_URL}    ${agentPlayerAccount}
    Verify Should Can Search Agent Report Success    ${agentAccount}    1    ${betMoney}    ${totalWin}    ${balValue}0    ${currency}    ${retRateValue}%    1    0    1    ${avgBetValue}0

*** Keywords ***
SuiteSetup
    ${time} =    Evaluate    time.strftime("%Y%m%d%H%M%S")    time
    ${comm} =    Evaluate    random.randint(1, 10)    random
    Set Regular Fruit King Info
    Set Regular Get Any Game Link Date    1
    Set Create Random Player Data    ${time}
    Set Suite Variable    ${roleGen}    roleG${time}
    Set Suite Variable    ${roleAgn}    roleA${time}
    Set Suite Variable    ${currency}    CNY
    Set Suite Variable    ${totalWin}    150.00
    Set Suite Variable    ${spinCount}    1
    Create A Random Role User    ${ADMIN_USER}    ${ADMIN_USER_PASSWORD}    ${roleGen}    ${roleGen}    ${comm}
    Create A Random Role User    ${GENERAL_AGENT_USER}    ${GENERAL_USER_PASSWORD}    ${roleAgn}    ${roleAgn}    ${comm}

Player Spin Game
    [Arguments]
    ${time} =    Evaluate    time.strftime("%Y%m%d%H%M%S")    time
    Set Test Variable    ${playerA}    playerA${time}
    Gameboy Player Post    ${playerA}    ${playerA}    ${playerA}    ${sysToken}
    ${resp} =    Gameboy Player Login Post    ${playerAccount}    ${playerPassword}    ${playerNickname}    ${sysToken}
    Set Test Variable    ${playerToken}    ${resp.json()['data']['usertoken']}
    ${resp} =    Gameboy Player Gamelink Post    ${playerToken}    ${gameHall}    ${gametech}    ${gameplat}    ${gamecode}    ${gametype}    ${lang}
    Set Test Variable    ${gameLink}    ${resp.json()['data']['url']}
    ${resp} =    Gameboy Player Deposit Post    10000    ${playerAccount}

SuiteTeardown
    Log Out
    Close All Browsers