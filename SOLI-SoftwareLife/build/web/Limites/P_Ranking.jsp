<%-- 
    Document   : P_Ranking
    Created on : 06/23/2021, 12:36:37 PM
    Author     : leone
--%>

<%@page import="Entidades.Ranking"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ranking</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="../Css/login.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,700;1,400&display=swap" rel="stylesheet">
    </head>
    <body>
        <audio src="../Sonidos/resum.mp3" autoplay loop></audio>
        <main>
        <button  type="button" onclick="window.location.href='P_MenuLogin.jsp'" class="submit oscuro o1 regresar">Regresar</button>
        <div class="contenedor">
        <p style="text-align: center; margin-bottom: -5%; margin-top: -3.5%;">
            <img src="../Imagenes/Soli.png" alt="" width="400rem" height="200rem">
        </p><!-- Encabezado -->
        <form action="../Controles/C_Login.jsp" method="post" style="margin-bottom: 2%;">
            <div class="titulos">
                <h3>Ranking General Por Dificultad</h3>
                <h2 style="text-align: center">Está ordenado por nivel y puntaje</h2><br>
            </div>
            
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th scope="col">Posición</th>
                        <th scope="col">Cédula</th>
                        <th scope="col">Nombre Completo</th>
                        <th scope="col">Puntos</th>
                        <th scope="col">Nivel</th>
                    </tr>
                </thead>
                <tbody>
            
            <%
                String nivel="", pos2="Fácil";
                int pos=0;
                Ranking r = new Ranking();
                List<Ranking> R = r.BuscarRanking();
                for(Ranking ra: R){
                    
                if(ra.getNivel()==1){
                    nivel="Fácil";
                } else if(ra.getNivel()==2){
                    nivel="Medio";
                } else {
                    nivel="Difícil";
                }
                
                if(pos2.equals(nivel)){
                    pos++;
                } else {
                    pos2=nivel;
                    pos=1;
                }
            %>

                    <tr>
                        <th scope="row"><%=pos%></th>
                        <td><%=ra.getID_estudiante()%></td>
                        <td><%=ra.getNombre()+" "+ra.getApellido()%></td>
                        <td><%=ra.getPuntos()%></td>
                        <td><%=nivel%></td>
                    </tr>

            <%  
                }
            %>
                    
                </tbody>
            </table>
            </form>
        </div>
        <footer>   
            <div class="contededor">
                <a href="https://utp.ac.pa/"><img  class="utp" src="../Imagenes/utp.png" alt="" width="150" height="150"></a>
                <a href="https://fisc.utp.ac.pa/"><img class="fisc" src="../Imagenes/fisc.png" alt="" width="150" height="150"></a>
            </div>
            <!-- Imágenes Con Enlaces De La UTP Y FISC -->
          
        </footer><br>
        </main> 
        <script src="../JavaScript/script.js"></script>
    </body>
</html>
