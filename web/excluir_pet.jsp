<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    // 1. Segurança
    if (session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("login.html");
        return;
    }

    // 2. Pega o ID que veio pelo link
    String idParaExcluir = request.getParameter("id");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conexao = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/db_petshop", "root", "SUA_SENHA_AQUI");

        // 3. Deleta do banco
        PreparedStatement st = conexao.prepareStatement("DELETE FROM pet WHERE id = ?");
        st.setInt(1, Integer.parseInt(idParaExcluir));
        st.executeUpdate();

        conexao.close();

        // Volta para a lista atualizada
        response.sendRedirect("listar_pets.jsp");

    } catch (Exception e) {
        out.print("Erro ao excluir: " + e.getMessage());
    }
%>