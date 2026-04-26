<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    // Validação de Segurança: Só entra se estiver logado
    if (session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("index.html");
        return;
    }

    // Captura os dados do formulário
    String nome = request.getParameter("nome");
    String raca = request.getParameter("raca");
    String idadeStr = request.getParameter("idade");
    String caracteristicas = request.getParameter("caracteristicas");
    String dono = request.getParameter("dono");

    try {
        // Conexão
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conexao = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/db_petshop", "root", "SUA_SENHA_AQUI");

        // SQL de Inserção
        String sql = "INSERT INTO pet (nome, raca, idade, caracteristicas, dono) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement st = conexao.prepareStatement(sql);

        st.setString(1, nome);
        st.setString(2, raca);
        st.setInt(3, Integer.parseInt(idadeStr));
        st.setString(4, caracteristicas);
        st.setString(5, dono);

        st.executeUpdate();
        conexao.close();

        out.print("<script>alert('Pet cadastrado com sucesso!'); window.location='restrito.jsp';</script>");

    } catch (Exception e) {
        out.print("Erro ao salvar: " + e.getMessage());
    }
%>