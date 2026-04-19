<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if (session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("login.html");
        return;
    }

    String idParaEditar = request.getParameter("id");
    String nome = "", raca = "", caracteristicas = "", dono = "";
    int idade = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conexao = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/db_petshop", "root", "SUA_SENHA_AQUI");

        PreparedStatement ps = conexao.prepareStatement("SELECT * FROM pet WHERE id = ?");
        ps.setInt(1, Integer.parseInt(idParaEditar));
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            nome = rs.getString("nome");
            raca = rs.getString("raca");
            idade = rs.getInt("idade");
            caracteristicas = rs.getString("caracteristicas");
            dono = rs.getString("dono");
        }
        conexao.close();
    } catch (Exception e) {
        out.print("Erro: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Editar Pet - DevMonkeys</title>
        <link rel="stylesheet" href="css/styles.css"> 
    </head>
    <body>
        <div class="container">
            <h2>Editar Dados do Pet ✏️</h2>
            <form action="atualizar_pet.jsp" method="POST">
                <input type="hidden" name="id" value="<%= idParaEditar%>">

                <input type="text" name="nome" value="<%= nome%>" placeholder="Nome do Pet" required>
                <input type="text" name="raca" value="<%= raca%>" placeholder="Raça">
                <input type="number" name="idade" value="<%= idade%>" placeholder="Idade">
                <input type="text" name="caracteristicas" value="<%= caracteristicas%>" placeholder="Características">
                <input type="text" name="dono" value="<%= dono%>" placeholder="Dono" required>

                <div style="margin-top: 20px; display: flex; justify-content: center; gap: 10px;">
                    <button type="submit" class="btn-acao btn-cadastrar" style="border:none;">Salvar Alterações</button>
                    <a href="listar_pets.jsp" class="btn-acao btn-listar">Cancelar</a>
                </div>
            </form>
        </div>
    </body>
</html>