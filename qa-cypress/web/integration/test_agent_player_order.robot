*** Settings ***
Documentation     Test suite of agent player order page
Resource          ../init.robot

Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
Test Timeout    300

*** Variables ***
${agentSysToken}    eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiI1OTliZjZmZDU0MDBiMDAwMDE0MjlhNmYiLCJhY2NvdW50IjoicUVtbWEiLCJvd25lciI6IjU5NGNiNjk4OThjNGExMDAwMTFkMDBiYSIsInBhcmVudCI6IjU5NGNiNjk4OThjNGExMDAwMTFkMDBiYSIsImN1cnJlbmN5IjoiQ05ZIiwianRpIjoiMjc1NDM4ODM3IiwiaWF0IjoxNTAzMzkzNTMzLCJpc3MiOiJDeXByZXNzIiwic3ViIjoiU1NUb2tlbiJ9.Qj72m6-DmXQ1D8knQvJzQN-QSDJXT-INtxqIYP2Jj_Q
${imageDir}    /Users/emma/workPlace/cypress/qa-cypress/web/res/1_picture/

*** Test Cases ***
Agent should can search player bet list
    Agent Player Spin Game ID 1    ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerNickname}

*** Keywords ***
Agent Player Spin Game ID 1
    [Arguments]    ${playerAccount}    ${playerPassword}    ${playerNickname}
    Create Player And Get Game Link    ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerNickname}
    Open Default Browser    ${gameLink}
    Add Image Path    ${imageDir}
    Wait Until Screen Contain    1_tittle.png    10
    Press Combination    Key.space
    Sleep    5s
    Press Combination    Key.space

Create Player And Get Game Link
    [Arguments]    ${playerAccount}    ${playerPassword}    ${playerNickname}
    Gameboy Player Post    ${playerAccount}    ${playerPassword}    ${playerNickname}    ${agentSysToken}
    ${resp} =    Gameboy Player Login Post    ${playerAccount}    ${playerPassword}    ${playerNickname}    ${agentSysToken}
    Set Test Variable    ${playerToken}    ${resp.json()['data']['usertoken']}
    ${resp} =    Gameboy Player Gamelink Post    ${playerToken}    ${gameHall}    ${gametech}    ${gameplat}    ${gamecode}    ${gametype}    ${lang}
    Set Test Variable    ${gameLink}    ${resp.json()['data']['url']}
    ${resp} =    Gameboy Player Deposit Post    10000    ${playerAccount}
    log to console    ${resp.json()}

SuiteSetup
    ${random} =    Generate Random String  6  [LETTERS]
    Set Suite Variable    ${agentPlayerAccount}    agentPlayer${random}
    Set Suite Variable    ${agentPlayerPassword}    agentPassword${random}
    Set Suite Variable    ${agentPlayerNickname}    agentNickname${random}
    Set Suite Variable    ${gameHall}    cq9
    Set Suite Variable    ${gametech}    html5
    Set Suite Variable    ${gameplat}    mobile
    Set Suite Variable    ${gamecode}    1
    Set Suite Variable    ${gametype}    slot
    Set Suite Variable    ${lang}    zh-cn
   # Open Default Browser    ${CYPRESS_QA_URL}
    # Log In    ${ADMIN_USER}    ${ADMIN_USER_PASSWORD}    ${CYPRESS_QA_URL}
    # Go To Player History Page    ${CYPRESS_QA_URL}

SuiteTeardown
    # Log Out
    Close All Browsers