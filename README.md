# Pay TV System – Sistema de Faturamento por Assinatura

Este projeto é um sistema de gerenciamento de assinaturas para clientes, com geração automática de faturas e carnê. O foco principal é facilitar o controle de cobranças recorrentes e organizar as faturas em ciclos mensais agrupados por assinatura.

## 📌 Descrição do Projeto

O sistema foi desenvolvido em Ruby on Rails. Cada cliente pode possuir assinaturas (`Subscription`). A cada nova assinatura, o sistema gera automaticamente um `Booklet`, que representa um carnê de pagamentos, contendo 12 `Invoices` mensais.

O sistema conta com:
- CRUD de clientes, planos, pacotes, assinaturas, contas, faturas e carnês.
- Modelagem com uso de join_table e associações polimórficas. 
- Geração automática de contas, faturas e carnê ao criar uma assinatura.
- Visualização das faturas de um carnê específico.
- Navegação entre as telas de clientes, planos, pacotes, assinaturas, faturas e carnê correspondente.
- Interface simples com HTML e ERB.

## 📊 Diagrama da assinatura(`Subscription`)

O sistema permite ao cliente montar uma assinatura de três formas distintas:

<img width="2570" height="1158" alt="image" src="https://github.com/user-attachments/assets/4dd8230b-5a0b-4d32-bc28-4b9d0748cc4e" />


## ✅ Pré-requisitos

Antes de iniciar, certifique-se de ter os seguintes itens instalados:

- Ruby 3.3.0
- Rails 8.0
- SQLite3 
- Bundler

## 🛠️ Instalação

Clone o projeto e siga os passos abaixo:

```bash
git clone https://github.com/lukascoradin/pay_tv_system.git

cd pay_tv_system
```

Instale as dependências:

```bash
bundle install
```

Configure o banco de dados:

```bash
rails db:create
rails db:migrate
rails db:seed
```

## 🚀 Implantação

Para executar o sistema localmente:

```bash
rails server
```
Acesse via: http://localhost:3000


## 🧑‍💻 Autor
Desenvolvido por José Lucas Coradin
