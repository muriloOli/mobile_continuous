# mobile_continuous_test
Em busca de uma Integração Continua, aqui utilizaremos, testes automatizados em Ruby para a plataforma Android, Orquestrados por Gherkin/Cucumber e Jenkins


## Configurando o ambiente de trabalho!!

Mac:

#### Instalando Xcode

Baixar o Xcode [clicando nesse link](https://developer.apple.com/xcode/downloads/). 

Depois do Xcode, baixar o Homebrew via terminal com o comando:


```
ruby -e “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)” .
```


Reinicie a máquina (isso mesmo, para “completar as instalações”).

#### Instalar o gerenciador de versões RVM:


```ruby
1. gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
2. curl -sSL https://get.rvm.io | bash -s stable
3. Reiniciar o terminal
4. rvm install(para instalar a versão mais recente, caso necessite instalar uma versão especifica descreva "rvm install 2.2.2")

Caso o "curl" não estiver instalado, basta "brew install curl".
```


Ubuntu:

#### Instalar o gerenciador de versões RVM:


```ruby
1. gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
2. curl -sSL https://get.rvm.io | bash -s stable
3. Reiniciar o terminal
4. rvm install(para instalar a versão mais recente, caso necessite instalar uma versão especifica descreva "rvm install 2.2.2")

Caso o "curl" não estiver instalado, basta "brew install curl".
```

Com o ruby instalado, instalar as principais gems para nosso contexto, o bundler e cucumber:


```ruby
gem install bundler
gem install cucumber
```

#### Baixando o jdk da oracle

Baixar o jdk 8 para evitar problemas de conflito

[Download java 8 Oracle clicando nesse link](https://www.oracle.com/java/technologies/javase-jdk8-downloads.html)


#### Instalando Android Studio

Após instalar o jdk e configurar as variaveis de ambiente do java,
temos que instalar o android studio

[Download Android Studio clicando nesse link](https://developer.android.com/studio)


#### Instalando Appium

Agora vamos instalar o Appium, framework que vamos utilizar para nossa automação mobile:
Por questões de conflitos e problema com alguns comandos, não estamos utilizando a ultima versão.

[Download appium v1.13.0 clicando nesse link](https://github.com/appium/appium-desktop/releases/tag/v1.13.0)



Vamos fazer o clone do repositório:

Após o clone acessar a pasta do projeto e no diretório onde tem o arquivo **Gemfile**, executar o comando:


```ruby
bundle install
```

#### Executando o projeto

Para executar o projeto abra o terminal na pasta do projeto e execute o comando:

Para android:
```ruby
rake run_acceptance[android,@tag]
```

Para IOS:
```ruby
rake run_acceptance[ios,@tag]
```

Caso haja alguma duvida na instalação, recomendo a leitura desse artigo para configuração:

[Configurar ambiente para automação com appium](https://medium.com/qaninja/configurando-o-ambiente-para-executar-o-appium-788eb0002ce9)


