*** Keywords ***
# -------- Element --------
# Click ${text} Button
#     Click Button    ${text}

# Click ${text} Tab
#     Wait Until Page Contains Element    //button[contains(.,"${text}")]
#     Click ${text} Button

# Click ADC Add Applications Button
#     [Documentation]    Click the add applications button on ADC solution
#     Click New ADC Solution Button
#     Wait Until Keyword Succeeds    1s    200ms    Click Element    //span[@data-qa="MenuItem-AddApplication-Item"]

# Click ADC Add Applications Button By Tbody Button
#     [Documentation]    Click the new solution tbody button on ADC solution
#     Wait Until Element Is Visible    //button[@data-qa="Content-NewSolution-Button-TBody"]
#     Click Element    //button[@data-qa="Content-NewSolution-Button-TBody"]
#     Wait Until Element Is Visible    //span[@data-qa="MenuItem-AddApplication-Item"]
#     Click Element    //html/body/div[4]/div/div/div/div/div/div[1]/span

# Click ADC Add Products Button
#     [Documentation]    Click the add products button on ADC solution
#     Click New ADC Solution Button
#     Wait Until Keyword Succeeds    1s    200ms    Click Element    //span[@data-qa="MenuItem-AddProduct-Item"]

# Click Auto Generated DOCS Link
#     [Documentation]    Click the AUTO-GENERATED DOCS link
#     Wait Until Page Contains Element    //a[@data-qa="Content-Docs-Link-Subtitle"]
#     Click Element    //a[@data-qa="Content-Docs-Link-Subtitle"]

# Click Dialog Cancel Button
#     [Documentation]    Click the cancel button in the specified dialog
#     [Arguments]    ${dialog}
#     Wait Until Element Is Visible    //button[@data-qa="Dialog-${dialog}Cancel-Button"]
#     Click Element    //button[@data-qa="Dialog-${dialog}Cancel-Button"]
#     Wait Until Page Does Not Contain Element    //button[@data-qa="Dialog-${dialog}Cancel-Button"]

# Click Dialog Confirm Button
#     [Documentation]    Click the confirm button in the specified dialog the text may be Create/ Delete
#     [Arguments]    ${dialog}
#     Wait Until Element Is Visible    //button[@data-qa="Dialog-${dialog}Confirm-Button"]
#     Click Element    //button[@data-qa="Dialog-${dialog}Confirm-Button"]

# Click DOCS Navigation Link
#     [Documentation]    Click the Docs link
#     Click Navigation Icon Menu
#     Wait Until Page Contains Element    //a[@data-qa="TopNav-Docs-Link"]
#     Click Element    //a[@data-qa="TopNav-Docs-Link"]

# Click Domain Link
#     [Documentation]    Click the DOMAIN link
#     Wait Until Page Contains Element    //a[@data-qa="Content-Domain-Link-Subtitle"]
#     Click Element    //a[@data-qa="Content-Domain-Link-Subtitle"]

# Click Drop Down
#     [Arguments]    ${dropDown}
#     Wait Until Page Contains Element    //div[@data-qa="Dialog-${dropDown}-SelectField"]
#     Click Element    //div[@data-qa="Dialog-${dropDown}-SelectField"]/div

# Click Drop Down Item
#     [Arguments]    ${item}
#     Wait Until Element Is Visible    //body/div[last()]//span[contains(.,"${item}")]/div/div/div
#     Click Element    //body/div[last()]//span[contains(.,"${item}")]/div/div/div

# Click Drop Down Item For Product And Application
#     [Arguments]    ${name}    ${item}
#     Wait Until Element Is Visible    //span[@data-qa="SelectField-${name}StartPoint-Item-0"]
#     ${index} =    Set Variable If    '${item}'=='Home Automation Example'    0    1
#     Click Element    //span[@data-qa="SelectField-${name}StartPoint-Item-${index}"]

# Click Enter For Input
#     [Documentation]    Use ASCII \\13 to click enter key
#     [Arguments]    ${element}
#     Press Key    ${element}    \\13

# Click Navigation Account Menu
#     [Documentation]    Click the Account Menu in the navigation bar
#     Wait Until Element Is Visible    //button[@data-qa="TopNav-UserEmail-PopoverButton"]
#     Click Element    //button[@data-qa="TopNav-UserEmail-PopoverButton"]

# Click Navigation Account Menu Option
#     [Documentation]    Click the option in the navigation bar Account Menu
#     [Arguments]    ${option}
#     Click Navigation Account Menu
#     Wait Until Element Is Visible    //span/div[contains(.,'${option}')]
#     Click Element    //span/div[contains(.,'${option}')]

# Click Navigation Bar Link
#     [Arguments]    ${linkText}
#     Wait Until Element Is visible    //a[@data-qa="TopNav-Item-Link"][text()="${linkText}"]
#     Click Element    //a[@data-qa="TopNav-Item-Link"][text()="${linkText}"]

# Click Navigation Icon Menu
#     [Documentation]    Click the question icon in the navigation bar
#     Wait Until Element Is Visible    //button[@data-qa="TopNav-Help-IconMenu"]
#     Click Element    //button[@data-qa="TopNav-Help-IconMenu"]

# Click Navigation Icon Menu Option
#     [Documentation]    Click the option in the navigation bar question icon menu
#     [Arguments]    ${option}
#     Click Navigation Icon Menu
#     Wait Until Element Is Visible    //a[contains(.,'${option}')]
#     Click Element    //a[contains(.,'${option}')]

# Click New ADC Solution Button
#     [Documentation]    Click the new solution button on ADC solution
#     Wait Until Element Is Visible    //button[@data-qa="Content-NewADCSolution-Button-THeader"]
#     Click Element    //button[@data-qa="Content-NewADCSolution-Button-THeader"]

# Click New Device Button
#     [Documentation]    Click the new role button
#     Wait Until Element Is Visible    //button[@data-qa="Content-NewDevice-Button-THeader"]
#     Click Element    //button[@data-qa="Content-NewDevice-Button-THeader"]

# Click New Function Button
#     [Arguments]    ${function}
#     Wait Until Element Is Visible    //button[@data-qa="Content-New${function}-Button-THeader"]
#     Click Element    //button[@data-qa="Content-New${function}-Button-THeader"]

# Click New Role Button
#     [Documentation]    Click the new role button
#     Wait Until Element Is Visible    //button[@data-qa="Content-NewRole-Button-THeader"]
#     Click Element    //button[@data-qa="Content-NewRole-Button-THeader"]

# Click New Applications Button
#     [Documentation]    Click the new applications button
#     Wait Until Element Is Visible    //button[@data-qa="Content-NewApplication-Button-THeader"]
#     Click Element    //button[@data-qa="Content-NewApplication-Button-THeader"]

# Click New User Button
#     [Documentation]    Click the new user button
#     Wait Until Element Is Visible    //button[@data-qa="Content-NewUser-Button"]
#     Click Element    //button[@data-qa="Content-NewUser-Button"]

# Click Products Navigation Link
#     [Documentation]    Click products link in the top navigation
#     Wait Until Element Is Visible    //a[@data-qa="TopNav-Item-Link"]
#     Click Element    //a[@data-qa="TopNav-Item-Link"]

# Click Products Name Navigation Link
#     [Arguments]    ${productName}
#     Wait Until Page Contains Element    //span[contains(.,"${productName}")]
#     Click Element    //span[contains(.,"${productName}")]

# Click Side Bar Link
#     [Documentation]    Click the specified link in the side navigation menu
#     [Arguments]    ${text}
#     Wait Until Element Is Visible    //a[@data-qa="SideNav-${text}-Link"]
#     Click Element    //a[@data-qa="SideNav-${text}-Link"]

# Click Sign Out
#     [Documentation]    Click the specified link in the side navigation menu
#     Wait Until Element Is Visible    //span[@data-qa="TopNav-SignOut-Item"]
#     Click Element    //span[@data-qa="TopNav-SignOut-Item"]

# Click Application Navigation Link
#     [Documentation]    Click application link or solutions link in the top navigation
#     Wait Until Element Is Visible    //a[@data-qa="TopNav-Item-Link"]
#     Click Element    //a[@data-qa="TopNav-Item-Link"]

# Click Application Name Navigation Link
#     [Arguments]    ${applicationName}
#     Wait Until Page Contains Element    //span[contains(.,"${applicationName}")]
#     Click Element    //span[contains(.,"${applicationName}")]

# Click Tab
#     [Documentation]    Click the specified tab
#     [Arguments]    ${tab}
#     Wait Until Element Is Visible    //button[@type="button"][contains(.,"${tab}")]
#     Click Element    //button[@type="button"][contains(.,"${tab}")]

# Convert Value To The JSON String
#     [Documentation]    Convert value to json type
#     [Arguments]    ${value}
#     Set Test Variable    ${json_string}    ${value}
#     ${json} =    Evaluate    json.loads('''${json_string}''')    json
#     [return]    ${json}

# Get File Data
#     [Documentation]    Open file to get data and split the line feed string
#     [Arguments]    ${fileName}
#     ${filePath} =    Set Variable    ${CURDIR}/../../solution/res/data/${fileName}.txt
#     ${testData} =    Get File    ${filePath}
#     ${testData} =    Split String    ${testData}    \n
#     [Return]    ${testData}

# Get File Random String
#     [Documentation]    Read file and Get random string
#     [Arguments]    ${filename}
#     ${testData} =    Get File Data    ${filename}
#     ${testDataRows} =    Evaluate    len(${testData})
#     ${index} =    Evaluate    str(random.randint(0, ${testDataRows}-1))    random
#     [Return]    ${testData[${index}]}

# Input Confirm Password
#     [Arguments]    ${confirmPassword}
#     Wait Until Page Contains Element    name=passwordConfirmation
#     Input Text    name=passwordConfirmation    ${confirmPassword}

# Input Dialog Confirm Text
#     [Documentation]    Input the text to the specified dialog confirm text field
#     [Arguments]    ${dialog}    ${text}
#     Wait Until Page Contains Element    //input[@data-qa="Dialog-${dialog}Confirm-TextField"]
#     Input Text    //input[@data-qa="Dialog-${dialog}Confirm-TextField"]    ${text}

# Input Text By Id
#     [Arguments]     ${text}    ${id}
#     Wait Until Page Contains Element    //input[contains(@id,'${id}')]
#     Input Text    //input[contains(@id,'${id}')]    ${text}

# Input User Email
#     [Arguments]    ${email}
#     Wait Until Page Contains Element    name=email
#     Input Text    name=email    ${email}

# Input User Password
#     [Arguments]    ${password}
#     Wait Until Page Contains Element    name=password
#     Input Text    name=password    ${password}

# Input User Username
#     [Arguments]    ${email}
#     Wait Until Page Contains Element    name=username
#     Input Text    name=username    ${email}

# Input Verification Key
#     [Arguments]    ${verificationKey}
#     Wait Until Page Contains Element    name=validationKey
#     Input Text    name=validationKey    ${verificationKey}

# Select Drop Down
#     [Arguments]    ${dropDown}    ${item}
#     Click Drop Down    ${dropDown}
#     Click Drop Down Item    ${item}

# Select Drop Down For Product And Application
#     [Arguments]    ${dropDown}    ${name}    ${item}
#     Click Drop Down    ${dropDown}
#     Click Drop Down Item For Product And Application    ${name}    ${item}

# Wait Until Business Name Is Visible
#     [Documentation]    Wait until business name is visible
#     [Arguments]    ${businessName}
#     Wait Until Element Is Visible    //p[text()="${businessName}"]

# Wait Until Drop Down List Is Not Visible
#     Wait Until Page Does Not Contain Element    //body/div[last()]//span[@type="button"]/div

# Wait Until Message Popup Is Not Visible
#     [Arguments]    ${message}
#     Wait Until Element Is Not Visible    //span[contains(.,"${message}")]

# Wait Until Message Popup Is Visible
#     [Arguments]    ${message}
#     Wait Until Element Is Visible    //span[contains(.,"${message}")]

# # -------- Exo-Keyword --------
# Close New Window And Switch Back
#     [Documentation]    Close page which opened in new window and switch back
#     [Arguments]    ${title}
#     Close Window
#     Switch To Specified Window    ${title}
#     Reload Page

# Log Out
#     Go To    ${MURANO_URL}/business/logout
#     Wait Until Page Contains    You are now signed out

Open Default Browser
    Open Browser    ${MURANO_URL}    ${DEFAULT_BROWSER}
    Set Window Size    ${WINDOW_WEIGHT}    ${WINDOW_HEIGHT}

# Switch To Specified Business
#     [Documentation]    Switch to the business with specified business id
#     [Arguments]    ${companyId}
#     Wait Until Page Contains    SWITCH BUSINESS
#     Click Side Bar Link    SwitchBusiness
#     Wait Until Page Contains    Select Business
#     Click Element    //span[@data-qa="Content-BusinessList-Item-${companyId}"]

# Return To Origin Browser
#     [Documentation]    Close the current browser and return to the default browser
#     Close Browser
#     Switch Browser    1

# Switch To Specified Window
#     [Documentation]    Switch to the window with specified title
#     [Arguments]    ${title}=${EMPTY}    ${url}=${EMPTY}
#     Run Keyword If    "${title}"=="${EMPTY}" and "${url}"=="${EMPTY}"    No Operation
#     ...    ELSE IF    "${title}"=="${EMPTY}" and "${url}"!="${EMPTY}"    Select Window    url=${url}
#     ...    ELSE    Select Window    title=${title}
#     Set Window Size    ${WINDOW_WEIGHT}    ${WINDOW_HEIGHT}

# # -------- Exo-Verify --------
# Verify Alert Should Not Be Present
#     [Arguments]    ${alert}
#     ${status} =     Run Keyword And Return Status    Alert Should Be Present    ${alert}
#     Run Keyword If    ${status}    Capture Page Screenshot
#     Run Keyword If    ${status}    Fail    There alert ${alert} is shown up.

# Verify Button Can Not Be Click
#     [Documentation]    Check the button is disabled
#     [Arguments]    ${button}
#     Wait Until Page Contains Element    //button[@disabled=""][contains(.,"${button}")]
#     Page Should Contain Element    //button[@disabled=""][contains(.,"${button}")]

# Verify Device ID Is On Navigation Bar
#     [Arguments]    ${devicesID}
#     Wait Until Page Contains Element    //a[contains(.,"${devicesID}")]
#     Page Should Contain Element    //a[contains(.,"${devicesID}")]

# Verify Dialog Cancel Button Is Existing
#     [Documentation]    Check the cancel button is visible
#     [Arguments]    ${dialog}
#     Wait Until Page Contains Element    //button[@data-qa="Dialog-${dialog}Cancel-Button"]
#     Page Should Contain Element    //button[@data-qa="Dialog-${dialog}Cancel-Button"]

# Verify Dialog Confirm Button Is Existing
#     [Documentation]    Check the confrim button is visible
#     [Arguments]    ${dialog}
#     Wait Until Page Contains Element    //button[@data-qa="Dialog-${dialog}Confirm-Button"]
#     Page Should Contain Element    //button[@data-qa="Dialog-${dialog}Confirm-Button"]

# Verify Dialog Confirm Textfield Is Existing
#     [Documentation]    Check the confirm textfield is visible
#     [Arguments]    ${dialog}
#     Wait Until Page Contains Element    //input[@data-qa="Dialog-${dialog}Confirm-TextField"]
#     Page Should Contain Element    //input[@data-qa="Dialog-${dialog}Confirm-TextField"]

# Verify Dialog Selectfield Is Existing
#     [Documentation]    Check the dropdown selectfield is visible
#     [Arguments]    ${dialog}
#     Wait Until Page Contains Element    //div[@data-qa="Dialog-${dialog}-SelectField"]
#     Page Should Contain Element    //div[@data-qa="Dialog-${dialog}-SelectField"]

# Verify Dialog Textfield Is Existing
#     [Documentation]    Check the input textfield is visible
#     [Arguments]    ${dialog}
#     Wait Until Page Contains Element    //input[@data-qa="Dialog-${dialog}-TextField"]
#     Page Should Contain Element    //input[@data-qa="Dialog-${dialog}-TextField"]

# Verify Document Page Has Been Authenticated
#     [Documentation]    Check that the document site has been authenticated by auth0
#     ${status}    ${value} =    Run Keyword And Ignore Error    Switch To Specified Window    Sign in - Google Accounts
#     Run Keyword If    '${status}' == 'PASS'    Login Google Account    ${MAIL_USER}    ${MAIL_PASSWORD}

# Verify Document Popup Window Links
#     [Documentation]    Verify popup window links for document sites
#     [Arguments]    ${keyword}    ${pageTitle}    ${pageURL}    ${element}=${EMPTY}    ${title}=${EMPTY}
#     Run Keyword    ${keyword}
#     Verify Document Page Has Been Authenticated
#     Wait Until Keyword Succeeds    1m    5s    Switch To Specified Window    ${pageTitle}    ${pageURL}
#     Verify Page URL    ${pageURL}
#     Run Keyword If    "${element}"=="${EMPTY}" and "${title}"=="${EMPTY}"    No Operation
#     ...    ELSE IF    "${element}"=="${EMPTY}" and "${title}"!="${EMPTY}"    Verify Info Title As Expected    ${title}
#     ...    ELSE    Verify Page Title Is Existing    ${element}    ${title}
#     [Teardown]    Close New Window And Switch Back    Exosite Business Platform

# Verify Domain Link Should Open Domain Page In New Window
#     [Documentation]    Check the link could open domain page in new window then the title and URL show correctly
#     [Arguments]    ${title}    ${expectedURL}
#     Click Domain Link
#     Switch To Specified Window    ${title}
#     Verify Page URL    ${expectedURL}

# Verify Message
#     [Arguments]    ${message}
#     Page Should Contain    ${message}

# Verify Navigation Bar Link Text As Expected
#     [Documentation]    Check the link texts at navigation bar as expected
#     [Arguments]    @{expectedTexts}
#     ${actualText} =    Get Text    //a[@data-qa="TopNav-Item-Link"]/../..
#     @{actualText} =    Split String    ${actualText}    \n
#     Lists Should Be Equal    ${actualText}     ${expectedTexts}

# Verify New Function Button
#     [Arguments]    ${function}
#     Wait Until Page Contains Element    //button[@data-qa="Content-New${function}-Button-THeader"]
#     Page Should Contain Element    //button[@data-qa="Content-New${function}-Button-THeader"]

# Verify Page URL
#     [Documentation]    Check the URL of pages in new window
#     [Arguments]    ${expected}
#     ${currentURL} =    Get Location
#     Should Match Regexp    ${currentURL}    ${expected}

# Verify Popup Message Is Existing
#     [Documentation]    Check the popup message is visible
#     [Arguments]    ${message}
#     Wait Until Message Popup Is Visible    ${message}
#     Verify Message    ${message}

# Verify Popup Window Links
#     [Documentation]    Verify popup window links
#     [Arguments]    ${pageTitle}    ${pageURL}
#     Switch To Specified Window    ${pageTitle}
#     Verify Page URL    ${pageURL}
#     [Teardown]    Close New Window And Switch Back    Exosite Business Platform

# Verify Page Title Is Existing
#     [Documentation]    Check if the main title in the page exist
#     [Arguments]    ${elementName}    ${title}
#     Wait Until Page Contains Element    //h1[contains(.,"${elementName}")]
#     Element Text Should Be    //h1    ${title}

# Verify Product Header Button Is Existing
#     [Arguments]    ${tab}
#     Wait Until Page Contains Element    //button[@data-qa="Content-${tab}-Tab"]
#     Page Should Contain Element    //button[@data-qa="Content-${tab}-Tab"]

# Verify Response Is Contains Message
#     [Arguments]    ${response}    ${msg}
#     Should Contain    ${response}    ${msg}

# Verify Should Be Equal As Expected
#     [Documentation]     Verify response is as same as expected
#     [Arguments]    ${response}    ${expected}
#     Should Be Equal As Strings    ${response}    ${expected}

# Verify Should Be Redirected To Business Platform Page
#     [Documentation]    Verify business platform page url
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    https://.*business/memberships
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Business Product Page
#     [Documentation]    Verify business product page url
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    https://.*business/products
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Business Solution Page
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/solutions
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Dashboard Page
#     [Arguments]    ${productID}    ${deviceID}
#     Switch To Specified Window    Dashboard
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    https://dashboard.exosite.*/?product=${productID}&device=${DeviceID}
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Exchange Page
#     [Documentation]    Verify business exchange page url
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    https://.*business/exchange
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Project Devices Page
#     [Documentation]    Check the link lead to project device page
#     [Arguments]    ${SID}
#     Wait Until Page Contains    Devices
#     Verify Page URL    ${MURANO_URL}/business/connectivity/${SID}/devices

# Verify Should Be Redirected To Application Page
#     [Documentation]    Verify business application page url
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    https://.*business/application
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Business Verify Invite Page
#     [Documentation]    Verify business verify invite page url
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/verify/[0-9a-zA-Z]*/invite
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Business Verify login Page
#     [Documentation]    Verify business verify login page url
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/verify/[0-9a-zA-Z]*/login
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Exosite Documentation Page
#     [Documentation]    Verify page should be redirected to exosite documentation page
#     Select Window     title=Exosite Documentation
#     Wait Until Page Contains Element    //img[@id="logo"]
#     Select Window

# Verify Should Be Redirected To Exosite Support Page
#     Select Window     title=Exosite Support
#     Wait Until Page Contains Element    //img[@alt="Logo"]
#     Select Window

# Verify Should Be Redirected To Log Out Page
#     Wait Until Page Contains Element    //h2[text()="You are now signed out"]
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    https://.*business/logout
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Login Page
#     Wait Until Page Contains Element    //h3[contains(text(),"Sign in")]
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    https://.*auth/login
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Memberships Page
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    https://.*business/memberships
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To New Business Product Page
#     [Documentation]    Verify new business product page url
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Product Definition Page
#     [Arguments]    ${productID}
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/products/${productID}#/definition._k=[0-9a-z]{6}
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Product Detail Resource Page
#     [Arguments]    ${productID}    ${deviceID}
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/products/${productID}#/detail/${DeviceID}/resources._k=[0-9a-z]{6}
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Product Detail Tokens Page
#     [Arguments]    ${productID}    ${deviceID}
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/products/${productID}#/detail/${DeviceID}/tokens._k=[0-9a-z]{6}
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Product Devices Page
#     [Arguments]    ${productID}
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/products/${productID}#/devices._k=[0-9a-z]{6}
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Product Info Page
#     [Arguments]    ${productID}
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/products/${productID}#/info._k=[0-9a-z]{6}
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Reset Page
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/auth/resetPassword
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Settings Billing Page
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/settings/billing
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Account Profile Page
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    https://.*account/profile
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To My Business Page
#     Wait Until Page Contains Element    //h1[text()="Settings"]
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/settings/my-business
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Settings Team Page
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    https://.*settings/team
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Signup Page
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    https://.*oldui/signup
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Application Debug Page
#     [Arguments]    ${applicationID}
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/applications/${applicationID}#/debug._k=[0-9a-z]{6}
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Application Getting Started Page
#     [Arguments]    ${applicationID}
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/applications/${applicationID}#/getting-started._k=[0-9a-z]{6}
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Application Hosting Page
#     [Arguments]    ${applicationID}
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/applications/${applicationID}#/hosting._k=[0-9a-z]{6}
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Business Application Page
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/applications
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Application Routes Page
#     [Arguments]    ${applicationID}
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/applications/${applicationID}#/routes._k=[0-9a-z]{6}
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Application Services Page
#     [Arguments]    ${applicationID}
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/applications/${applicationID}#/services._k=[0-9a-z]{6}
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Application Users Page
#     [Arguments]    ${applicationID}
#     ${url} =    Get Location
#     ${pattern} =    Set Variable    ${MURANO_URL}/business/applications/${applicationID}#/users._k=[0-9a-z]{6}
#     Should Match Regexp    ${url}    ${pattern}

# Verify Should Be Redirected To Sorry An Error Occurred Page
#     Wait Until Page Contains Element    //h1[contains(.,"Sorry, an error occurred")]
#     Page Should Contain    Sorry, an error occurred

# Verify Should Be Redirected To Sorry That Page Was Not Found Page
#     Wait Until Page Contains Element    //h1[contains(.,"Sorry, that page was not found")]
#     Page Should Contain    Sorry, that page was not found

# Verify Should Be Redirected To 404 Not Found Page
#     Wait Until Page Contains Element    //h1[contains(.,"404 Not Found")]
#     Page Should Contain    404 Not Found

# Verify Tab Highlight As Expected
#     [Documentation]    Verify Tab is highlighted in correct color.
#     [Arguments]    ${tab}    ${rgb}
#     ${style} =    Get element attribute    //button[@data-qa="Content-${tab}-Tab"]@style
#     Should Contain    ${style}    ${rgb}

# Verify Upgrade Button Is Exist
#     [Documentation]    Verify community account create a new product or application when at their maximum will appear upgrade
#     Wait Until Page Contains Element    //button[@data-qa="Dialog-ProjectLimitUpgrade-Button"]
#     Page Should Contain Element    //button[@data-qa="Dialog-ProjectLimitUpgrade-Button"]
