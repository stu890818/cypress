*** Keywords ***
# -------- Element --------

# -------- Exo-Keyword --------
Go To CS List Page
    [Arguments]    ${domain}
    Go To    ${domain}/#/cs/list
    Wait Until Element Contains    //*[@id="root"]/div/div[3]/div[2]/div[1]/span[2]    客服列表

# -------- Exo-Verify --------
Verify The CS Exist In The Customer Service List
    [Arguments]    ${csAccount}
    Wait Until Page Contains Element    //a[contains(.,'${csAccount}')]
    Page Should Contain Element    //a[contains(.,'${csAccount}')]