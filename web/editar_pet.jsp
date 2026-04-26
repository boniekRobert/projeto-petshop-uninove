<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    // Verificação de sessão para segurança
    if (session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("index.html");
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
        out.print("Erro ao carregar dados: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Editar Pet - DevMonkeys</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/styles.css"> 
    </head>
    <body>
        <div class="container">
            <div class="card" style="max-width: 500px;">
                <h2>Editar Dados do Pet ✏️</h2>
      
                <form action="atualizar_pet.jsp" method="POST" style="box-shadow: none; padding: 0;">
                    <input type="hidden" name="id" value="<%= idParaEditar%>">

                    <label style="text-align: left; display: block; margin-bottom: 5px;">Nome:</label>
                    <input type="text" name="nome" value="<%= nome%>" placeholder="Nome do Pet" required>

                    <label style="text-align: left; display: block; margin-bottom: 5px;">Raça:</label>
                    <input type="text" name="raca" value="<%= raca%>" placeholder="Raça">
       
                    <label style="text-align: left; display: block; margin-bottom: 5px;">Idade:</label>
                    <input type="number" name="idade" value="<%= idade%>" placeholder="Idade">

                    <label style="text-align: left; display: block; margin-bottom: 5px;">Características:</label>
                    <input type="text" name="caracteristicas" value="<%= caracteristicas%>" placeholder="Características">

                    <label style="text-align: left; display: block; margin-bottom: 5px;">Responsável:</label>
                    <input type="text" name="dono" value="<%= dono%>" placeholder="Dono" required>

                    <input type="submit" value="Salvar Alterações" class="btn-main">
                    
                    <div style="text-align: center; margin-top: 15px;">
                        <a href="listar_pets.jsp" class="btn-outline" 
                           style="text-decoration: none; display: inline-block; width: auto; min-width: 200px;">
                           Cancelar
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>