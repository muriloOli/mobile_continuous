#language: pt
#encoding: utf-8
@pesquisa
Funcionalidade: Pesquisa de imoveis
Eu como cliente
Quero pesquisar imóveis que esteja à venda ou aluguel
Para contactar o agent que desejo aludar ou comprar 

Contexto: Acessar a tela de pesquisa
    Dado que o usuario acesse a tela home
    E toque no campo de pesquisa
@doing
Cenario: Pesquisar imovel
Dado que o usuario preencha o local de pesquisa ex: "Compton"
Quando ele escolher o local sugerido
Entao o botao view list deve ser apresentado


Cenario: Acessar os detalhes de um imovel
Dado que o usuario tenha pesquisado um imovel
Quando ele tocar no imovel disponibilizado na lista
Entao o aplicativo deve apresentar os detalhes do imovel 


Cenario: Favoritar imovel
Dado que o usuario tenha acessado os detalhes do imovel
Quando ele tocar no botao de Favoritar
Entao o aplicativo deve apresentar o imovel escolhido na lista de imoveis favoritados
