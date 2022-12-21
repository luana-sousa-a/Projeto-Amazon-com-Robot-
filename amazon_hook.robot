*** Settings ***
Library    SeleniumLibrary


*** Keywords ***

Abrir o navegador   
    Open Browser    browser=chrome
    Maximize Browser Window 
    Go To    url=https://www.amazon.com.br

Fechar o navegador
    Close Browser    

