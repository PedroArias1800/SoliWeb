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
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="../Css/login.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,700;1,400&display=swap" rel="stylesheet">
        <title>Retroalimentación</title>
    </head>
    <body>
        <main>
        <div class="contenedor">
            <div class="titulos">
                <h3>Retroalimentación Del Intento</h3>
            </div>
            <form id="retroa">
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
            
            if(porcentaje>=91){
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
                
            <div>
                <h3>Estos son tus resultados:</h3><br><br>
                <h2>Puntos Obtenidos: <%=puntos%></h2>
                <h2>Intento: Nivel <%=_nivel%></h2>
                <h2>Respuestas Correctas: <%=tpc%></h2>
                <h2>Respuestas Incorrectas: <%=tpi%></h2>
                <h2>Porcentaje De Efectividad: <%=porcentaje%>%</h2>
                <img style="margin-left: 27%;" src="<%=imagen%>" alt="" width="500" height="150">
            
        <%
            }   else    {    %>
                    
                <br><p>Error Al Guardar Tus Resultados<br><br>
                Ah ocurrido un error al guardar en <strong>El Ranking</strong></p><br><br><br>
                
        <%
            }

        session.removeAttribute("nivel");
        session.removeAttribute("puntaje");
        session.removeAttribute("tpc");
        session.removeAttribute("tpi");

        }   else {    %>
                
                <br><p>Esperamos que haya verificado todos los datos de la prueba<br><br>
                Sus resultados no se guardarán en <strong>El Ranking</strong></p><br><br><br>
        
        <%  }     %>
            <div class="otros">
              <button type="button" style="margin-left: 41%;" onclick="window.location.href='P_MenuLogin.jsp'" class="submit primary reg">Volver Al Menú Principal</button>
            </div>
            </div>
            </form>
        <script src="../JavaScript/script.js"></script>
        </div>
        </main>
    </body>
</html>
