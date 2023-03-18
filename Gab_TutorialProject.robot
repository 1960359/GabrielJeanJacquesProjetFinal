*** Settings ***
Documentation     Fichiers de scripts pour le module RQ3 : Sites.
Library           SeleniumLibrary
Library           DateTime
Library           String
Library           Dialogs
Library           OperatingSystem
Library           Collections
Resource          ../Ressources/Keywords/keywords.robot

Suite Setup    Login
Suite Teardown    Logout
  
*** Variables ***
${TIMEOUT}        3s
${vSitesFileName}    Ressources/Datapool/ListeSites.txt
${vSitesForDelFileName}    Ressources/Datapool/ListeSup.txt
*** Test Cases ***    

cas 1
    Exigence 1    Gabriel    Jean-Jacques    irinavladar@rjostre.com    613-555-0178    Password 

cas 2
    Exigence 1    Gabriel    Jean-Jacques    fn4f3@baghehonar.art    613-555-0178    Password 


cas 3
    Exigence 1    Gabriel    Jean-Jacques    irinavladar@rjostre.com    613-555-0178    Password 

cas 4
    Exigence 4    1960359@bdeb.qc.ca    password

cas 5
    Exigence 5    1960359@bdeb.qc.ca


cas 6
    Exigence 6    samsung


cas 7
    Exigence 7    samsungGWWW

    