<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if (session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("index.html");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Meus Pets - DevMonkeys</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/styles.css"/>
    </head>
    <body>
        <div class="container">
            <div class="card" style="max-width: 1000px;">
                <header class="dash-header">
                    <h2>Pets Cadastrados 🐾</h2>
                    <a href="restrito.jsp" class="btn-outline" style="text-decoration: none;">Voltar</a>
                </header>

                <table>
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Raça</th>
                            <th>Idade</th>
                            <th>Características</th> <th>Dono</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_petshop", "root", "SUA_SENHA_AQUI");
                                String sql = "SELECT * FROM pet ORDER BY nome";
                                PreparedStatement st = conexao.prepareStatement(sql);
                                ResultSet rs = st.executeQuery();

                                while (rs.next()) {
                                    int id = rs.getInt("id");
                        %>
                        <tr>
                            <td><%= rs.getString("nome")%></td>
                            <td><%= rs.getString("raca")%></td>
                            <td><%= rs.getInt("idade")%> ano(s)</td>
                            <td><%= rs.getString("caracteristicas")%></td> 
                            <td><%= rs.getString("dono")%></td>
                            <td>
                                <a href="editar_pet.jsp?id=<%= id%>" style="text-decoration:none; margin-right:15px; font-size: 1.2rem;">✏️</a>
                                <a href="excluir_pet.jsp?id=<%= id%>" style="text-decoration:none; color: #d9534f; font-size: 1.2rem;"
                                   onclick="return confirm('Excluir o pet?')">🗑️</a>
                            </td>
                        </tr>
                        <%
                                }
                                conexao.close();
                            } catch (Exception e) {
                                out.print("<tr><td colspan='6'>Erro: " + e.getMessage() + "</td></tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>