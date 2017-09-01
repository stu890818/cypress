*** Keywords ***
# -------- Element --------
Input Customer Service Account
    [Arguments]    ${account}
    Wait Until Page Contains Element    //*[@id="root"]//div[1]/div[2]/div/input
    Input Text    //*[@id="root"]//div[1]/div[2]/div/input    ${account}

Input Customer Service Password
    [Arguments]    ${password}
    Wait Until Page Contains Element    //*[@id="root"]//div[2]/div[2]/div/input
    Input Text    //*[@id="root"]//div[2]/div[2]/div/input    ${password}

Input Customer Service Nick Name
    [Arguments]    ${nickName}
    Wait Until Page Contains Element    //*[@id="root"]//div[3]/div[2]/div/input
    Input Text    //*[@id="root"]//div[3]/div[2]/div/input    ${nickName}

# -------- Exo-Keyword --------
Create Customer Service
    [Arguments]    ${account}    ${password}    ${nickName}
    Input Customer Service Account    ${account}
    Input Customer Service Password    ${password}
    Input Customer Service Nick Name    ${nickName}
    Click 确定 Button

Go To CS Create Page
    [Arguments]    ${domain}
    Go To    ${domain}/#/cs/create
    Wait Until Element Contains    //*[@id="root"]/div/div[3]/div[2]/div[1]/span[2]    新增客服

# -------- Exo-Verify --------
Verify The Customer Service Create Success
    Wait Until Element Is Visible    /div/div/div/div
    Wait Until Element Is Not Visible    /div/div/div/div