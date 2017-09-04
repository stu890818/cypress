*** Settings ***
Documentation     Test suite of admin cs create
Resource          ../init.robot

Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
Test Timeout       300

*** Test Cases ***
Admin should can create customer service
    Create Customer Service    ${csAccount}    ${csPassword}    ${csNickName}
    Verify The Customer Service Is Exist    ${csAccount}

*** Keywords ***
SuiteSetup
    ${random} =    Generate Random String  6  [LETTERS]
    Set Suite Variable    ${csAccount}    CS${random}
    Set Suite Variable    ${csPassword}    CS${random}
    Set Suite Variable    ${csNickName}    CS${random}
    Open Default Browser    ${CYPRESS_QA_URL}
    Log In    ${ADMIN_USER}    ${ADMIN_USER_PASSWORD}    ${CYPRESS_QA_URL}
    Go To CS Create Page    ${CYPRESS_QA_URL}

SuiteTeardown
    Log Out
    Close All Browsers

Verify The Customer Service Is Exist
    [Arguments]    ${csAccount}
    Go To CS List Page    ${CYPRESS_QA_URL}
    Verify The CS Exist In The Customer Service List    ${csAccount}
