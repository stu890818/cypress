*** Settings ***
Documentation     Test suite of activate device
Resource          ../init.robot

Force Tags    Devices
Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
Test Setup    TestSetup
Test Timeout       300

*** Test Cases ***
Activate devices with invalid devicesSN
    Set Test Variable    ${invalid}    ${devicesID}abc
    ${report} =    Activate Devices    ${productID}    ${invalid}
    Reload Page
    Verify Devices Status Is Correct    ${devicesID}    notactivated
    Verify Response Is Contains Message    ${report}    HTTP/1.1 404 Not Found

*** Keywords ***
SuiteSetup
    ${time} =    Evaluate    time.strftime("%Y%m%d%H%M%S")   time
    Set Suite Variable    ${productName}    testing-${time}-qa
    Open Default Browser
    Log In    ${VALID_USER}    ${VALID_PASSWORD}
    Switch To Specified Business    ${VALID_COMPANY_ID}
    Click Side Bar Link    Products
    Create Product Via API    ${productName}

SuiteTeardown
    Delete Product Via API    ${productName}
    Close All Browsers

TestSetup
    ${time} =    Evaluate    time.strftime("%Y%m%d%H%M%S")   time
    ${productID} =    Get Product Id Via Api    ${productName}
    Go To Product Info Page    ${productID}
    Set Test Variable    ${devicesID}    qa-${time}
    Set Test Variable    ${devicesName}    testing-${time}-devices
    Set Suite Variable    ${productID}    ${productID}
    Click DEVICES Tab
    Create Devices    ${devicesID}    ${devicesName}
    Verify Devices Is Existing    ${devicesID}
