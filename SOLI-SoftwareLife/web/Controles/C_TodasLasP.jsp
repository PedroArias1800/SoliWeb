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
            int num = (int)session.getAttribute("nivel");
            List<Preguntas> P = p.BuscarPreguntas(num);
            
            session.setAttribute("TodasLasP", P);
        %>
        
        <head><meta http-equiv="Refresh" content="0; URL=../Controles/C_Jugar.jsp"></head>
    </body>
</html>
