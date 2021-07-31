<%-- 
    Document   : P_Retroalimentacion
    Created on : 07/29/2021, 12:37:20 PM
    Author     : leone
--%>

<%@page import="java.util.List"%>
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
            
            String _nivel="";
            String cedula = (String)session.getAttribute("ID_usuario");
            String imagen="../Imagenes/PuedesMejorar.gif";
            
            int porcentaje=0;
            int exis=0, i1=0, i2=0, i3=0;
            
            int nivel = (int)session.getAttribute("nivel");
            int puntos = (int)session.getAttribute("puntaje");
            int tpc = (int)session.getAttribute("tpc");
            int tpi = (int)session.getAttribute("tpi");
            
            porcentaje=tpc*100/(tpc+tpi);
            
            if(nivel==1){
                _nivel="Fácil";
                i1=1;
            } else if (nivel==2){
                _nivel="Medio";
                i2=1;
            } else {
                _nivel="Difícil";
                i3=3;
            }
            
            if(porcentaje<=91){
                imagen="../Imagenes/Excelente.gif";
            } else if(porcentaje<91 && porcentaje>71){
                imagen="../Imagenes/Bien.gif";
            }
            
            List<Puntaje> puntaje = p.BuscarPuntaje(cedula);
            for(Puntaje existe: puntaje){
                exis = 1;
            }
            
            boolean resultados = r.RegistrarIntento(cedula, nivel, puntos, i1, i2, i3, tpc, tpi, exis);
            
            if(resultados){     %>
                
                <br><p>Estos son tus resultados del intento<br><br>
                <h3>Puntos Obtenidos: <%=puntos%></h3>
                <h3>Intento: Nivel <%=_nivel%></h3>
                <h3>Respuestas Correctas: <%=tpc%></h3>
                <h3>Respuestas Incorrectas: <%=tpi%></h3>
                <h3>Porcentaje De Efectividad: <%=porcentaje%>%</h3>
                <img src="<%=imagen%>" alt="" width="500" height="200">
            
        <%
            }   else    {    %>
                    
                <br><p>Error Al Guardar Tus Resultados<br><br>
                Ah ocurrido un error al guardar en <strong>El Ranking</strong> :(</p><br><br><br>
                
        <%
            }

        session.removeAttribute("nivel");
        session.removeAttribute("puntaje");
        session.removeAttribute("tpc");
        session.removeAttribute("tpi");

        }   else {    %>
                
                <br><p>Esperamos que haya verificado todos los datos de la prueba<br><br>
                Sus resultados no se guardarán en <strong>El Ranking</strong> :)</p><br><br><br>
        
        <%  }     %>
        
        <form action="P_MenuLogin.jsp" method="post">
            <input type="submit" value="Volver Al Menú Principal">
        </form>
    </body>
</html>
