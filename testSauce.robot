*** Settings ***
Library     SeleniumLibrary
Resource    resource/steps.robot


*** Test Cases ***
User Login
    User Login with valid Username/password
    User Login with invalid Username/password

User Logout
    User a Logout

User checkout
    User checkout many product
