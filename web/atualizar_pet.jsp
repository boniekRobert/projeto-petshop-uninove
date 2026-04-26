<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if (session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("index.html");
        return;
    }

    int id = Integer.parseInt(request.getParameter("id"));
    String nome = request.getParameter("nome");
    String raca = request.getParameter("raca");
    int idade = Integer.parseInt(request.getParameter("idade"));
    String caracteristicas = request.getParameter("caracteristicas");
    String dono = request.getParameter("dono");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conexao = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/db_petshop", "root", "SUA_SENHA_AQUI");
        
        String sql = "UPDATE pet SET nome=?, raca=?, idade=?, caracteristicas=?, dono=? WHERE id=?";
        PreparedStatement ps = conexao.prepareStatement(sql);
        ps.setString(1, nome);
        ps.setString(2, raca);
        ps.setInt(3, idade);
        ps.setString(4, caracteristicas);
        ps.setString(5, dono);
        ps.setInt(6, id);

        ps.executeUpdate();
        conexao.close();

        out.print("<script>alert('Pet atualizado com sucesso!'); window.location='listar_pets.jsp';</script>");
    } catch (Exception e) {
        out.print("Erro ao atualizar: " + e.getMessage());
    }
%>