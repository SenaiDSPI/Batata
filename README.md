# Restarting

## Requisitos

* ruby v2.2.6+
* Rails v5.0.7+
* node.js v8.9.3+

## Baixando

Para baixar o projeto insira o seguinte código no cmd(ou equivalente): <br>
` git clone http://github.com/SenaiDSPI/Batata.git `<br>
` cd project_in_rails `<br>
` bundle install `<br>
*Obs: Para esta forma funcionar você deve ter o git instalado e seu path adicionado a sua maquina.<br>
**Obs: Este código irá baixar o projeto na pasta na qual o cmd estiver apontando.<br>

## Gerar banco de dados

Use: <br>
` Rails db:migrate ` <br>
Para gerar o banco no formato pré definido pelo sistema. <br>
*Obs: O banco será produzido em postgresql. <br>
**Obs: O servidor do postgresql deve estar levantado antes dos comandos. <br>

## Rodando o servidor

Use:<br>
` rails s ` <br>
Para levantar o servidor. <br>
*Obs: Para acessar digite em seu navegador: _localhost:3000_ <br>
**Obs: Para encerrar as atividades do servidor use: 'Crtl' + 'C' <br>
