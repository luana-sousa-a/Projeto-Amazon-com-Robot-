*** Settings ***
Library     SeleniumLibrary
Resource     amazon_hook.robot

# *****************************************CASO DE TESTE COM BDD*************************************************
#                             *********TESTE 1- VERIFICAR MENU "ELETRÔNICOS"**********
*** Variables ***
${MENU_ELETRONICOS}    //a[contains(text(),'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
# ${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia


*** Keywords ***

que estou na home page da Amazon.com.br
    Wait Until Element Is Visible    locator=//a[contains(@class,'nav-logo-link nav-progressive-attribute')]

acessar o menu "Eletrônicos"
    Sleep    2s
    Click Element    locator=${MENU_ELETRONICOS}

o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Wait Until Element Is Visible    locator=//h1[contains(.,'Eletrônicos e Tecnologia')]  

a categoria "Computadores e Informática" deve ser exibida na página
     Wait Until Element Is Visible    locator=//a[@aria-label="Computadores e Informática"]

#                                 *********TESTE 2- PESQUISA DE UM PRODUTO**********

pesquisar pelo produto "Xbox Series S"
    Click Element    locator=//input[contains(@type,'text')] 
    Input Text    locator=//input[contains(@type,'text')]     text=Xbox Series S
    Click Element    locator=//input[contains(@value,'Ir')]
    
um produto da linha "Xbox Series S" deve ser mostrado na página
    Sleep    2s
    Wait Until Element Is Visible    locator=(//span[contains(.,'Console Xbox Series S')])[2]  


#                     *********TESTE 3- PESQUISA DE UM PRODUTO E ADICIONA NO CARRINHO**********

pesquisar pelo produto "${PRODUTO}"
    Click Element    locator=//input[contains(@type,'text')] 
    Input Text    locator=//input[contains(@type,'text')]     text=${PRODUTO}
    Click Element    locator=//input[contains(@value,'Ir')]

verificar o resultado da pesquisa se está listando o produto "${GARRAFA_TERMICA}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${GARRAFA_TERMICA}')])[2]
    Click Element    locator=(//span[contains(.,'${GARRAFA_TERMICA}')])[2]
    Sleep    3S
   
adicionar o produto "${GARRAFA_TERMICA}" no carrinho 
    Click Button    locator=//*[@id='add-to-cart-button']

verificar se o produto foi adicionado com sucesso 
    Click Element    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
    Wait Until Element Is Visible    locator=//h1[contains(.,'Carrinho de compras')]
    Wait Until Element Is Visible    locator=(//span[contains(.,'Garrafa Térmica Tramontina Exata 1L Preto')])[5]
    


#                                *********TESTE 4- REMOVE PRODUTO DO CARRINHO **********

remover o produto "Garrafa Térmica de Inox Parede Dupla Prata 500ml" no carrinho 
    Click Button    locator=//input[@value='Excluir']
    Wait Until Element Is Visible    locator=//h1[contains(.,'Carrinho de compras')]

verifica se o carrinho fica vazio 
    Wait Until Element Is Visible    locator=//h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')]   timeout=5


#                    *********TESTE 5- ADICIONAR DOIS PRODUTOS NO CARRINHO E REMOVER**********

pesquisar pelo produto "Celular"
    Click Element    locator=//input[contains(@type,'text')] 
    Input Text    locator=//input[contains(@type,'text')]     text=Celular
    Click Element    locator=//input[contains(@value,'Ir')]

verificar o resultado da pesquisa se está listando o produto "Smartphone Motorola Moto G22 128GB 4GB RAM Azul"  
    Wait Until Element Is Visible    locator=(//span[contains(.,'Smartphone Motorola Moto G22 128GB 4GB RAM Azul')])[2]  
    Click Element    locator=(//span[contains(.,'Smartphone Motorola Moto G22 128GB 4GB RAM Azul')])[2]


adicionar o produto "Smartphone Motorola Moto G22 128GB 4GB RAM Azul" no carrinho  
    Wait Until Element Is Visible    locator=//*[@id='add-to-cart-button']
    Click Button    locator=//*[@id='add-to-cart-button']
    Sleep    5s 
    Wait Until Element Is Visible    locator=//span[contains(.,'Seguro contra Roubo, Furto e Quebra')]
    Click Button    locator=//input[contains(@aria-labelledby,'attachSiNoCoverage-announce')]

pesquisar pelo produto "Chapinha"
    Click Element    locator=//input[contains(@type,'text')] 
    Input Text    locator=//input[contains(@type,'text')]     text=Chapinha
    Click Element    locator=//input[contains(@type,'submit')]
   
adicionar o produto "Chapinha Titanium Pro 480 Bivolt MQ Hair" no carrinho
    Wait Until Element Is Visible    locator=(//span[contains(.,'Chapinha Titanium Pro 480 Bivolt MQ Hair')])[2]
    Click Element    locator=(//span[contains(.,'Chapinha Titanium Pro 480 Bivolt MQ Hair')])[2]
    Wait Until Element Is Visible    locator=//*[@id='add-to-cart-button']
    Click Button    locator=//*[@id='add-to-cart-button']

verificar se os produtos foram adicionados com sucesso 
     Click Element    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
     Wait Until Element Is Visible    locator=//h1[contains(.,'Carrinho de compras')]  timeout=5   
     Wait Until Element Is Visible    locator=(//span[contains(.,'Smartphone Motorola Moto G22 128GB 4GB RAM Azul')])[5]
     Wait Until Element Is Visible    locator=(//span[contains(.,'Chapinha Titanium Pro 480 Bivolt MQ Hair')])[7]

remover os dois produtos adicionados no carrinho
    Click Button    locator=//input[@value='Excluir']
    Sleep    1s
    Click Button    locator=//input[@value='Excluir']
    Sleep    5s

verificar se o carrinho está vazio
    Wait Until Element Is Visible    locator=//h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')]
   

    
