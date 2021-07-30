<%-- 
    Document   : P_Retroalimentacion
    Created on : 07/29/2021, 12:37:20 PM
    Author     : leone
--%>

<%@page import="Entidades.Puntaje"%>
<%@page import="Entidades.Ranking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Retroalimentación</title>
    </head>
    <body>
            <h3>Retroalimentación</h3>
        <%
            if((int)session.getAttribute("tipoUsuario")==3){
            Ranking r = new Ranking();
            Puntaje p = new Puntaje();
            
            String cedula = (String)session.getAttribute("ID_usuario");
            int nivel = (int)session.getAttribute("nivel");
            int puntos = (int)session.getAttribute("puntos");
            int intF = (int)session.getAttribute("intF");
            int intM = (int)session.getAttribute("intM");
            int intD = (int)session.getAttribute("intD");
            int tpc = (int)session.getAttribute("tpc");
            int tpi = (int)session.getAttribute("tpi");
            
            if()
            
            boolean resultados = r.RegistrarIntento(cedula, nivel, puntos, intF, intM, intD, tpc, tpi);
            if(resultados){     %>
                
                <br><p>Estos son tus resultados del intento<br><br>
                <h3>Puntos Obtenidos: <%=puntos%></h3>
                <h3>Intento: <%=intE%></h3>
                <h3></h3>
                <h3></h3>
            
        <%
            }   else    {    %>
                    
                <br><p>Error Al Guardar Tus Resultados<br><br>
                Ah ocurrido un error al guardar en <strong>El Ranking</strong> :(</p><br><br><br>
        <%
            }

        session.removeAttribute("nivel");
        session.removeAttribute("puntos");
        session.removeAttribute("intF");
        session.removeAttribute("intM");
        session.removeAttribute("intD");
        session.removeAttribute("tpc");
        session.removeAttribute("tpi");

        } else {    %>
                
        <%    }     %>

        %>
        
        <form action="P_MenuLogin.jsp" method="post">
            <input type="submit" value="Volver Al Menú Principal">
        </form>
    </body>
</html>
