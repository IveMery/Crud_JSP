<%-- 
    Document   : editar
    Created on : 21-08-2023, 19:20:23
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
        <h1 class="text-center">Editar</h1>
        <%
            String strID = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String edad = request.getParameter("edad");
            String salario = request.getParameter("salario");
            String cargo = request.getParameter("cargo");
        %>
        <%
            out.println("<script>");
            out.println("console.log('" + strID + "','" + nombre + "','" + edad + "','" + cargo + "');");
            out.println("</script>");
        %>

        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="editar.jsp" method="post">
                        <div class="form-group">
                            <label>Nombre Usuario</label>
                            <input name="nombre" value="<%=nombre%>" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Ingrese usuario" required="">
                        </div>
                        <div class="form-group">
                            <label>Edad Usuario</label>
                            <input name="edad" value="<%=edad%>" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Ingrese edad" required="">
                        </div>
                        <div class="form-group">
                            <label>Salario Usuario</label>
                            <input name="salario" value="<%=salario%>" type="text" class="form-control" aria-describedby="emailHelp" placeholder="15000" required="">
                        </div>
                        <div class="form-group">
                            <label>Cargo Usuario</label>
                            <input name="cargo" value="<%=cargo%>" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Administrativo" required="">
                        </div>
                        <input type="hidden" name="enviar" value="enviar">
                        <button type="submit" class="btn btn-success">ACTUALIZAR <i class="fa fa-arrow-right"></i></button>
                        <a href="index.jsp" class="btn btn-danger">CANCELAR <i class="fa fa-times"></i></a>
                        <input type="hidden" name="id" value="<%=strID%>">
                    </form>
                </div>
            </div>
        </div>

        <%
            if (request.getParameter("enviar") != null) {
                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("org.postgresql.Driver");
                    con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eva2db", "postgres", "Admin01");
                    st = con.createStatement();
                    st.executeUpdate("UPDATE empleados SET nombre = '" + nombre + "', edad='" + edad + "', cargo='" + cargo + "' WHERE id='" + strID + "'");
                    String mensajeJS = "alert('¡Actualizacion exitosa!');";
        %>
        <script type="text/javascript">
            <%= mensajeJS%>
                // Redirigir a la página index.jsp después de la alerta
                window.location.href = "index.jsp";
        </script>   
        // request.getRequestDispatcher("index.jsp").forward(request, response);
        <%
                    //request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
