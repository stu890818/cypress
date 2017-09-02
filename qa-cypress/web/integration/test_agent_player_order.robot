*** Settings ***
Documentation     Test suite of agent player order page
Resource          ../init.robot

Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
Test Timeout    300

*** Variables ***
${agentSysToken}    eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiI1OTliZjZmZDU0MDBiMDAwMDE0MjlhNmYiLCJhY2NvdW50IjoicUVtbWEiLCJvd25lciI6IjU5NGNiNjk4OThjNGExMDAwMTFkMDBiYSIsInBhcmVudCI6IjU5NGNiNjk4OThjNGExMDAwMTFkMDBiYSIsImN1cnJlbmN5IjoiQ05ZIiwianRpIjoiMjc1NDM4ODM3IiwiaWF0IjoxNTAzMzkzNTMzLCJpc3MiOiJDeXByZXNzIiwic3ViIjoiU1NUb2tlbiJ9.Qj72m6-DmXQ1D8knQvJzQN-QSDJXT-INtxqIYP2Jj_Q
${imagePath}    ${CURDIR}../../res/1_picture

*** Test Cases ***
Agent should can search player bet list
    Agent Player Spin Game ID 1

*** Keywords ***
Agent Player Spin Game ID 1
    # Gameboy Player Post    ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerNickname}    ${agentSysToken}
    # ${resp} =    Gameboy Player Login Post    ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerNickname}    ${agentSysToken}
    # Set Test Variable    ${playerToken}    ${resp.json()['data']['usertoken']}
    # ${resp} =    Gameboy Player Gamelink Post    ${playerToken}    ${gameHall}    ${gametech}    ${gameplat}    ${gamecode}    ${gametype}    ${lang}
    # Set Test Variable    ${gameLink}    ${resp.json()['data']['url']}
    # Open Default Browser    ${gameLink}
    Add Image Path    ${imagePath}
    Wait For Image    1_startPlay.png

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
    Log Out
    Close All Browsers