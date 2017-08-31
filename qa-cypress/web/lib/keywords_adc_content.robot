*** Keywords ***
# -------- Element --------
Click Content More Icon
    [Documentation]    Click content tab more icon button
    [Arguments]    ${itemID}
    Wait Until Element Is Visible    //tr[@data-qa="Content-ContentList-Item-${itemID}"]//button[@type="button"]
    Click Element    //tr[@data-qa="Content-ContentList-Item-${itemID}"]//button[@type="button"]

Wait Until Content Is Not Visible
    [Documentation]    Wait util the specified content not being showed
    [Arguments]    ${itemID}
    Wait Until Page Contains    Content
    Wait Until Page Does Not Contain    ${itemID}

# -------- Exo-Keyword --------
Delete Content Via ADC UI
    [Documentation]    Delete content by clicking more vert icon
    [Arguments]    ${itemID}
    Click Content More Icon    ${itemID}
    Click Icon Menu Options    Delete    ${itemID}
    Input Dialog Confirm Text    DeleteContentForm    DELETE
    Click Delete Button

# -------- Exo-Verify --------
Verify New Button Existing
    [Documentation]    Verify add button existing
    [Arguments]    ${text}
    Wait Until Page Contains Element    //button[@data-qa="Content-Add${text}-Button-TBody"]
    Element Text Should Be    //button[@data-qa="Content-Add${text}-Button-TBody"]    + NEW CONTENT

Verify New Button Not Existing
    [Documentation]    Verify add button not existing
    [Arguments]    ${text}
    Page Should Not Contain Element    //button[@data-qa="Content-Add${text}-Button-TBody"]

Verify Add Content Description
    [Documentation]    Verify add content description
    Wait Until Page Contains Element    //p[contains(.,"Think of content as files you want to store on a device. When a device is connected, it will automatically sync content with its digital twin.")]
    Page Should Contain Element    //p[contains(.,"Think of content as files you want to store on a device. When a device is connected, it will automatically sync content with its digital twin.")]

Verify Add Content Learn More Link Existing
    [Documentation]    Verify add content learn more link existing
    Wait Until Page Contains Element    //a[@data-qa="Dialog-AddContentLearnMore-Link"]
    Element Text Should Be    //a[@data-qa="Dialog-AddContentLearnMore-Link"]    Learn more

Verify Add Content Upload File Link Existing
    [Documentation]    Verify content add content upload file link existing
    Wait Until Page Contains Element    //label[@data-qa="Dialog-AddContentFile-Button"]
    Element Text Should Be    //label[@data-qa="Dialog-AddContentFile-Button"]    UPLOAD FILE

Verify Content Column Row Existing
    [Documentation]    Verify content column row existing
    [Arguments]    ${column}
    Wait Until Page Contains Element    //table[contains(.,"${column}")]
    Page Should Contain Element    //table[contains(.,"${column}")]

Verify Content Description Which Is Below The Alias Text Box
    [Documentation]    Verify content description which is below the alias text box
    Wait Until Page Contains Element    //p[contains(.,"Typically the file name or things like ")]
    Element Text Should Be    //p[contains(.,"Typically the file name or things like ")]    Typically the file name or things like "MANIFEST", which have implied functionality

Verify Content Empty List Message Existing
    [Documentation]    Verify content empty list message existing
    Wait Until Page Contains Element    //p[contains(.,"Think of content as files you want to store on the device. When a device connects, it will automatically sync content with its digital twin as an Over The Air (OTA) update.")]
    Page Should Contain Element    //p[contains(.,"Think of content as files you want to store on the device. When a device connects, it will automatically sync content with its digital twin as an Over The Air (OTA) update.")]

Verify Content Is Not Existing
    [Documentation]    Verify the specified content does not exist on the list
    [Arguments]    ${itemID}
    Wait Until Content Is Not Visible    ${itemID}
    Page Should Not Contain Element    //tr[contains(@data-qa,"Content-ContestList-Item")][contains(.,"${itemID}")]

Verify Content Popup Window Title Is Existing
    [Documentation]    Verify popup window string is existing
    [Arguments]    ${dialog}
    Wait Until Page Contains Element    //h3[contains(.,"${dialog}")]
    Page Should Contain Element    //h3[contains(.,"${dialog}")]

Verify Content Popup Window Message Is Existing
    [Documentation]    Verify popup window text is existing
    Page Should Contain Element    //p[contains(.,"WARNING: This action cannot be undone. The following will be deleted:")]
    Page Should Contain Element    //p[contains(.,"Deleting this content will remove it from every device the next time each device connects.")]
    Page Should Contain Element    //ul[contains(.,"All associated content data")]
    
Verify Content Popup Window Input Textbox Is Existing
    [Documentation]    Verify popup window input textbox is existing
    Wait Until Page Contains Element    //input[@data-qa="Dialog-DeleteContentFormConfirm-TextField"]
    Page Should Contain Element    //input[@data-qa="Dialog-DeleteContentFormConfirm-TextField"]

Verify Content Page Text Existing
    [Documentation]    Verify page text existing
    [Arguments]    ${text}
    Wait Until Page Contains Element    //h3[contains(.,"${text}")]
    Element Text Should Be    //h3[contains(.,"${text}")]    You currently don't have any content.

Verify Content Page Text Not Existing
    [Documentation]    Verify page text not existing
    [Arguments]    ${text}
    Page Should Not Contain Element    //h3[contains(.,"${text}")]

Verify Content Title Existing
    [Documentation]    Verify title existing
    [Arguments]    ${title}
    Wait Until Page Contains Element    //h2[contains(.,"${title}")]
    Element Text Should Be    //h2[contains(.,"${title}")]    Content
