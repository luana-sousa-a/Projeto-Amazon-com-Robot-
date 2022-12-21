# *****************************************CASO DE TESTE COM BDD***************************************************
*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br
Resource         amazon_resources_bdd.robot
Resource         ./gherking_ptbr.robot
Resource         amazon_hook.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador  


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu eletrônicos do site da Amazon.com.br  
    ...                e verifica a categoria Computadores e Informática   
    [Tags]    TC001         menus    categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Então a categoria "Computadores e Informática" deve ser exibida na página


Caso de Teste 02 - Pesquisa de um Produto
     [Documentation]    Esse teste verifica a busca de um produto
     [Tags]    TC002         busca_produtos    lista _busca
     Dado que estou na home page da Amazon.com.br
     Quando pesquisar pelo produto "Xbox Series S"
     Então um produto da linha "Xbox Series S" deve ser mostrado na página
    
Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]      TC003       adicionar_carrinho  
    Dado que estou na home page da Amazon.com.br 
    Quando pesquisar pelo produto "Garrafa Térmica"
    E verificar o resultado da pesquisa se está listando o produto "Garrafa Térmica Tramontina Exata 1L Preto"
    E adicionar o produto "Garrafa Térmica Tramontina Exata 1L Preto" no carrinho 
    Então verificar se o produto foi adicionado com sucesso 

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]     TC004        remover_carrinho   
    Dado que estou na home page da Amazon.com.br 
    Quando pesquisar pelo produto "Garrafa Térmica"
    E verificar o resultado da pesquisa se está listando o produto "Garrafa Térmica Tramontina Exata 1L Preto"
    E adicionar o produto "Garrafa Térmica Tramontina Exata 1L Preto" no carrinho 
    E verificar se o produto foi adicionado com sucesso 
    E remover o produto "Garrafa Térmica de Inox Parede Dupla Prata 500ml" no carrinho 
    Então verifica se o carrinho fica vazio

Caso de Teste 05 - Adicionar dois Produtos no Carrinho e Remover
    [Documentation]    Esse teste verifica a adição de dois produtos no carrinho de compras
...                      e a remoção deles      
    [Tags]     TC005        adicionar_dois_produtos
    Dado que estou na home page da Amazon.com.br 
    Quando pesquisar pelo produto "Celular" 
    E verificar o resultado da pesquisa se está listando o produto "Smartphone Motorola Moto G22 128GB 4GB RAM Azul"
    E adicionar o produto "Smartphone Motorola Moto G22 128GB 4GB RAM Azul" no carrinho
    E pesquisar pelo produto "Chapinha"
    E adicionar o produto "Chapinha Titanium Pro 480 Bivolt MQ Hair" no carrinho
    E verificar se os produtos foram adicionados com sucesso
    E remover os dois produtos adicionados no carrinho
    Então verificar se o carrinho está vazio     
