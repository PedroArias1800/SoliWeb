<%-- 
    Document   : P_Jugar
    Created on : 07/28/2021, 08:39:34 PM
    Author     : leone
--%>

<%@page import="java.util.List"%>
<%@page import="Entidades.Preguntas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="../Css/Jugar.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,700;1,400&display=swap" rel="stylesheet">
    <title>SOLI - Jugar</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>
<body>
    <main>
        <div class="contenedor">
        <%
            int dif = (int)session.getAttribute("nivel");
            String _nivel="", _tipo="", enviar="";
            int dimension=0;
            
            int cantidadPreguntas=0;

            if(dif==1){
                _nivel="Fácil";
                cantidadPreguntas=10;
            } else if (dif==2){
                _nivel="Medio";
                cantidadPreguntas=12;
            } else {
                _nivel="Difícil";
                cantidadPreguntas=15;
            }

            int puntos = (int)session.getAttribute("puntaje");

        %>
        
        <br>
        <h3 id="mod">Prueba - Nivel: <%=_nivel%></h3><hr>
        <form style="align-content: center; padding-bottom: 20%; margin-bottom: 1.5%;">

        <%
            List<Preguntas> PreguntaActual = (List<Preguntas>)session.getAttribute("PreguntaActual");

            for(Preguntas pr: PreguntaActual){
                if(pr.getTipo()==1){
                    _tipo="Cierto Y Falso";
                    dimension = 2;
                } else {
                    _tipo="Mejor Respuesta";
                    dimension = 4;
                }

            String generarRespuestas [] = new String[dimension];
            int generarPuntos[] = new int[dimension];

            int numPregunta = (int)session.getAttribute("iniciar");

            if(pr.getTipo()!=1){

                int cantidad = dimension;
                int index = 0;
                int [] aleatorios = new int [cantidad];
                while(index < cantidad) {   
                    int propuesto = (int)(Math.random()*cantidad);
                    boolean repetido = false;
                    while(!repetido) {
                        for(int i=0; i<index; i++) {
                            if(propuesto == aleatorios[i]) {
                                repetido = true;
                                break;
                            }
                        }
                        if(!repetido) {
                            if(propuesto==0){
                                generarRespuestas[index] = pr.getrCorrecta();
                                generarPuntos[index] = 5;
                            } else if(propuesto==1){
                                generarRespuestas[index] = pr.getrIncorrecta1();
                                generarPuntos[index] = 0;
                            } else if(propuesto==2){
                                generarRespuestas[index] = pr.getrIncorrecta2();
                                generarPuntos[index] = 0;
                            } else {
                                generarRespuestas[index] = pr.getrIncorrecta3();
                                generarPuntos[index] = 0;
                            }
                            aleatorios[index] = propuesto;
                            index++;
                        }
                    }
                }
            }   else{
                int cantidad = dimension;
                int index = 0;
                int [] aleatorios = new int [cantidad];
                while(index < cantidad) {   
                    int propuesto = (int)(Math.random()*cantidad);
                    boolean repetido = false;
                    while(!repetido) {
                        for(int i=0; i<index; i++) {
                            if(propuesto == aleatorios[i]) {
                                repetido = true;
                                break;
                            }
                        }
                        if(!repetido) {
                            if(propuesto==0){
                                generarRespuestas[index] = pr.getrCorrecta();
                                generarPuntos[index] = 5;
                            } else {
                                generarRespuestas[index] = pr.getrIncorrecta3();
                                generarPuntos[index] = 5;
                            }
                            aleatorios[index] = propuesto;
                            index++;
                        }
                    }
                }
            }

        %>

        <h2 class="tipoPreg" id="num"><b><u>Pregunta #<%=numPregunta%></u><u style="margin-left: 20%;">Tipo :<%=_tipo%></u></b></h2>
        <h1 id="preg"><%=pr.getEnunciado()%></h1><h3 style="margin-left: 91%; margin-top: -15%; position: absolute; background-color: white; border: 1px solid black; border-radius: 5px; padding-left: 1%; padding-right: 1%;" id="timer"></h3>
        
        <div class="preg">
            <input type="button" value="<%=generarRespuestas[0]%>" id="btn1"><br>
            <input type="button" value="<%=generarRespuestas[1]%>" id="btn2"><br>
        </div>

            <%
                if(pr.getTipo()!=1){
            %>
        
        <div class="preg">
            <input type="button" value="<%=generarRespuestas[2]%>" id="btn3"><br>
            <input type="button" value="<%=generarRespuestas[3]%>" id="btn4"><br>
        </div>
    
        <%      }      

            if(numPregunta==cantidadPreguntas){
                enviar = "No";
            } else {
                enviar = "Si";
            }

        %>
        <div id="Retro" style="position: absolute; display: none;">
            <h2 style="margin-bottom: -4%; margin-top: -4%;">
                <img style="margin-bottom: -8%;" src="../Imagenes/Incorrecto.gif" id="corre2" alt="" width="500" height="200" style="display: none"><br>
                <img style="margin-bottom: -8%;" src="../Imagenes/Correcto.gif" id="corre1" alt="" width="500" height="200" style="display: none"><br>
            </h2>
            <h2 style="margin-top: 2rem;">
                La respuesta era: <%=pr.getrCorrecta()%>
            </h2>
        </div>

            <input type="hidden" value="<%=puntos%>" id="puntos">
            <input type="hidden" value="<%=pr.getrCorrecta()%>" id="resp">
        
        </form>
 
        <form action="../Controles/C_Jugar.jsp" method="post" style="display: flex; justify-content: center; margin-bottom: 4%;">
            <input type="hidden" name="continuar" value="<%=enviar%>">
            <h2>Puntos Adquiridos:<input style="margin-left: 2%; padding-right: -70%;" type="text" value="0" name="puntaje" id="pun" readonly></h2>
            <input type="submit" onclick="" value="Siguiente Pregunta" style="font-size: 2rem; background-color: #131a43; color: white; border-radius: 5px; margin-left: 2%; margin-right: 5%;" id="sig" disabled>
        </form>
 
        <script>
                    $(function(){
                    $('#btn1, #btn2').on('click', function(){
                    document.getElementById("sig").disabled = false;
                    document.getElementById("btn1").disabled = true;
                    document.getElementById("btn2").disabled = true;
 
                    document.getElementById("Retro").style.display="block";
                    detener();
                    
                    });
                    });
 
                    $(function() {
                    $('#btn1, #btn2').on('click', function() {
 
                        if(this.getAttribute('value') === document.getElementById('resp').getAttribute('value')){
                            document.getElementById('pun').value = 5;
                            document.getElementById('corre1').style.display = "block";
                            document.getElementById("corre2").style.display="none";
                        }
                           else{
                            document.getElementById('pun').value = 0;
                            document.getElementById('corre2').style.display = "block";
                            document.getElementById("corre1").style.display="none";
                        }
                        
                    detener();
                    });
                    });
 
                    $(function(){
                    $('#btn1, #btn2, #btn3, #btn4').on('click', function(){
                    document.getElementById("sig").disabled = false;
                    document.getElementById("btn1").disabled = true;
                    document.getElementById("btn2").disabled = true;
                    document.getElementById("btn3").disabled = true;
                    document.getElementById("btn4").disabled = true;
 
                    document.getElementById("Retro").style.display="block";
 
                    });
                    });
 
                    $(function() {
                    $('#btn1, #btn2, #btn3, #btn4').on('click', function() {
 
                        if(this.getAttribute('value') === document.getElementById('resp').getAttribute('value')){
                            era = "Correcta";
                            document.getElementById('pun').value = 5;
                            document.getElementById('corre1').style.display = "block";
                            document.getElementById("corre2").style.display="none";
                        }
                           else{
                            document.getElementById('pun').value = 0;
                            document.getElementById('corre2').style.display = "block";
                            document.getElementById("corre1").style.display="none";
                        }
                        
                    detener();
                    });
                    });
        </script>

            <%  
                session.removeAttribute("PreguntaActual");  

                numPregunta=numPregunta+1;
                session.removeAttribute("iniciar");
                session.setAttribute("iniciar", numPregunta);

                }  
            %>   

        
        <script LANGUAGE="JavaScript">
            history.forward()
        </script>

        <script type="text/javascript">
            var count = 3;

            var tiempo = setInterval(function(){
                count--;
                id = document.getElementById("timer");
                if(count>0){
                    if(count>5){
                        id.innerHTML = count;
                        document.getElementById("timer").style.color="green";
                    }
                    else{
                        id.innerHTML = count;
                        document.getElementById("timer").style.color="yellow";
                    }
                    if(count<10){
                        id.innerHTML = "0"+count;
                    }
                }
                else{
                    document.getElementById("timer").style.color="red";
                    id.innerHTML = "00";
                    document.getElementById("sig").disabled = false;
                    document.getElementById("btn1").disabled = true;
                    document.getElementById("btn2").disabled = true;
                    document.getElementById("btn3").disabled = true;
                    document.getElementById("btn4").disabled = true;

                    document.getElementById("Retro").style.display="block";
                    document.getElementById("corre2").style.display="block";
                    document.getElementById("corre1").style.display="none";
                }
            }, 1000);
            
            function detener(){
                clearInterval(tiempo);
            }

        </script>
        </div>
    </main>
    <script src="../JavaScript/script.js"></script>
    </body>
</html>