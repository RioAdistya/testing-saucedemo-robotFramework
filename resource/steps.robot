*** Settings ***
Library         SeleniumLibrary
Variables       variabel.py


*** Keywords ***
User Login with valid Username/password
    Open Browser    ${WebSauceDemo}    ${BROWSER}
    Input Text    ${txtUsername}    standard_user
    Input Text    ${txtPassword}    secret_sauce
    Click Element    ${btnLogin}
    Sleep    1s
    Page Should Contain    Sauce Labs Backpack
    Close Browser

User Login with invalid Username/password
    Open Browser    ${WebSauceDemo}    ${BROWSER}
    Input Text    ${txtUsername}    standard_user
    Input Text    ${txtPassword}    123
    Click Element    ${btnLogin}
    Sleep    1s
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Close Browser

User a Logout
    Open Browser    ${WebSauceDemo}    ${BROWSER}
    Input Text    ${txtUsername}    standard_user
    Input Text    ${txtPassword}    secret_sauce
    Click Element    ${btnLogin}
    Sleep    1s
    Page Should Contain    Sauce Labs Backpack
    Click Element    ${btnMenu}
    Click Element    ${btnLogout}
    Close Browser

User checkout many product
    Open Browser    ${WebSauceDemo}    ${BROWSER}
    Input Text    ${txtUsername}    standard_user
    Input Text    ${txtPassword}    secret_sauce
    Click Element    ${btnLogin}
    Sleep    1s
    Page Should Contain    Sauce Labs Backpack
    Click Element    ${addToCartFleeceJacket}
    Click Element    ${imgOnesie}
    Click Element    ${addToCartOnesie}
    Click Element    ${btnBackProduct}
    Click Element    ${btnCart}
    Page Should Contain    Your Cart
    Click Element    ${btnCheckout}
    Page Should Contain    Checkout: Your Information
    Input Text    ${txtFirstname}    first
    Input Text    ${txtlastname}    last
    Input Text    ${txtZip}    ini zip
    Click Element    ${btnContinue}
    Page Should Contain    Checkout: Overview
    Click Element    ${btnFinish}
    Page Should Contain    Checkout: Complete!
    Click Element    ${btnBackHome}
    Page Should Contain    Products
    Close Browser
