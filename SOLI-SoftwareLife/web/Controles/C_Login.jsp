<%-- 
    Document   : C_Login
    Created on : 06/18/2021, 02:43:05 PM
    Author     : leone
--%>
<%@page import="Entidades.Usuario" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="../Css/login.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,700;1,400&display=swap" rel="stylesheet">
        <title>SOLI - Login</title>
    </head>
    <body class="Fondo">
        <header>    <!-- Encabezado -->
        <div class="contenedor">
            <h1>Soli Software Life</h1>
            
            <form>
                    
                <%  String Correo = request.getParameter("Correo");
                    String Password = request.getParameter("Password");
                    int VengoDe = Integer.parseInt(request.getParameter("vengoDe"));

                    if(VengoDe == 0){

                    Usuario Us = new Usuario();
                    List<Usuario> usuario = Us.LoginUser(Correo, Password);
                     for(Usuario u : usuario){
                       if(u.getType()>0){

                           String img;
                         /*
                             switch(u.getImagenID){
                                 case 1 : img = "../Imagenes/pregunta1.jpeg"
                                          break;
                       } */
                 %>
                <div class="titulos" style="align-content: center">
                <h3 style="margin-bottom: 5%;">Login</h3>
                </div>

                <div class="form-group">
                  <h2 style="text-align: center;">Inicio de sesión exitoso</h2><br>
                  <h2 style="text-align: center;">Redirigiendo al <strong>Menú Principal</strong> :)</h2>
                </div>
                 
                 <%
                    session.setAttribute("tipoUsuario", u.getType());
                    session.setAttribute("Nombre", u.getFirstName());
                    session.setAttribute("Apellido", u.getLastName());
                    session.setAttribute("ID_usuario", u.getID_usuario());
                %>
                <head><meta http-equiv="Refresh" content="3 ; URL=../Limites/P_MenuLogin.jsp"></head>
                <%  } else{ %>
                
                <div class="titulos">
                <h3 style="margin-bottom: 5%;">Login</h3>
                </div>

                <div class="form-group">
                  <h2 style="text-align: center;">Error al iniciar sesión</h2><br>
                  <h2 style="text-align: center;">Ah ocurrido un error, redirigiendo al <strong>Login Nuevamente</strong> :(</h2>
                </div>
                
                <head><meta http-equiv="Refresh" content="3 ; URL=../Limites/P_Login.html"></head>                
                <%    } 
                    }   
                  } else {

                    session.removeAttribute("nombreUsuario");
                    session.removeAttribute("idUsuario");
                    session.removeAttribute("tipoUsuario");
                    session.removeAttribute("ID_usuario");
                %>
                
                <div class="titulos">
                <h3 style="margin-bottom: 5%;">Cerrando Sesión</h3>
                </div>

                <div class="form-group">
                    <h2 style="text-align: center;">Fue un placer</h2><br>
                  <h2 style="text-align: center;">Esperamos que hayas aprendido mucho, <strong>Recuerda Visitarnos A Menudo</strong> :)</h2>
                </div>
                
                <head><meta http-equiv="Refresh" content="3 ; URL=../Limites/P_Login.html"></head>
                <%  }
                %>
            </form>
        </div>
        </header>
        <script src="../JavaScript/script.js"></script>
    </body>
</html>
