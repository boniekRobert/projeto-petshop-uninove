<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("index.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Painel PetManager</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/styles.css"/>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <header class="dash-header">
                    <h1>🐾 PetManager Admin</h1>
                    <a href="index.html" class="btn-outline" style="text-decoration: none;">Sair</a>
                </header>

                <h2 style="margin: 20px 0;">Bem-vindo, <%= session.getAttribute("usuarioLogado")%>!</h2>

                <div style="display: flex; gap: 15px; justify-content: center; margin-top: 30px;">
                    <a href="cadastro_pet.html" class="btn-main" style="text-decoration: none; width: auto;">+ Novo Pet</a>
                    <a href="listar_pets.jsp" class="btn-main" style="text-decoration: none; width: auto;">Ver Meus Pets</a>
                </div>
            </div>
        </div>
    </body>
</html>