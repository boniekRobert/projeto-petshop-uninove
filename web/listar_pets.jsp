<%
    // 1. Segurança: Só entra se estiver logado
    if (session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("login.html");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Meus Pets - DevMonkeys</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/styles.css"/>
    </head>
    <body>
        <div class="container">
            <h2>Pets Cadastrados no Sistema 🐾</h2>

            <table>
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Raça</th>
                        <th>Idade</th>
                        <th>Características</th>
                        <th>Dono</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            // 2. Conexão com o Banco de Dados
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conexao = DriverManager.getConnection(
                                    "jdbc:mysql://localhost:3306/db_petshop", "root", "SUA_SENHA_AQUI");

                            // 3. Executa a busca ordenada por nome
                            String sql = "SELECT * FROM pet ORDER BY nome ASC";
                            PreparedStatement ps = conexao.prepareStatement(sql);
                            ResultSet rs = ps.executeQuery();

                            // 4. O Loop que constrói as linhas da tabela
                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String nome = rs.getString("nome");
                    %>
                    <tr>
                        <td><%= nome%></td>
                        <td><%= rs.getString("raca")%></td>
                        <td><%= rs.getInt("idade")%> anos</td>
                        <td><%= rs.getString("caracteristicas")%></td>
                        <td><%= rs.getString("dono")%></td>
                        <td>
                            <a href="editar_pet.jsp?id=<%= id%>" title="Editar" style="text-decoration:none; margin-right:10px;">Editar️</a>

                            <a href="excluir_pet.jsp?id=<%= id%>" 
                               title="Excluir" 
                               style="text-decoration:none; color:red;"
                               onclick="return confirm('Tem certeza que deseja excluir o pet <%= nome%>?')">Excluir️</a>
                        </td>
                    </tr>
                    <%
                            }
                            conexao.close();
                        } catch (Exception e) {
                            out.print("<tr><td colspan='6' class='msg-erro'>Erro ao carregar lista: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </tbody>
            </table>

            <div style="margin-top: 30px; display: flex; justify-content: center; gap: 15px;">
                <a href="cadastro_pet.html" class="btn-acao btn-cadastrar">+ Novo Pet</a>
                <a href="restrito.jsp" class="btn-acao btn-listar">Voltar ao Painel</a>
            </div>
        </div>
    </body>
</html>