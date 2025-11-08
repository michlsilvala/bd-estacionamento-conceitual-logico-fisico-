# Sistema de Locação de Veículos - Banco de Dados

## 📖 Descrição do Projeto

Este é um **projeto de banco de dados relacional** para um **sistema de locação de veículos** criado para um trabalho da faculdade de Sistemas de Informação. O modelo foi projetado para gerenciar clientes, veículos, reservas, pagamentos (com suporte a cartão de crédito, débito e PIX) e categorias de veículos.


O sistema inclui:
- Cadastro de clientes com CNH e endereço
- Gestão de frota com categorias e status de disponibilidade
- Reservas com datas de início/fim e observações
- Pagamentos com herança (especialização): **Cartão (Crédito/Débito)** e **PIX**
- Consultas úteis para operação do negócio

## 🗂️ Estrutura do Banco de Dados

### **Diagrama Entidade-Relacionamento (DER)**
![DER - Modelo Conceitual]

> *Diagrama conceitual mostrando entidades, relacionamentos e cardinalidades.*

![DER - Modelo Lógico]

> *Diagrama lógico com chaves primárias, estrangeiras e tipos de dados.*

---

## 🛠️ Tecnologias Utilizadas

- **SGBD**: PostgreSQL
- **Linguagem**: SQL (DDL + DML)
- **Ferramentas usadas**:
  - [pgAdmin](https://www.pgadmin.org/) (Para SQL)
  - [BrModelo](https://www.sis4.com/) (para diagramas)

> **Projeto desenvolvido conforme o padrão da Sociedade Brasileira de Computação (SBC)** para modelagem e implementação de bancos de dados relacionais.

## Padrão SBC Seguido

Este trabalho atende rigorosamente às diretrizes da **SBC** para disciplinas de Banco de Dados, incluindo:

- **Modelagem Conceitual (MER)** em notação Chen com entidades, atributos e cardinalidades
- **Modelagem Lógica (DER)** com chaves, tipos de dados e relacionamentos
- **Implementação Física** em PostgreSQL com DDL, constraints e DML
- **Normalização até a 3FN**
- **Herança por tabela** (especialização: `pagamento → cartao → credito/debito`, `pix`)
- **Consultas com propósito de negócio** (JOIN, GROUP BY, filtros temporais)

