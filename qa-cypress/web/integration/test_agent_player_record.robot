*** Settings ***
Documentation     Test suite of agent player record page
Resource          ../init.robot

Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
Test Timeout    300

*** Variables ***
${agentSysToken}    eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiI1OTliZjZmZDU0MDBiMDAwMDE0MjlhNmYiLCJhY2NvdW50IjoicUVtbWEiLCJvd25lciI6IjU5NGNiNjk4OThjNGExMDAwMTFkMDBiYSIsInBhcmVudCI6IjU5NGNiNjk4OThjNGExMDAwMTFkMDBiYSIsImN1cnJlbmN5IjoiQ05ZIiwianRpIjoiMjc1NDM4ODM3IiwiaWF0IjoxNTAzMzkzNTMzLCJpc3MiOiJDeXByZXNzIiwic3ViIjoiU1NUb2tlbiJ9.Qj72m6-DmXQ1D8knQvJzQN-QSDJXT-INtxqIYP2Jj_Q

*** Test Cases ***
Agent should can search player trancation list
    Create A Player Do Deposit And Withdraw    ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerNickname}
    Login Cypress And Search Transaction List    ${AGENT_USER}    ${AGENT_USER_PASSWORD}    ${CYPRESS_QA_URL}    ${agentPlayerAccount}
    Verify Should Contain The Transcation In The List    tr    ${AGENT_USER}    CNY    10,000.00    10,000.00    存款    交易成功
    Verify Should Contain The Transcation In The List    tr[2]    ${AGENT_USER}    CNY    10,000.00    0.00    提款    交易成功

*** Keywords ***
Create A Player Do Deposit And Withdraw
    [Arguments]    ${playerAccount}    ${playerPassword}    ${playerNickname}
    Gameboy Player Post    ${playerAccount}    ${playerPassword}    ${playerNickname}    ${agentSysToken}
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
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[2]/table/tbody/${line}/td[1]
    Should Contain    ${msg}    ${agent}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[2]/table/tbody/${line}/td[2]
    Should Be Equal As Strings    ${msg}    ${currency}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[2]/table/tbody/${line}/td[4]
    Should Be Equal As Strings    ${msg}    ${money}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[2]/table/tbody/${line}/td[5]
    Should Be Equal As Strings    ${msg}    ${balance}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[2]/table/tbody/${line}/td[6]
    Should Be Equal As Strings    ${msg}    ${feature}
    ${msg} =    Selenium2Library.Get Text    //*[@id="root"]//div[2]/table/tbody/${line}/td[7]/div
    Should Be Equal As Strings    ${msg}    ${status}
