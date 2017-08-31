*** Keywords ***
# -------- Element --------
Click Add Device
    [Documentation]    Click add one or many device button
    [Arguments]    ${amount}
    Wait Until Page Contains Element    //span[@data-qa="MenuItem-Add${amount}-Item"]
    Click Element    //span[@data-qa="MenuItem-Add${amount}-Item"]

Click Add Device Cancel
    [Documentation]    Click add one or many device page cancel button
    [Arguments]    ${amount}
    Wait Until Page Contains Element    //button[@data-qa="Content-Add${amount}Cancel-Button"]
    Click Element   //button[@data-qa="Content-Add${amount}Cancel-Button"]

Click Add Device Confirm
    [Documentation]    Click add one or many device page confirm button
    [Arguments]    ${amount}
    Wait Until Page Contains Element    //button[@data-qa="Content-Add${amount}CancelConfirm-Button"]
    Click Element   //button[@data-qa="Content-Add${amount}CancelConfirm-Button"]

Click Device Empty Page Links
    [Documentation]    Click empty device page links
    [Arguments]    ${name}
    Wait Until Keyword Succeeds    1s    200ms    Click Element    //a[@data-qa="Content-${name}-Link"]

Click Device List
    [Documentation]    Click device page list
    [Arguments]    ${deviceName}
    Wait Until Page Contains Element    //tr[@data-qa="Content-DevicesList-Item-${deviceName}"]
    Click Element    //tr[@data-qa="Content-DevicesList-Item-${deviceName}"]

Click Device More Icon
    [Documentation]    Click device page more icon button
    [Arguments]    ${deviceId}
    Wait Until Page Contains Element    //button[@data-qa="Content-DevicesList-MoreItems-${deviceId}"]
    Click Element    //button[@data-qa="Content-DevicesList-MoreItems-${deviceId}"]

Click Dropdown Option
    [Documentation]    Click filter dropdown button
    [Arguments]    ${option}    ${deviceId}
    Wait Until Page Contains Element    //span[@data-qa="${option}-${deviceId}-Item"]
    Click Element    //span[@data-qa="${option}-${deviceId}-Item"]

Click More Icon Option
    [Arguments]    ${option}    ${deviceId}
    Wait Until Page Contains Element    //span[@data-qa="${option}-Item-${deviceId}"]
    Click Element    //span[@data-qa="${option}-Item-${deviceId}"]

Click Restrict Activation Period Checkbox
    [Documentation]    Click add one and many device restrict activation period checkbox
    Wait Until Page Contains Element    //input[@data-qa="Content-AddOneDeviceRestrictActivationPeriod-Checkbox"]
    Click Element    //input[@data-qa="Content-AddOneDeviceRestrictActivationPeriod-Checkbox"]

Click Load More
    [Documentation]    Click load more button
    Wait Until Page Contains Element    //button[@data-qa="Content-LoadMore-Button"]
    Click Element    //button[@data-qa="Content-LoadMore-Button"]

Click Search Icon
    [Documentation]    Click search icon button
    Wait Until Page Contains Element    //button[@data-qa="Content-SearchDevices-Button"]
    Click Element    //button[@data-qa="Content-SearchDevices-Button"]

Click Settings Link
    [Documentation]    Click add one or many device page settings links
    [Arguments]    ${amount}
    Wait Until Page Contains Element    //a[@data-qa="Content-Add${amount}ViewSettings-Button"]
    Click Element    //a[@data-qa="Content-Add${amount}ViewSettings-Button"]

Click Simulate A Device Tutorial Link
    [Documentation]    Click Simulate A Device Tutorial Link
    Wait Until Page Contains Element    //a[@data-qa="Content-Tutorial-Button-TBody"]
    Click Element    //a[@data-qa="Content-Tutorial-Button-TBody"]

Click Status Dropdown
    [Documentation]    Click device page status dropdown button
    Wait Until Page Contains Element    //button[@data-qa="Content-FilterDevicesList-IconButton"]
    Click Element    //button[@data-qa="Content-FilterDevicesList-IconButton"]

Click Try Again
    [Documentation]    Click searched non exist device page try again button
    Wait Until Page Contains Element    //a[@data-qa="Content-NoSearchResult-Link"]
    Click Element    //a[@data-qa="Content-NoSearchResult-Link"]

Create Device Via ADC UI
    [Documentation]    Create one device via UI
    [Arguments]    ${amount}    ${deviceId}
    Click New Function Button    Device
    Wait Until Keyword Succeeds    1    200ms    Click Add Device    OneDevice
    Input Device Identity    ${deviceId}
    Click Add Device Confirm    OneDevice

Create Many Devices Via ADC UI
    [Documentation]    Create many devices via UI
    [Arguments]    ${file}
    Click New Function Button    Device
    Wait Until Keyword Succeeds    1    200ms    Click Add Device    ManyDevices
    Wait Until Keyword Succeeds    10    500ms    Choose File    //*[@id="deviceCSVfileInput"]    ${file}
    Wait Until Keyword Succeeds    10    500ms    Click Add Device Confirm    ManyDevices

Input Delete Word To Delete Device
    [Documentation]    Input delete word to delete device
    Wait Until Page Contains Element    //input[@data-qa="Dialog-DeleteDeviceConfirm-TextField"]
    Input Text    //input[@data-qa="Dialog-DeleteDeviceConfirm-TextField"]    DELETE

Input Device Identity
    [Documentation]    Input device identity in the textbox
    [Arguments]    ${deviceId}
    Wait Until Page Contains Element    //input[@data-qa="Content-AddOneDeviceIdentity-TextField"]
    Input Text    //input[@data-qa="Content-AddOneDeviceIdentity-TextField"]    ${deviceId}

Input Device Token
    [Documentation]    Input device token in the textbox
    [Arguments]    ${token}
    Wait Until Page Contains Element    //input[@data-qa="Dialog-SetAuthenticationKey-TextField"]
    Input Text    //input[@data-qa="Dialog-SetAuthenticationKey-TextField"]    ${token}

Input Search Information
    [Documentation]    Input search device identity
    [Arguments]    ${information}
    Wait Until Page Contains Element    //input[@data-qa="Content-SearchDevices-TextField"]
    Input Text    //input[@data-qa="Content-SearchDevices-TextField"]    ${information}

# -------- Exo-Keyword --------
Delete Device Via UI
    Go To    ${MURANO_URL}/business/connectivity/${ID}/devices
    Click Device More Icon    ${deviceID}
    Click More Icon Option    IconMenu-Delete    ${deviceID}
    Input Delete Word To Delete Device
    Wait Until Keyword Succeeds    5s    1s    Click Dialog Confirm Button    DeleteDevice

Get Authentication Key Textfield Value
    [Documentation]    Get authentication key from input at UI
    Wait Until Page Contains Element    //input[@data-qa="Dialog-SetAuthenticationKey-TextField"]
    ${key} =    Get Value    //input[@data-qa="Dialog-SetAuthenticationKey-TextField"]
    [Return]    ${key}

Remove CSV File Header
    [Documentation]    Split to lines and remove header
    [Arguments]    ${FILE_CONTENT}
    @{LINES}=    Split To Lines    ${FILE_CONTENT}
    Remove From List    ${LINES}    0
    [Return]    @{LINES}

Write Post With Resources
    [Documentation]    Write post with resources
    [Arguments]    ${CIK}    ${aliasA}    ${aliasB}    ${aliasC}
    Write Post    ${CIK}    ${aliasA}    ${aliasA}
    Write Post    ${CIK}    ${aliasB}    ${aliasB}
    Write Post    ${CIK}    ${aliasC}    ${aliasC}

# -------- Exo-Verify --------
Verify Add Device Cancel
    [Documentation]    Verify add one or many device popup window cancel button is exist
    [Arguments]    ${amount}
    Wait Until Page Contains Element    //button[@data-qa="Content-Add${amount}Cancel-Button"]
    Page Should Contain Element    //button[@data-qa="Content-Add${amount}Cancel-Button"]

Verify Add Device Confirm
    [Documentation]    Verify add one or many device popup window confirm button is exist
    [Arguments]    ${amount}
    Wait Until Page Contains Element    //button[@data-qa="Content-Add${amount}CancelConfirm-Button"]
    Page Should Contain Element    //button[@data-qa="Content-Add${amount}CancelConfirm-Button"]

Verify Add Device Textbox
    [Documentation]    Verify add one and many device restrict activation period textbox is exist
    [Arguments]    ${name}
    Wait Until Page Contains Element    //input[@data-qa="Content-AddOneDevice${name}-TextField"]
    Page Should Contain Element    //input[@data-qa="Content-AddOneDevice${name}-TextField"]

Verify Add Many Devices Download Example
    [Documentation]    Verify add many device popup window download example button is exist
    Wait Until Page Contains Element    //a[@data-qa="Dialog-AddManyDevicesDownloadExample-Button"]
    Page Should Contain Element    //a[@data-qa="Dialog-AddManyDevicesDownloadExample-Button"]

Verify Add Many Device Text
    [Documentation]    Verify add many device popup window text is exist
    Wait Until Page Contains Element    //h3[contains(.,"Add many devices")]
    Page Should Contain Element    //h3[contains(.,"Add many devices")]

Verify Add Many Devices Upload File
    [Documentation]    Verify add many device popup window upload file botton is exist
    Wait Until Page Contains Element    //input[@data-qa="Dialog-AddManyDevicesCSVFile-Input"]
    Page Should Contain Element    //input[@data-qa="Dialog-AddManyDevicesCSVFile-Input"]

Verify Add One Device Text
    [Documentation]    Veridy add one device popup window text is exist
    Wait Until Page Contains Element    //h3[contains(.,"Add a device")]
    Page Should Contain Element    //h3[contains(.,"Add a device")]
    Page Should Contain Element    //p[contains(.,"E.g. CX897F3, ABC, 001")]

Verify Authentication Key Is Valid
    [Documentation]    Verify CIK key can provision data
    [Arguments]    ${deviceCIK}
    ${response} =    Write Post    ${deviceCIK.strip()}    state    10
    Verify Should Be Equal As Expected    ${response.status_code}    204

Verify Device Info Title Text
    [Documentation]    Verify device page device title text
    Wait Until Page Contains Element    //th[contains(.,"ID")]
    Page Should Contain Element    //th[contains(.,"IP Address")]
    Page Should Contain Element    //th[contains(.,"Last reported")]

Verify Empty Device Links
    [Documentation]    Verify empty device page links are exist
    [Arguments]    ${name}
    Wait Until Page Contains Element    //a[@data-qa="Content-${name}-Link"]
    Page Should Contain Element    //a[@data-qa="Content-${name}-Link"]

Verify Empty Device Screen Text Is Existing
    [Documentation]    Verify empty device screen test is existing
    [Arguments]    ${text}
    Wait Until Page Contains Element    //p[contains(.,"${text}")]
    Page Should Contain Element    //p[contains(.,"${text}")]

Verify Hide Units When Resource Is Empty
    [Documentation]    Verify hide units when device page resource is empty
    [Arguments]    ${alias}    ${unit}
    Wait Until Page Contains Element    //div[contains(@style,"padding-bottom")][contains(.,"${alias}")]
    Element Should Not Contain    //div[contains(@style,"padding-bottom")][contains(.,"${alias}")]    ${unit}

Verify Load More Button
    [Documentation]    Verify when device page over 50 devices, device page should shown load more button
    Wait Until Page Contains Element    //button[@data-qa="Content-LoadMore-Button"]
    Page Should Contain Element    //button[@data-qa="Content-LoadMore-Button"]

Verify Lock Popup Window Text Is Existing
    [Documentation]    Verify lock popup window text is existing
    Page Should Contain Element    //p[contains(.,"Locking ")]
    Page Should Contain Element    //p[contains(.,"${deviceId}")]
    Page Should Contain Element    //p[contains(.," will temporarily not allow it to connect until you unlock it again.")]

Verify Message When Resource Change Values
    [Documentation]    Verify message when device page resource change values
    [Arguments]    ${alias}
    Wait Until Page Contains Element    //div[contains(@style,"padding-bottom")][contains(.,"${alias}")][contains(.,"${alias}")]
    Page Should Contain Element    //div[contains(@style,"padding-bottom")][contains(.,"${alias}")][contains(.,"${alias}")]

Verify Popup Window Title Is Existing
    [Documentation]    Verify  popup window title is existing
    [Arguments]    ${title}
    Page Should Contain Element    //h3[contains(.,"${title}")]

Verify Popup Window Message Is Existing
    [Documentation]    Verify  popup window message is existing
    [Arguments]    ${text}
    Page Should Contain Element    //p[contains(.,"${text}")]

Verify Many Devices Are Existing
    [Documentation]    Verify many devices are existing
    [Arguments]    ${file}
    ${FILE_CONTENT}=   Get File    ${file}
    @{LINES}=    Remove CSV File Header    ${FILE_CONTENT}
    :FOR    ${element}    IN    @{LINES}
    \    Verify Devices Is Existing    ${element}

Verify More Icon Is Existing
    [Documentation]    Verify device page more icon is exist
    Wait Until Page Contains Element    xpath=(//button[@type='button'])[10]
    Page Should Contain Element    xpath=(//button[@type='button'])[10]

Verify More Icon Options
    [Documentation]    Verify device page more icon options is exist
    [Arguments]    ${options}    ${deviceId}
    Wait Until Page Contains Element    //span[@data-qa="${options}-Item-${deviceId}"]
    Page Should Contain Element    //span[@data-qa="${options}-Item-${deviceId}"]

Verify New Device Options
    [Documentation]    Verify new device button options is exist
    [Arguments]    ${amount}
    Wait Until Page Contains Element    //span[@data-qa="MenuItem-Add${amount}-Item"]
    Page Should Contain Element    //span[@data-qa="MenuItem-Add${amount}-Item"]

Verify Resource List Ordered By Alphabetically
    [Documentation]    Check the resource list is sort
    [Arguments]    ${alias}
    Wait Until Page Contains Element    //div[contains(@style,"padding-bottom")]
    Page Should Contain Element    //div[contains(@style,"padding-bottom")][contains(.,"${alias}")]    ${alias}

Verify Restrict Activation Period Checkbox
    [Documentation]    Verify restrict activation period checkbox is exist
    Wait Until Page Contains Element    //input[@data-qa="Content-AddOneDeviceRestrictActivationPeriod-Checkbox"]
    Page Should Contain Element    //input[@data-qa="Content-AddOneDeviceRestrictActivationPeriod-Checkbox"]

Verify Restrict Activation Period Text
    [Documentation]    Verify restrict activation period text is exist
    Wait Until Page Contains Element    //p[contains(.,"Devices that do not activate during the next")]
    Page Should Contain Element    //p[contains(.,"Devices that do not activate during the next")]
    Page Should contain Element    //p[contains(.,"hours will automatically be deleted for security purposes")]

Verify Search Button
    [Documentation]    Verify device page search button
    Wait Until Page Contains Element    //button[@data-qa="Content-SearchDevices-Button"]
    Page Should Contain Element    //button[@data-qa="Content-SearchDevices-Button"]

Verify String When Resource Is Boolean
    [Documentation]    Verify device page resource is boolean
    [Arguments]    ${alias}    ${string}
    Wait Until Page Contains Element    //div[contains(@style,"padding-bottom")][contains(.,"${alias}")][contains(.,"${string}")]
    Page Should Contain Element    //div[contains(@style,"padding-bottom")][contains(.,"${alias}")][contains(.,"${string}")]

Verify String When Resource Is Empty
    [Documentation]    Verify string exists when device page resource is empty
    [Arguments]    ${alias}
    Wait Until Page Contains Element    //div[contains(@style,"padding-bottom")][contains(.,"${alias}")][contains(.,"Hasn't reported yet")]
    Page Should Contain Element    //div[contains(@style,"padding-bottom")][contains(.,"${alias}")][contains(.,"Hasn't reported yet")]

Verify Search Non Exist Device Page Words
    [Documentation]    Verify no results page word when search non exist device
    Wait Until Page Contains Element    //h2[contains(.,"Sorry, no results.")]
    Page Should Contain Element    //h2[contains(.,"Sorry, no results.")]
    Page Should Contain Element    //p[contains(.,"Get tips for querying ")]
    Page Should Contain Element    //p[contains(.,"devices ")]
    Page Should Contain Element    //p[contains(.,", or clear your search and")]

Verify Search Textbox
    [Documentation]    Verify device page search textbox
    Wait Until Page Contains Element    //input[@data-qa="Content-SearchDevices-TextField"]
    Page Should Contain Element    //input[@data-qa="Content-SearchDevices-TextField"]

Verify Settings Link
    [Documentation]    Verify add device setting link is exist
    [Arguments]    ${amount}
    Wait Until Page Contains Element    //a[@data-qa="Content-Add${amount}ViewSettings-Button"]
    Page Should Contain Element    //a[@data-qa="Content-Add${amount}ViewSettings-Button"]

Verify Set Authentication Key Learn More Link Existing
    [Documentation]    Verify set authentication key learn more link existing
    Wait Until Page Contains Element    //a[@data-qa="Content-SetAuthenticationKeyLearnMore-Link"]
    Element Text Should Be    //a[@data-qa="Content-SetAuthenticationKeyLearnMore-Link"]    Learn more

Verify Set Authentication Key Settings Link
    [Documentation]    Verify set authentication key setting link is exist
    [Arguments]    ${amount}
    Wait Until Page Contains Element    //a[@data-qa="Content-${amount}ViewSettings-Button"]
    Page Should Contain Element    //a[@data-qa="Content-${amount}ViewSettings-Button"]

Verify Status Dropdown
    [Documentation]    Verify device page status dropdown button is exist
    Wait Until Page Contains Element    //button[@data-qa="Content-FilterDevicesList-IconButton"]
    Page Should Contain Element    //button[@data-qa="Content-FilterDevicesList-IconButton"]

Verify Status Dropdown Options
    [Documentation]    Verify device page status dropdown button options are exist
    [Arguments]    ${options}
    Wait Until Page Contains Element    //span[@data-qa="MenuItem-${options}-Item"]
    Page Should Contain Element    //span[@data-qa="MenuItem-${options}-Item"]

Verify Table Icon Exists
    [Documentation]    Verify device page device icon in table exists
    [Arguments]    ${options}    ${deviceId}
    Wait Until Page Contains Element    //tr[@data-qa="${options}-Item-${deviceId}"]
    Page Should Contain Element    //tr[@data-qa="${options}-Item-${deviceId}"]
