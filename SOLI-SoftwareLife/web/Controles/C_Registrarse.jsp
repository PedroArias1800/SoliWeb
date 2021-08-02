<%-- 
    Document   : C_Registrarse
    Created on : 07/05/2021, 08:00:19 AM
    Author     : leone
--%>

<%@page import="java.util.List"%>
<%@page import="Entidades.Usuario"%>
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
        <% 
            String Nombre = request.getParameter("Nombre");
            String Apellido = request.getParameter("Apellido");
            String Grupo = request.getParameter("Grupo");
            String Cedula = request.getParameter("Cedula");
            String Email = request.getParameter("Email");
            String Contra = request.getParameter("Contra1");
            String ContraDos = request.getParameter("Contra2");
            int Type = Integer.parseInt(request.getParameter("Type"));
            String userName = request.getParameter("userName");
            int VengoDe = Integer.parseInt(request.getParameter("vengoDe"));
           
            if(!(Contra.equals(ContraDos)) && VengoDe==0){    %>
            
                <h3>Registrarse</h3>
                <br><p>Error: Las Contraseñas No Coinciden<br><br>
                    Vuelva A Intentarlo... <strong>Volviendo Al Registro Nuevamente</strong></p><br><br><br>
                <head><meta http-equiv="Refresh" content="3 ; URL=../Limites/P_Registrarse.html"></head>
           
           <%   } else if (!(Contra.equals(ContraDos)) && VengoDe!=0) {    %>
            
                <h3>Registrarse</h3>
                <br><p>Error: Las Contraseñas No Coinciden<br><br>
                    Vuelva A Intentarlo... <strong>Volviendo Al Registro Nuevamente</strong></p><br><br><br>
                <head><meta http-equiv="Refresh" content="3 ; URL=../Limites/P_RegistrarseAdmin.html"></head>
           
           <%   } else if (Contra.equals(ContraDos) && VengoDe==0) {
           
           Usuario Us = new Usuario();
           boolean resultado = Us.RegistrarUsuario(Cedula, Nombre, Apellido, Email, Contra, Type);
           if(resultado){
            %>
            <h3>Registrarse</h3>
            <br><p>Usuario Creado Exitosamente<br><br>
                Redirigiendo Al <strong>Login Principal</strong> :)</p><br><br>
            <head><meta http-equiv="Refresh" content="3 ; URL=../Limites/P_Login.html"></head>
            <%  } else { %>
            <h3>Registrarse</h3>
            <br><p>Error Al Crear El Usuario<br><br>
                Vuelva A Intentarlo... <strong>Volviendo Al Registro Nuevamente</strong></p><br><br><br>
            <head><meta http-equiv="Refresh" content="3 ; URL=../Limites/P_Login.html"></head>
            <%    } 
                } else {
            
            Usuario Us = new Usuario();
            boolean resultado = Us.RegistrarUsuario(Cedula, Nombre, Apellido, Email, Contra, Type);
            if(resultado){
            %>
            <h3>Registrarse</h3>
            <br><p>Usuario Creado Exitosamente<br><br>
                Redirigiendo Al <strong>Registro De Usuarios</strong> :)</p><br><br>
            <head><meta http-equiv="Refresh" content="3 ; URL=../Limites/P_RegistrarseAdmin.jsp"></head>
            <%  } else { %>
            <h3>Registrarse</h3>
            <br><p>Error Al Crear El Usuario<br><br>
                Vuelva A Intentarlo... <strong>Volviendo Al Registro De Usuarios</strong></p><br><br><br>
            <head><meta http-equiv="Refresh" content="3 ; URL=../Limites/P_RegistrarseAdmin.jsp"></head>
            <%    }
               }
            %>
        </div>
        </header>
        <footer>    <!-- Imágenes Con Enlaces De La UTP Y FISC -->
            <a href="https://utp.ac.pa/"><img class="utp" src="https://utp.ac.pa/documentos/2015/imagen/logo_utp_1_72.jpg" alt="" width="150" height="150"></a>
            <a href="https://fisc.utp.ac.pa/"><img src="https://fisc.utp.ac.pa/sites/fisc.utp.ac.pa/files/documentos/2020/imagen/logo_en_contactenos.png" alt="" width="150" height="150"></a>
        </footer>
    </body>
</html>