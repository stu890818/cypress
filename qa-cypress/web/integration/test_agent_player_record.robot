*** Settings ***
Documentation     Test suite of agent player record page
Resource          ../init.robot

Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
Test Timeout    300

*** Test Cases ***
Agent should can search player trancation list
    Create A Player Do Deposit And Withdraw    ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerNickname}
    Login Cypress And Search Transaction List    ${AGENT_USER}    ${AGENT_USER_PASSWORD}    ${CYPRESS_QA_URL}    ${agentPlayerAccount}
    Verify Should Contain The Transcation In The List    tr    ${AGENT_USER}    CNY    10,000.00    10,000.00    存款    交易成功
    Verify Should Contain The Transcation In The List    tr[2]    ${AGENT_USER}    CNY    10,000.00    0.00    提款    交易成功

*** Keywords ***
Create A Player Do Deposit And Withdraw
    [Arguments]    ${playerAccount}    ${playerPassword}    ${playerNickname}
    Gameboy Player Post    ${playerAccount}    ${playerPassword}    ${playerNickname}    ${AGENT_SYS_TOKEN}
    Gameboy Player Deposit Post    10000    ${playerAccount}
    Gameboy Player Withdraw Post    10000    ${playerAccount}

Login Cypress And Search Transaction List
    [Arguments]    ${user}    ${pwd}    ${url}    ${playerAccount}
    Open Default Browser    ${url}
    Log In    ${user}    ${pwd}    ${url}
    Go To Player Record Page    ${url}
    Search Transcation With Player Account    ${playerAccount}

SuiteSetup
    ${random} =    Generate Random String  6  [LETTERS]
    Set Suite Variable    ${agentPlayerAccount}    agentPlayer${random}
    Set Suite Variable    ${agentPlayerPassword}    agentPassword${random}
    Set Suite Variable    ${agentPlayerNickname}    agentNickname${random}

SuiteTeardown
    Log Out
    Close All Browsers

Verify Should Contain The Transcation In The List
    [Arguments]    ${line}    ${agent}    ${currency}    ${money}    ${balance}    ${feature}    ${status}
    Wait Until Page Contains Element    //*[@id="root"]//div[2]/table/tbody/${line}/td[1]
    Get Column Text And Verify Should Be Equal For Player Manage    ${line}    [1]    ${agent}
    Get Column Text And Verify Should Be Equal For Player Manage    ${line}    [2]    ${currency}
    Get Column Text And Verify Should Be Equal For Player Manage    ${line}    [4]    ${money}
    Get Column Text And Verify Should Be Equal For Player Manage    ${line}    [5]    ${balance}
    Get Column Text And Verify Should Be Equal For Player Manage    ${line}    [6]    ${feature}
    Get Column Text And Verify Should Be Equal For Player Manage    ${line}    [7]/div    ${status}
