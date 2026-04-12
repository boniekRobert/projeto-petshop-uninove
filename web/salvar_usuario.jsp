<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processando Cadastro...</title>
        <link rel="stylesheet" href="css/login.css"/>
    </head>
    <body>
        <div class="container" style="margin-top: 100px;">
            <%
                // 1. Receber os dados do formulário cadastrese.html
                String novoLogin = request.getParameter("login");
                String novaSenha = request.getParameter("senha");

                try {
                    // 2. Conectar com o banco de dados
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_petshop", "root", "SUA_SENHA_AQUI");

                    // 3. Preparar o comando INSERT para salvar na tabela usuarios
                    PreparedStatement st = conexao.prepareStatement("INSERT INTO usuarios (login, senha) VALUES (?, ?)");
                    st.setString(1, novoLogin);
                    st.setString(2, novaSenha);
                    
                    // 4. Executar a ação no banco
                    int resultado = st.executeUpdate(); 
                    
                    if (resultado == 1) {
                        out.print("<h2 style='color: green;'>Usuário cadastrado com sucesso!</h2>");
                        out.print("<p>Seja bem-vindo!</p>");
                        out.print("<a href='login.html' class='btn-logout' style='background-color: #4CAF50;'>Ir para o Login</a>");
                    } else {
                        out.print("<h2 style='color: red;'>Erro ao tentar salvar os dados.</h2>");
                    }
                    
                    conexao.close();
                    
                } catch(Exception e) {
                    // Cai aqui se houver erro (ex: a constraint UNIQUE barrar um login repetido)
                    out.print("<h2 style='color: red;'>Erro no sistema: " + e.getMessage() + "</h2>");
                    out.print("<p>Verifique se este login já não está em uso no banco de dados.</p>");
                    out.print("<a href='cadastrese.html' class='btn-logout'>Tentar Novamente</a>");
                }
            %>
        </div>
    </body>
</html>