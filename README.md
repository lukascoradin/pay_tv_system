# Pay TV System – Sistema de Faturamento por Assinatura

Este projeto é um sistema de gerenciamento de assinaturas para clientes, com geração automática de faturas e carnê. O foco principal é facilitar o controle de cobranças recorrentes e organizar as faturas em ciclos mensais agrupados por assinatura.

## 📌 Descrição do Projeto

O sistema foi desenvolvido em Ruby on Rails. Cada cliente pode possuir assinaturas (`Subscription`). A cada nova assinatura, o sistema gera automaticamente um `Booklet`, que representa um carnê de pagamentos, contendo 12 `Invoices` mensais.

O sistema conta com:
- CRUD completo de clientes, planos, pacotes, assinaturas, contas, faturas e carnês.
- Geração automática de contas, faturas e carnê ao criar uma assinatura.
- Visualização das faturas de um carnê específico.
- Navegação entre a fatura, carnê e a conta correspondente.
- Interface simples com HTML e ERB.

## ✅ Pré-requisitos

Antes de iniciar, certifique-se de ter os seguintes itens instalados:

- Ruby 3.3.0
- Rails 8.0
- SQLite3 
- Bundler

## 🛠️ Instalação

Clone o projeto e siga os passos abaixo:

```bash
git clone https://github.com/seu-usuario/pay-tv-system.git
cd pay-tv-system
bundle install
rails db:setup
