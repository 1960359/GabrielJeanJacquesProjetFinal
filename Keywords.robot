*** Settings ***
Library           SeleniumLibrary
Library           DateTime
Library           String
Variables         ../Locators/LocatorsTutorial.py



*** Variables ***
${TIMEOUT}        5sg
${vURL}         = http://tutorialsninja.com/demo/index.php?route=common/home
${vBrowser}       chrome
${vSitesFileName}    Ressources/Datapool/ListeSites.txt
${vSitesForDelFileName}    Ressources/Datapool/ListeSup.txt

*** Keywords ***

Login
    # vURL contient l'adresse URL de la page web
    # vBrowser contient l'identifiant du navigateur cible
   
    Set Selenium Timeout    ${TIMEOUT}
    # Ouvrir le navigateur en precisant l'URL et le navigateur
    Open Browser    ${lnk_webpage}    ${txt_Browser}
    # Maximiser la fenetre du navigateur
    Maximize Browser Window
    # Saisie du login
    Wait Until Element Is Visible    ${lnk_Title}
    # S'assurer que l'utilisateur est connecte et que le tableau de bord est affiche
    #Element Should Contain    ${lblTitle}    Tableau de bord de

Logout
    sleep    3s
    [Teardown]    Close Browser

Login with with valid account
    # L'utilisateur ne peut pas enregister un compte en double
    Wait Until Element Is Visible    ${lnk_MyAcount}
    Click Element   ${lnk_MyAcount}
    
    Wait Until Element Is Visible    ${lnk_Login}
    Click Element   ${lnk_Login}

    Wait Until Element Is Visible    ${txt_TitleReturningCustomer}

    Input Text    ${txt_ReturningCustomerEmail}    1960359@bdeb.qc.ca
    Input Password    ${txt_ReturningCustomerPassword}    password
    Click Button    ${btn_ReturningCustomerLogin}    

    Sleep    2s
    Page Should Contain Element    ${txt_MyAccount}
search valide
    [Arguments]    ${vSearch}
    Input Text    ${txt_search}    ${vSearch}
    Sleep    2s
    Click Button    ${btn_search}
    Page Should Contain Element   ${txt_SearchResultPage1}${vSearch}${txt_SearchResultPage2}

search invalide
    [Arguments]    ${vSearch}
    Input Text    ${txt_search}    ${vSearch}
    Sleep    2s
    Click Button    ${btn_search}
    Page Should Contain Element   ${txt_SearchResultPage1}${vSearch}${txt_SearchResultPage2}
    Page Should Contain Element   ${txt_searchNoProduct}

Exigence 1
    # L'utilisateur s'inscrit dans lapplication en fournissant 
    # tous les champs obligatoires
    [Arguments]    ${vName}    ${vLastname}    ${vEmail}    ${vPhone}    ${vPassword}
    Wait Until Element Is Visible    ${lnk_MyAcount}
    Click Element   ${lnk_MyAcount}
    Sleep  2s 
    Wait Until Element Is Visible    ${lnk_Register}
    Click Element   ${lnk_Register}
    
    # Register Utilisateur
    Wait Until Element Is Visible    ${lnk_RegisterAccount}

    Input Text    ${txt_FirstName}    ${vName}
    Input Text    ${txt_LastName}    ${vLastname}
    Input Text    ${txt_Email}    ${vEmail}     #1960359@bdeb.qc.ca
    Input Text    ${txt_Telephone}    ${vPhone}

    Input Password    ${txt_Password}    ${vPassword}
    Input Password    ${txt_ConfirmPassword}    ${vPassword}
    
    Click Element   ${btn_Policy}
    Click Button    ${btn_ContinueRegister}

    Sleep    2s
    Page Should Contain Element    ${txt_AccountCreatedComfirmation}

Exigence 2
    # L'utilisateur s'inscrit dans lapplication en fournissant 
    # tous les champs obligatoires et en optant pour labonnement a la news letter
    [Arguments]    ${vName}    ${vLastname}    ${vEmail}    ${vPhone}    ${vPassword}
    Wait Until Element Is Visible    ${lnk_MyAcount}
    Click Element   ${lnk_MyAcount}

    Wait Until Element Is Visible    ${lnk_Register}
    Click Element   ${lnk_Register}
    
    # Register Utilisateur
    Wait Until Element Is Visible    ${lnk_RegisterAccount}

    Input Text    ${txt_FirstName}    ${vName}
    Input Text    ${txt_LastName}    ${vLastname}
    Input Text    ${txt_Email}    ${vEmail}
    Input Text    ${txt_Telephone}    ${vPhone}

    Input Password    ${txt_Password}    ${vPassword}
    Input Password    ${txt_ConfirmPassword}    ${vPassword}
    
    Click Element    ${opt_SubscibeYes}
    Click Element   ${btn_Policy}
    Click Button    ${btn_ContinueRegister}
    
    Sleep    2s
    Page Should Contain Element    ${txt_AccountCreatedComfirmation}


Exigence 3
    # L'utilisateur s'inscrit dans lapplication en fournissant 
    # tous les champs obligatoires
    [Arguments]    ${vName}    ${vLastname}    ${vEmail}    ${vPhone}    ${vPassword}
    Wait Until Element Is Visible    ${lnk_MyAcount}
    Click Element   ${lnk_MyAcount}
    Wait Until Element Is Visible    ${lnk_Register}
    Click Element   ${lnk_Register}
    
    # Register Utilisateur
    Wait Until Element Is Visible    ${lnk_RegisterAccount}

    Input Text    ${txt_FirstName}    ${vName}
    Input Text    ${txt_LastName}    ${vLastname}
    Input Text    ${txt_Email}    ${vEmail}
    Input Text    ${txt_Telephone}    ${vPhone}

    Input Password    ${txt_Password}    ${vPassword}
    Input Password    ${txt_ConfirmPassword}    ${vPassword}
    
    Click Element   ${btn_Policy}
    Click Button    ${btn_ContinueRegister}

    Sleep    2s
    Page Should Contain Element    ${txt_AccountAlreadyRegistered}

Exigence 4
    # L'utilisateur ne peut pas enregister un compte en double
    [Arguments]    ${vEmail}    ${vPassword}
    Wait Until Element Is Visible    ${lnk_MyAcount}
    Click Element   ${lnk_MyAcount}
    
    Wait Until Element Is Visible    ${lnk_Login}
    Click Element   ${lnk_Login}

    Wait Until Element Is Visible    ${txt_TitleReturningCustomer}

    Input Text    ${txt_ReturningCustomerEmail}    ${vEmail}
    Input Password    ${txt_ReturningCustomerPassword}    ${vPassword}
    Click Button    ${btn_ReturningCustomerLogin}    

    Sleep    2s
    Page Should Contain Element    ${txt_MyAccount}

Exigence 5
    # l'utilisateur est en mesure de réinitialiser le mot de passe oublié
    [Arguments]    ${vEmail} 
    Wait Until Element Is Visible    ${lnk_MyAcount}
    Click Element   ${lnk_MyAcount}
    
    Wait Until Element Is Visible    ${lnk_Login}
    Click Element   ${lnk_Login}

    Wait Until Element Is Visible    ${txt_TitleReturningCustomer}

    Input Text    ${txt_ReturningCustomerEmail}    ${vEmail} 

    Click Element    ${lnk_forgottenPassword}    

    Sleep    2s
    Page Should Contain Element    ${txt_ForgotYourPasswordTitle}
    
    Input Text    ${txt_ForgotYourPasswordEmail}    ${vEmail} 
    Click Button    ${txt_ForgotYourPasswordContinue}

    Sleep    2s
    Page Should Contain Element    ${txt_ForgotYourPasswordComfirmationLink}

Exigence 6
    [Arguments]    ${vSearch}
    Login with with valid account
    search valide    ${vSearch}

Exigence 7
    [Arguments]    ${vSearch}
    Login with with valid account
    search invalide    ${vSearch}