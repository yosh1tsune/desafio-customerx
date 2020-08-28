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

## Autenticação

Para realizar a autenticação do sistema será utilizada a `gem 'devise'`.

A configuração do devise só precisa ser realizada uma vez, e portanto não é
necessário repetir.

Os passos de instalação, recursos e utilização podem ser encontrados no
reposítório da gem: https://github.com/heartcombo/devise

O devise criará um model User com funcionalidades de registro, login, logout,
lembrar senha, recuperação de senha, entre outros.

## Testes

Para realizar os testes, será utilizada a `gem 'rspec-rails'`.
A configuração do rspec também só precisa ser realizada uma única vez.

Os passos de instalação, recursos e utilização podem ser encontrados no
reposítório da gem: https://github.com/rspec/rspec-rails

Para realizar os testes rode os comandos:

`rspec` para rodar todos os testes.

`rspec spec/**/**` para roda um arquivo especifico.

`rspec spec/**/**:4` para roda um único teste dentro de um arquivo específico,
onde `4` pode ser substituido pelo número da linha em que o teste é iniciado.
