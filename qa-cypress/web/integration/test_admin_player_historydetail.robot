*** Settings ***
Documentation     Test suite of admin player history detail page
Resource          ../init.robot

# Suite Setup    SuiteSetup
# Suite Teardown     SuiteTeardown
Test Timeout    300

*** Variables ***
${generalPlayerSeqNo}    749198
${agentPlayerSeqNo}    749235
${generalPlayerWin}    150
${agentPlayerWin}    150
${generalPlayerAccount}    qa556620170901
${generalAgentAccount}    qa5566
${agentPlayerAccount}    qa5566_qEmma20170901
${agentAccount}    qEmma
${bet}    9
${wineLine}    1

*** Test Cases ***
Admin should can search agent CQ9 game record detail list
    Search Seq Number    ${agentPlayerSeqNo}
    Verify Should Show The Correct Single Number    ${agentPlayerSeqNo}
    Verify Should Show The Correct Win    ${agentPlayerWin}
    Verify Should Show The Correct Player Account    ${agentPlayerAccount}
    Verify Should Show The Correct Agent Account    ${agentAccount}
    Verify Should Show The Correct Round Detail Operation
    Verify Should Show The Correct Round Detail Money    ${bet}    ${agentPlayerWin}
    Verify Should Show The Correct Base Game Infos    ${bet}    ${agentPlayerWin}    ${wineLine}

Admin should can search generel agent CQ9 game record detail list
    Search Seq Number    ${generalPlayerSeqNo}
    Verify Should Show The Correct Single Number    ${generalPlayerSeqNo}
    Verify Should Show The Correct Win    ${generalPlayerWin}
    Verify Should Show The Correct Player Account    ${generalPlayerAccount}
    Verify Should Show The Correct Agent Account    ${generalAgentAccount}
    Verify Should Show The Correct Round Detail Operation
    Verify Should Show The Correct Round Detail Money    ${bet}    ${generalPlayerWin}
    Verify Should Show The Correct Base Game Infos    ${bet}    ${generalPlayerWin}    ${wineLine}

*** Keywords ***
Agent Spin Game ID 1
    ${resp} =    Gameboy Player Login Post    qa5566_qEmma20170901    1234    qa5566_qEmma20170901    eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiI1OTliZjZmZDU0MDBiMDAwMDE0MjlhNmYiLCJhY2NvdW50IjoicUVtbWEiLCJvd25lciI6IjU5NGNiNjk4OThjNGExMDAwMTFkMDBiYSIsInBhcmVudCI6IjU5NGNiNjk4OThjNGExMDAwMTFkMDBiYSIsImN1cnJlbmN5IjoiQ05ZIiwianRpIjoiMjc1NDM4ODM3IiwiaWF0IjoxNTAzMzkzNTMzLCJpc3MiOiJDeXByZXNzIiwic3ViIjoiU1NUb2tlbiJ9.Qj72m6-DmXQ1D8knQvJzQN-QSDJXT-INtxqIYP2Jj_Q
    log to console    ${resp.json()}

SuiteSetup
    Open Default Browser    ${CYPRESS_QA_URL}
    Log In    ${ADMIN_USER}    ${ADMIN_USER_PASSWORD}    ${CYPRESS_QA_URL}
    Go To Player History Page    ${CYPRESS_QA_URL}

SuiteTeardown
    Log Out
    Close All Browsers