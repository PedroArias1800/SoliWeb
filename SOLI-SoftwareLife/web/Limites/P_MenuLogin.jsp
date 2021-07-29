<%-- 
    Document   : P_MenuLogin
    Created on : 06/21/2021, 01:26:31 PM
    Author     : leone
--%>

<%@page import="Entidades.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>    <!-- Titulo De La Página Del Navegador -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../Css/LoginPrincipal.css"/>
        <!--<link rel="stylesheet" href="../Css/CSShumilde.css">-->
        <link rel="stylesheet" href="../Css/ModoClaro.css"/>
        <!--<link rel="stylesheet" href="../Css/LoginMenuPrincipal.css"/>-->
    </head>
    <body class="Fondo">
        <header>    <!-- Encabezado -->
            <h1 class="Titulo">SOLI<br>Software Life</h1>
            <h2 class="Login">Menú Principal</h2>
        </header>
        <%
            int IDUsuario = 0;
            if(session.getAttribute("tipoUsuario") != null){
                IDUsuario=(int)session.getAttribute("tipoUsuario");
            }
            Usuario u = new Usuario();
            u.setType(IDUsuario);
        %>
        <div  class="Opc2" style="margin-top: -20rem; margin-left: 80%; margin-bottom: 12%;">
            <input onclick="vermas('mas');" class="Botones" style="font-size: large; background-color: white; color: blue; border: 2px solid white; border-radius: 5px;" type="button" value="<%=session.getAttribute("Nombre")%> <%=session.getAttribute("Apellido")%>">
            <div id="desplegar" style="display:none; position: absolute; margin-left: 0.5%;">
                <button class="Botones" style=" font-size: large; padding: 3%; margin-left: -170%; margin-top: 35%;" class="botonRead Botones" onclick="vermas('menos');" id="menos">  X  </button>
                <form action="../Controles/C_Login.jsp" method="post">
                    <input class="Botones" type="hidden" value="Salir" name="Correo">
                    <input class="Botones" type="hidden" value="Salir2" name="Password">
                    <input class="Botones" type="hidden" value="1" name="vengoDe"> 
                    <input class="Botones" style="margin-left: -20%;" type="submit" value="Cerrar Sesión">
                </form>
            </div>
        </div>
        <%
            if(IDUsuario==3){ 
        %>
        <h1> 
            <form action="../Controles/C_TodasLasP.jsp">
                <% 
                   session.setAttribute("iniciar", 1); 
                   session.setAttribute("prA", 0);
                   session.setAttribute("nivel", 1);
                %>
                <input class="Botones Especial" type="submit" value="Jugar"><br>
            </form>
            <a href="P_Ranking.jsp"><input class="Botones Especial" type="button" value="Ranking"></a><br>
            <a href="P_AcercaDe.html"><input class="Botones Especial" type="button" value="Acerca De"></a><br>
            <a href=""><input class="Botones Especial" type="button" value="Infografía"></a>
        </h1> <br><br>
        <%  }
            else if(IDUsuario==2){
        %>
        <h1 style="margin-top: 9%; margin-bottom: 5%;"> 
            <a href="P_EscogerDificultad.html"><input class="Botones Especial" type="button" value="Jugar"></a><br>
            <a href="P_Ranking.jsp"><input class="Botones Especial" type="button" value="Ranking"></a><br>
            <a href="C_AdministrarPreguntas.jsp"><input class="Botones Especial" type="button" value="Preguntas"></a><br>
        </h1>  
        <%
            }
            else{
        %>    
        <h1 style="margin-top: 17%; margin-bottom: 9%;"> 
            <a href="C_AdministrarUsuarios.jsp"><input type="button" class="Botones Especial" value="Usuarios"></a>
        </h1> 
        <%  }  %>
        <footer>    <!-- Imágenes Con Enlaces De La UTP Y FISC -->
            <a href="https://utp.ac.pa/"><img class="utp" src="https://utp.ac.pa/documentos/2015/imagen/logo_utp_1_72.png" alt="" width="150" height="150"></a>
            <a href="https://fisc.utp.ac.pa/"><img src="https://fisc.utp.ac.pa/sites/fisc.utp.ac.pa/files/documentos/2020/imagen/logo_en_contactenos.png" alt="" width="150" height="150"></a>
        </footer>
        <script language="JavaScript" src="../JavaScript/Listeners.js" type="text/javascript"></script>
    </body>
</html>
