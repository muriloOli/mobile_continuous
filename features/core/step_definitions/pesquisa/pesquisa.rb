Dado("que o usuario acesse a tela home") do
  @home_screen.check_logo
end

Dado("toque no campo de pesquisa") do
  @home_screen.tap_address_field
end

Dado("que o usuario preencha o local de pesquisa ex: {string}") do |example|
  @pesquisa_screen.fill_address example
end

Quando("ele escolher o local sugerido") do
  @pesquisa_screen.tap_first_location
end

Entao("o botao view list deve ser apresentado") do
  @pesquisa_screen.button_available
end