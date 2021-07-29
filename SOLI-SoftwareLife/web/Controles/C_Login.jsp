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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOLI - Software Life</title>
        <link rel="stylesheet" href="../Css/LoginPrincipal.css"/>
        <!--<link rel="stylesheet" href="../Css/CSShumilde.css">-->
        <link rel="stylesheet" href="../Css/ModoClaro.css">
        <!--<link rel="stylesheet" href="../Css/ModoOscuro.css">-->
    </head>
    <body class="Fondo">
        <header>    <!-- Encabezado -->
            <h1 class="Titulo"><span>SOLI</span><br>Software Life</h1>
            
        <div class="Texto">
        <% String Correo = request.getParameter("Correo");
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
        <h3>Login</h3>
        <br><p>Inicio De Sesión Exitoso<br><br>
            Redirigiendo Al <strong>Menú Principal</strong> :)</p><br><br>
        
        <%
            session.setAttribute("tipoUsuario", u.getType());
            session.setAttribute("Nombre", u.getFirstName());
            session.setAttribute("Apellido", u.getLastName());
            session.setAttribute("ID_usuario", u.getID_usuario());
        %>
        <head><meta http-equiv="Refresh" content="3 ; URL=../Limites/P_MenuLogin.jsp"></head>
        <%  } else{ %>
        <h3>Login</h3>
        <br><p>Error Al Iniciar Sesión<br><br>
            Ah Ocurrido Un Error, Redirigiendo Al <strong>Login Nuevamente</strong> :(</p><br><br><br>
        <head><meta http-equiv="Refresh" content="3 ; URL=../Limites/P_Login.html"></head>
        <%    } 
            }   
          } else {
            
            session.removeAttribute("nombreUsuario");
            session.removeAttribute("idUsuario");
            session.removeAttribute("tipoUsuario");
            session.removeAttribute("ID_usuario");
        %>
            <h3>Cerrando Sesión</h3>
            <head><meta http-equiv="Refresh" content="3 ; URL=../Limites/P_Login.html"></head>
            
            <br><p>Fue Un Placer<br><br>
                Esperamos Que Hayas Aprendido Mucho, <strong>Recuerda Visitarnos A Menudo</strong> :)</p><br><br><br>
        <%  }
        %>
        </div>
        </header>
        <footer>    <!-- Imágenes Con Enlaces De La UTP Y FISC -->
            <a href="https://utp.ac.pa/"><img class="utp" src="https://utp.ac.pa/documentos/2015/imagen/logo_utp_1_72.jpg" alt="" width="150" height="150"></a>
            <a href="https://fisc.utp.ac.pa/"><img src="https://fisc.utp.ac.pa/sites/fisc.utp.ac.pa/files/documentos/2020/imagen/logo_en_contactenos.png" alt="" width="150" height="150"></a>
        </footer>
    </body>
</html>
