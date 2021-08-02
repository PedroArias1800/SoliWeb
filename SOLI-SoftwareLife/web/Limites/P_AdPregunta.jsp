<%-- 
    Document   : P_AdPregunta
    Created on : 08/01/2021, 08:52:37 PM
    Author     : leone
--%>

<%@page import="java.util.List"%>
<%@page import="Entidades.Preguntas"%>
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
    <body >
        <main>
        <audio src="../Sonidos/resum.mp3" autoplay loop></audio>
        <button  type="button" onclick="window.location.href='P_MenuLogin.jsp'" class="submit oscuro o1 regresar">Regresar</button>
        <div class="contenedor">
        <p style="text-align: center; margin-bottom: -4%; margin-top: -4%;">
            <img src="../Imagenes/Soli.png" alt="" width="400rem" height="200rem">
        </p><!-- Encabezado -->
        <form style="margin-bottom: 2%;">
            <div class="otros" style="position: absolute; margin-left: 80%; margin-top: -3%;">
                <button type="button" onclick="window.location.href='P_NuevaPregunta.html'" class="submit primary rec">Crear Pregunta</button>
            </div>
            <div style="margin-top: -3%;">
                <h3>Registro De Preguntas Creadas</h3>
                <h2 style="text-align: center">Está ordenado por tipo de pregunta y nivel</h2><br>
            </div>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col">Pregunta</th>
                    <th scope="col">Enunciado</th>
                    <th scope="col">Correcta</th>
                    <th scope="col">Incorrecta 1</th>
                    <th scope="col">Incorrecta 2</th>
                    <th scope="col">Incorrecta 3</th>
                    <th scope="col">Retroalimentación</th>
                    <th scope="col">Nivel</th>
                    <th scope="col">Tipo</th>
                </tr>
            </thead>
            
        <%
            String nivel="", pos2="Fácil", tipo="", lleva="";
            int pos=0;
            Preguntas p = new Preguntas();
            List<Preguntas> P = p.BuscarTodasLasPreguntas();
            for(Preguntas pr: P){

                if(pr.getTipo()==1){
                    tipo="Cierto Y Falso";
                    lleva="No admitido";
                } else {
                    tipo="Mejor Respuesta";
                }

                if(pr.getNivel()==1){
                    nivel="Fácil";
                } else if(pr.getNivel()==2){
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
             
                <tbody>
                    <tr>
                        <th scope="row"><%=pos%></th>
                        <td><%=pr.getEnunciado()%></td>
                        <td><%=pr.getrCorrecta()%></td>
                        <td><%=pr.getrIncorrecta1()%></td>
                        <%
                            if(tipo.equals("Cierto Y Falso")){  %>
                            
                            <td><%=lleva%></td>
                            <td><%=lleva%></td>
                                
                        <%    } else {   %>
                        
                            <td><%=pr.getrIncorrecta2()%></td>
                            <td><%=pr.getrIncorrecta3()%></td>
                        
                        <%  }   %>
                        
                        <td><%=pr.getRetroalimentacion()%></td>
                        <td><%=nivel%></td>
                        <td><%=tipo%></td>
                    </tr>                    
                </tbody>
        
        <%
            }
        %>
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

