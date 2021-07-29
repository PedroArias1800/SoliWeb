<%-- 
    Document   : P_EscogerModulo
    Created on : 07/13/2021, 08:53:08 PM
    Author     : leone
--%>

<%@page import="java.util.List"%>
<%@page import="Entidades.Modulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Escoger Módulo</title>
        <link rel="stylesheet" href="../Css/LoginPrincipal.css"/>
        <link rel="stylesheet" href="../Css/ModoClaro.css"/>
        <link rel="stylesheet" href="../Css/LoginMenuPrincipa"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body class="Fondo">
        <header>    <!-- Encabezado -->
            <h1 class="Titulo">SOLI<br>Software Life</h1>
            <h2 class="Login">Escoge Un Módulo</h2>
        </header>
        <div>
            <form action="../Controles/C_InfoDeModulo.jsp" method="post">
            <%   
                List<Modulo> m = (List<Modulo>)(session.getAttribute("ObjModulo"));  
                for(Modulo mo : m){
            %>
                <div class="tabla">
                    <%=mo.getNombre()%>
                    <input type="button" id="modo" value="<%=mo.getImagen()%>" onclick="vermas('mas')">
                    <div id="desplegar">
                        <input type="button" value="Fácil">
                        <input type="button" value="Medio">
                        <input type="button" value="Difícil">
                    </div>
                </div>
                <%  }  %>
            </form>
            <%
                if((int)session.getAttribute("tipoUsuario")==2){
            %>
                <h2>***Sólo se mostrarán los módulos hechos por usted***</h2>
            <%  }  %>
            <a href="P_MenuLogin.jsp"><input type="button" class="Botones" value="Regresar"></a>
        </div>
        <footer>    <!-- Imágenes Con Enlaces De La UTP Y FISC -->
            <a href="https://utp.ac.pa/"><img class="utp" src="https://utp.ac.pa/documentos/2015/imagen/logo_utp_1_72.png" alt="" width="150" height="150"></a>
            <a href="https://fisc.utp.ac.pa/"><img src="https://fisc.utp.ac.pa/sites/fisc.utp.ac.pa/files/documentos/2020/imagen/logo_en_contactenos.png" alt="" width="150" height="150"></a>
        </footer>
        <script language="JavaScript" src="../JavaScript/Listeners.js" type="text/javascript"></script>
    </body>
</html>
