# Comanda Digital - Modelo Físico de Dados

## Descrição do Projeto
Este projeto representa o modelo físico de dados para um sistema de comanda digital, desenvolvido em MySQL.

### Estrutura do Banco de Dados
- *Tabela dishes:* Representa os pratos disponíveis no sistema.
- *Tabela pedido:* Registra os pedidos feitos pelos clientes.

### Relacionamentos
- A tabela pedido possui uma relação opcional com dishes, via a chave estrangeira dish_id.

## Como Executar
1. Certifique-se de ter o MySQL instalado.
2. Execute o script estrutura.sql em um cliente MySQL, como o MySQL Workbench.
3. O banco de dados será criado automaticamente no esquema comanda_digital.

## Modelo Físico
O diagrama do modelo físico está disponível na pasta MFD/ como modelo_fisico.pdf
