** Settings ***
Documentation     Test suite of agent parent parents page
Resource          ../init.robot

# Suite Setup    SuiteSetup
# Suite Teardown     SuiteTeardown
Test Timeout    300

*** Test Cases ***
Test A
    ${output} =    Run    tesseract 456.png result -l

*** Keywords ***