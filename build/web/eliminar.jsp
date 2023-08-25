<%-- 
    Document   : eliminar
    Created on : 23-08-2023, 19:53:53
    Author     : ivett
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>         
        <%
            Connection con = null;
            Statement st = null;

            try {
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eva2db", "postgres", "Admin01");
                st = con.createStatement();
                st.executeUpdate("DELETE FROM empleados WHERE id='" + request.getParameter("id") + "'");
                String mensajeJS = "alert('¡Usuario Eliminado!');";
        %>
        <script type="text/javascript">
            <%= mensajeJS%>
            // Redirigir a la página index.jsp después de la alerta
            window.location.href = "index.jsp";
        </script>   
        <%
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>