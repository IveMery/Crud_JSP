<%-- 
    Document   : agregar
    Created on : 21-08-2023, 19:19:47
    Author     : ivett
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">

            <h2>Agregar Empleado</h2>
            <form action="agregar.jsp" method="post">
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" class="form-control" name="nombre" required>
                </div>
                <div class="form-group">
                    <label for="edad">Edad:</label>
                    <input type="text" class="form-control" name="edad" required>
                </div>
                <div class="form-group">
                    <label for="salario">Salario:</label>
                    <input type="text" class="form-control" name="salario" required>
                </div>
                <div class="form-group">
                    <label for="cargo">Cargo:</label>
                    <input type="text" class="form-control" name="cargo" required>
                </div>
                <input type="hidden" name="enviar" value="enviar">
                <button type="submit" class="btn btn-primary">Agregar</button>
            </form>
        </div>

        <%
            if (request.getParameter("enviar") != null) {
                String strNombre = request.getParameter("nombre");
                int edad = Integer.parseInt(request.getParameter("edad"));
                double salario = Double.parseDouble(request.getParameter("salario"));
                String cargo = request.getParameter("cargo");

                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("org.postgresql.Driver");
                    con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eva2db", "postgres", "Admin01");
                    st = con.createStatement();
                    String query = "INSERT INTO empleados (nombre, edad, salario, cargo) VALUES('" + strNombre + "'," + edad + "," + salario + ",'" + cargo + "')";
                    st.executeUpdate(query);
                    st.close();
                    con.close();
                    String mensajeJS = "alert('¡Usuario agregado exitosamente!');";
        %>
        <script type="text/javascript">
            <%= mensajeJS%>
                // Redirigir a la página index.jsp después de la alerta
                window.location.href = "index.jsp";
        </script>   
        // request.getRequestDispatcher("index.jsp").forward(request, response);
        <%
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
