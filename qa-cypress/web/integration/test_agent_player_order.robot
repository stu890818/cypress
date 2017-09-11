*** Settings ***
Documentation     Test suite of agent player order page
Resource          ../init.robot

Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
Test Timeout    300

*** Variables ***
${imageDir}    ${CURDIR}/../res/1_picture/

*** Test Cases ***
Agent should can search player order list
    Agent Player Spin Game ID 1    ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerNickname}
    Login Cypress And Search Order List    ${AGENT_USER}    ${AGENT_USER_PASSWORD}    ${CYPRESS_QA_URL}    ${agentPlayerAccount}
    Verify Should Contain The Order Data In The List    ${betMoney}    ${totalWin}    -    ${gameHall}    ${gameName}    ${currency}

*** Keywords ***
Agent Player Spin Game ID 1
    [Arguments]    ${playerAccount}    ${playerPassword}    ${playerNickname}
    Create Player And Get Game Link    ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerNickname}
    Open Game link And Spin

Create Player And Get Game Link
    [Arguments]    ${playerAccount}    ${playerPassword}    ${playerNickname}
    Gameboy Player Post    ${playerAccount}    ${playerPassword}    ${playerNickname}    ${AGENT_SYS_TOKEN}
    ${resp} =    Gameboy Player Login Post    ${playerAccount}    ${playerPassword}    ${playerNickname}    ${AGENT_SYS_TOKEN}
    Set Test Variable    ${playerToken}    ${resp.json()['data']['usertoken']}
    ${resp} =    Gameboy Player Gamelink Post    ${playerToken}    ${gameHall}    ${gametech}    ${gameplat}    ${gamecode}    ${gametype}    ${lang}
    Set Test Variable    ${gameLink}    ${resp.json()['data']['url']}
    ${resp} =    Gameboy Player Deposit Post    10000    ${playerAccount}

Login Cypress And Search Order List
    [Arguments]    ${user}    ${pwd}    ${url}    ${playerAccount}
    Open Default Browser    ${url}
    Log In    ${user}    ${pwd}    ${url}
    Go To Player Order Page    ${url}
    Search Order With Player Account    ${playerAccount}

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
    Set Suite Variable    ${totalWin}    150.00
    Set Suite Variable    ${gameName}    钻石水果王
    Set Suite Variable    ${currency}    CNY

SuiteTeardown
    Log Out
    Close All Browsers

Open Game link And Spin
    Open Default Browser    ${gameLink}
    Add Image Path    ${imageDir}
    Wait Until Screen Contain    1_tittle.png    10
    Press Combination    Key.space
    Sleep    10s
    Screenshot.Take Screenshot    agent_player_order_1.jpg    width=800px
    Press Combination    Key.space

Verify Should Contain The Order Data In The List
    [Arguments]    ${bet}    ${win}    ${set}    ${hall}    ${name}    ${currency}
    Wait Until Page Contains Element    //*[@id="root"]//div[2]/table/tbody/tr/td[4]
    Get Column Text And Verify Should Be Equal For Player Manage    tr    [4]    ${bet}
    Get Column Text And Verify Should Be Equal For Player Manage    tr    [5]    ${win}
    Get Column Text And Verify Should Be Equal For Player Manage    tr    [6]    ${set}
    Get Column Text And Verify Should Be Equal For Player Manage    tr    [7]    ${hall}
    Get Column Text And Verify Should Be Equal For Player Manage    tr    [8]    ${name}
    Get Column Text And Verify Should Be Equal For Player Manage    tr    [9]    ${currency}
