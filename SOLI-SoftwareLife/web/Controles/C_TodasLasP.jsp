<%-- 
    Document   : C_TodasLasP
    Created on : 07/29/2021, 12:11:42 PM
    Author     : leone
--%>

<%@page import="Entidades.Preguntas"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOLI - Jugar</title>
    </head>
    <body>
        <%            
            Preguntas p = new Preguntas();
            String n = request.getParameter("nivel");
            int num=0;
            
            if(n.equals("Facil")){
                num=1;
            } else if(n.equals("Medio")){
                num=2;
            } else {
                num=3;
            }
            
            List<Preguntas> P = p.BuscarPreguntas(num);
            
            session.setAttribute("TodasLasP", P);
            session.setAttribute("nivel", num);
        %>
        <form action="../Controles/C_Jugar.jsp" disabled>
            <input type="hidden" value="0" name="puntaje">
            <input type="submit" id="enviar" style="">
        </form>
        
        <script>
            window.onload = function(){
                document.getElementById('enviar').click();
            }
        </script>
            
    </body>
</html>
