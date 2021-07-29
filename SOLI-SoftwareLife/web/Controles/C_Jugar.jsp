<%-- 
    Document   : C_Jugar
    Created on : 07/29/2021, 11:28:52 AM
    Author     : leone
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Preguntas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOLI - Jugar</title>
    </head>
    <body>
        <%
            int num = (int)session.getAttribute("iniciar");
            int repetir = 0;
            
            List<Preguntas> Devolver = new ArrayList<>();
            
            Preguntas p = new Preguntas();
            List<Preguntas> P = (List<Preguntas>)session.getAttribute("TodasLasP");
            
            for(Preguntas pr: P){
                p.setID_pregunta(pr.getID_pregunta());
                p.setEnunciado(pr.getEnunciado());
                p.setrCorrecta(pr.getrCorrecta());
                p.setrIncorrecta1(pr.getrIncorrecta1());
                p.setrIncorrecta2(pr.getrIncorrecta2());
                p.setrIncorrecta3(pr.getrIncorrecta3());
                p.setRetroalimentacion(pr.getRetroalimentacion());
                p.setTipo(pr.getTipo());
                p.setNivel(pr.getNivel());

                repetir=repetir+1;
                if(repetir==num){
                    break;
                }
            }

            Devolver.add(p);
            session.setAttribute("PreguntaActual", Devolver);
                
        %>
        
        <head><meta http-equiv="Refresh" content="0; URL=../Limites/P_Jugar.jsp"></head>
    </body>
</html>
