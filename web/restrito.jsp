<%
    // 1. O SEGURANÇA DA PORTA: Verifica se o usuário tem o crachá VIP na sessão
    if (session.getAttribute("usuarioLogado") == null) {
        // Se não estiver logado, manda de volta para o login
        response.sendRedirect("login.html");
        return; // Para a execução do restante da página imediatamente
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Área Restrita - Petshop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/styles.css"/>
    </head>
    <body>
        <div class="container">
            <h1 class="msg-sucesso">Acesso Autorizado!</h1>

            <h2>Bem-vindo ao sistema PetShop, <%= session.getAttribute("usuarioLogado")%>!</h2>

            <p>Este é o seu Dashboard. Utilize as opções abaixo para gerenciar o sistema.</p>

            <hr>

            <div class="menu-dashboard">
                <a href="cadastro_pet.html" class="btn-acao btn-cadastrar">+ Cadastrar Novo Pet</a>
                <a href="listar_pets.jsp" class="btn-acao btn-listar">Ver Meus Pets</a>
            </div>

            <hr>

            <a href="login.html" class="btn-logout">Sair do Sistema</a>
        </div>
    </body>
</html>