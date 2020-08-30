## Recursos Utilizados

`Ubuntu 18.04`

`Ruby 2.6.3`

`rails 6.0.3`

`PostgreSQL 12.4`

`node 14.8.0`

`yarn 1.22.4`

## Criando um projeto Rails

Para iniciar este projeto, o comando utilizado foi:

``` rails new desafio-costumerx -T --database=postgresql ```

A flag `-T` indica que não será usada a configuração padrão de testes dos Rails
(será utilizada a gem `rspec-rails`).

A flag `--database=postgresql` indica ao ActiveRecord que o banco de dados 
utilizado será o PostgreSQL.

## Configurando o projeto

Clone o projeto:

``` git clone https://github.com/yosh1tsune/desafio-costumerx.git ```

Acesse a pasta raiz:

``` cd desafio-costumerx ```

Rode o seguinte comando para instalar as dependencias do node_modules:

``` yarn install ```

Rode o seguinte comando para instalar as gems e dependências e iniciar o banco
de dados:

``` bin/setup ```

Para visualizar o projeto, rode o comando:

``` rails server ```

Por padrão, a aplicação ficará hospedada na porta http://localhost:3000

## Escopo (esses passos não precisam ser repetidos)

### Autenticação

Para realizar a autenticação do sistema será utilizada a `gem 'devise'`.

Os passos de instalação, recursos e utilização podem ser encontrados no
reposítório da gem: https://github.com/heartcombo/devise

Com o devise é possível criar um model com funcionalidades prontas para 
registro, login, logout, lembrar senha, recuperação de senha, entre outros,
podendo também serem alterador manualmente de acordo com a regra de negócios 
do projeto.

### Testes

Para realizar os testes, será utilizada a `gem 'rspec-rails'`.

Os passos de instalação, recursos e utilização podem ser encontrados no
reposítório da gem: https://github.com/rspec/rspec-rails

Para realizar os testes rode os comandos:

`rspec` para rodar todos os testes.

`rspec spec/**/*` para roda um arquivo especifico.

`rspec spec/**/*:4` para roda um único teste dentro de um arquivo específico,
onde `4` pode ser substituido pelo número da linha em que o teste é iniciado.

### Front-End

Para o front-end será utilizada a biblioteca de CSS Bootstrap; como o CSS é
dependente do jQuery e do Popper.js os três serão adicionados via yarn com o
seguinte comando:

`yarn add bootstrap@4.4.1 jquery@3.4.1 popper.js@1.16.1`

Após os pacotes serem adicionados ao projeto, é preciso ensinar o Rails a 
carregá-los, importando as bibliotecas do Bootstrap no arquivo 
`app/javascript/packs/application.js` e colocando o jQuery e o Popper.js no
webpacker, através da configuração feita no arquivo 
`config/webpack/environment.js`.
Assim, as três bibliotecas estarão prontas para serem utilizadas.

### Models

O projeto conta com três models, sendo eles:

Model User, gerado atravez do Devise:

`rails generate devise user`

Model Client, gerado pelo ActiveRecord:

`rails generate model client name email secondary_email phone
comercial_phone`

Model Contacts, pertencente ao Client e gerado pelo ActiveRecord:

`rails generate model contact name email secondary_email phone
comercial_phone client:references`

### Funcionalidades

TODAS as ações, incluindo visualização de listas, necessitam de
autenticação. Caso alguma rota seja acessada sem o usuário estar
autenticado, será redirecionado para tela de login.

Após devidamente logado o usuário estará livre para navegar pelo sistema
e realizar todas as operaçes do CRUD de clientes e contatos.
