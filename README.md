# Sistema de Gerenciamento Petshop

## 📋 Sobre o Projeto
Este projeto foi desenvolvido como requisito para a disciplina de Projeto Prático de Programação da Universidade Nove de Julho (UNINOVE). 

O sistema consiste em uma aplicação Web focada no gerenciamento de um Petshop, contando com um sistema de controle de acesso (login) e um CRUD (Create, Read, Update, Delete) completo e funcional. A arquitetura foi pensada de forma essencialista, garantindo que as operações de banco de dados e a interface do usuário operem de forma simples e direta.

## 🚀 Funcionalidades
O sistema atende aos seguintes requisitos:
- **Autenticação:** Validação de login e senha para acesso seguro ao painel.
- **Cadastrar (Create):** Inclusão de novos pets com dados como raça, nome, idade, características e dono.
- **Listar (Read):** Exibição de todos os registros cadastrados na tela do site.
- **Alterar (Update):** Atualização de dados de pets já cadastrados no banco.
- **Excluir (Delete):** Remoção de registros do sistema.

## 🛠️ Tecnologias e Ferramentas
- **Linguagem:** Java (Web)
- **IDE:** Apache NetBeans
- **Servidor:** Apache Tomcat
- **Banco de Dados:** MySQL
- **DevOps & Gestão:** Controle de versão via GitHub e gerenciamento de tarefas via Kanban (Trello).

## 🗄️ Banco de Dados
O sistema utiliza um banco de dados relacional chamado `db_petshop` contendo duas tabelas independentes:
1. `usuarios`: Responsável por armazenar as credenciais de acesso ao sistema.
2. `pet`: Responsável por armazenar as informações vitais do negócio.

> 💡 **Nota:** O script SQL completo para a criação do banco de dados e inserção do usuário administrador padrão (admin/123456) está disponível no arquivo `script_banco.sql` na raiz deste repositório.

## ⚙️ Como executar o projeto localmente

1. **Clone o repositório:**
   ```bash
   git clone [https://github.com/SEU-USUARIO/NOME-DO-REPOSITORIO.git](https://github.com/SEU-USUARIO/NOME-DO-REPOSITORIO.git)
