<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validando Acesso...</title>
    </head>
    <body>
        <%
            // 1. Receber o login e senha digitados no form do login.html
            String loginDigitado, senhaDigitada;
            loginDigitado = request.getParameter("login");
            senhaDigitada = request.getParameter("senha");

            try {
                // 2. Conectar com o banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_petshop", "root", "SUA_SENHA_AQUI");

                // 3. Buscar no banco se existe um usuario com ESSE login e ESSA senha
                PreparedStatement st = conexao.prepareStatement("SELECT * FROM usuarios WHERE login = ? AND senha = ?");
                st.setString(1, loginDigitado);
                st.setString(2, senhaDigitada);

                ResultSet usuarioBuscado = st.executeQuery();

                // 4. Verificar o resultado da busca
                if (usuarioBuscado.next()) {

                    // 1º Passo: Pendura o crachá VIP na sessão do servidor
                    session.setAttribute("usuarioLogado", usuarioBuscado.getString("login"));

                    // 2º Passo: Abre a porta e manda para o Dashboard (mais limpo e seguro)
                    response.sendRedirect("restrito.jsp");

                } else {
                    // Se não encontrou (Login ou Senha errados)
                    out.print("<h3 style='color: red; text-align: center;'>Usuário ou senha incorretos!</h3>");
                    out.print("<p style='text-align: center;'><a href='login.html'>Tentar Novamente</a></p>");
                }

                // Fecha a conexão
                conexao.close();

            } catch (Exception e) {
                out.print("<h3 style='color: red;'>Erro no sistema: " + e.getMessage() + "</h3>");
            }
        %>
    </body>
</html>