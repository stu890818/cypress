*** Settings ***
Documentation     Test suite of activate device
Resource          ../init.robot

Force Tags    Devices
# Suite Setup    SuiteSetup
Suite Teardown     SuiteTeardown
# Test Setup    TestSetup
Test Timeout       300

*** Test Cases ***
Activate devices with invalid devicesSN
    Open Default Browser
    # Go To    http://bo.cqgame.qa/#/
    # Set Test Variable    ${invalid}    ${devicesID}abc
    # ${report} =    Activate Devices    ${productID}    ${invalid}
    # Reload Page
    # Verify Devices Status Is Correct    ${devicesID}    notactivated
    # Verify Response Is Contains Message    ${report}    HTTP/1.1 404 Not Found

*** Keywords ***
SuiteSetup
    Open Default Browser

SuiteTeardown
    # Delete Product Via API    ${productName}
    Close All Browsers

# TestSetup

