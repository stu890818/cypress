*** Settings ***
Documentation     Test suite of agent parent parents page
Resource          ../init.robot

Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
Test Timeout    300

*** Test Cases ***
# For loop for spin game
#     Open game link until succss
#     Sleep    5s
#     :For     ${index}     In Range    0    100
#     \    Press Combination    Key.space
#     \    Sleep    5s
#     \    Press Combination    Key.space
#     \    Sleep    5s

Call Depost all time
    :For     ${index}     In Range    0    1000
    \    ${resp} =    gameboy_player_withdraw_post    5   test20170921    ${ssotoken}


*** Keywords ***
Open game link until succss
    ${resp} =    Gameboy Player Login Post    ${agentPlayerAccount}    ${agentPlayerPassword}    ${agentPlayerAccount}    ${AGENT_SYS_TOKEN}
    Set Test Variable    ${playerToken}    ${resp.json()['data']['usertoken']}
    ${resp} =    Gameboy Player Gamelink Post    ${playerToken}    ${gameHall}    ${gametech}    ${gameplat}    ${gamecode}    ${gametype}    ${lang}
    Set Test Variable    ${gameLink}    ${resp.json()['data']['url']}
    ${resp} =    Gameboy Player Deposit Post    100    ${agentPlayerAccount}
    Open Default Browser    ${gameLink}
    # Add Image Path    ${imageDir}
    # ${status} =     Run Keyword And Return Status    Wait Until Screen Contain    1_tittle.png    10
    # Run Keyword If    '${status}'=='False'    Open game link until succss

SuiteSetup
    ${random} =    Generate Random String  6  [LETTERS]
    Screenshot.Set Screenshot Directory    ${CURDIR}/../res/screenshot
    Set Suite Variable    ${imageDir}    ${CURDIR}/../res/1_picture/
    Set Suite Variable    ${agentPlayerAccount}    qaemmayang
    Set Suite Variable    ${agentPlayerPassword}    1234
    Set Suite Variable    ${agentPlayerNickname}    qaemmayang
    Set Suite Variable    ${ssotoken}    eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiI1OTliZjZmZDU0MDBiMDAwMDE0MjlhNmYiLCJhY2NvdW50IjoicUVtbWEiLCJvd25lciI6IjU5NGNiNjk4OThjNGExMDAwMTFkMDBiYSIsInBhcmVudCI6IjU5NGNiNjk4OThjNGExMDAwMTFkMDBiYSIsImN1cnJlbmN5IjoiQ05ZIiwianRpIjoiMjc1NDM4ODM3IiwiaWF0IjoxNTAzMzkzNTMzLCJpc3MiOiJDeXByZXNzIiwic3ViIjoiU1NUb2tlbiJ9.Qj72m6-DmXQ1D8knQvJzQN-QSDJXT-INtxqIYP2Jj_Q
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
    Close All Browsers