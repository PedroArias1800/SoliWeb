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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSShumilde.css">
    <title>SOLI - Jugar</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>
<body>
    
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

        <p id="mod">Prueba - Nivel: <%=_nivel%></p><hr>

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

        <h3 id="timer"></h3>

        <h2 id="num"><b><u>Pregunta #<%=numPregunta%></u></b></h2>
        <h2><b><u>Tipo :<%=_tipo%></u></b></h2>
        <h1 id="preg"><%=pr.getEnunciado()%></h1>

        <div>
            <input type="button"
            value="<%=generarRespuestas[0]%>"
            class="btn" id="btn1">
            <input type="button"
            value="<%=generarRespuestas[1]%>"
            class="btn" id="btn2">
        </div>

            <%
                if(pr.getTipo()!=1){
            %>
        
        <div>
            <input type="button"
            value="<%=generarRespuestas[2]%>"
            class="btn" id="btn3">
            <input type="button"
            value="<%=generarRespuestas[3]%>"
            class="btn" id="btn4">
        </div>
    
        <%      }      

            if(numPregunta==10){
                enviar = "No";
            } else {
                enviar = "Si";
            }

        %>
    
        <h2 id="Retro" style="display: none;">Respuesta: <input type="text" id="corre" value="" readonly>
            La respuesta era <%=pr.getrCorrecta()%>
        </h2>

        <input type="hidden" value="<%=puntos%>" id="puntos">
        <input type="hidden" value="<%=pr.getrCorrecta()%>" id="resp">

        <form action="../Controles/C_Jugar.jsp" method="post">
            <input type="hidden" name="continuar" value="<%=enviar%>">
            <label value="Puntos: "><input type="number" value="0" name="puntaje" id="pun"></label>
            <input type="submit" onclick="" value="Siguiente Pregunta" class="btn btn5" id="sig" disabled>
        </form>

        <script>
                    $(function(){
                    $('#btn1, #btn2').on('click', function(){
                    document.getElementById("sig").disabled = false;
                    document.getElementById("btn1").disabled = true;
                    document.getElementById("btn2").disabled = true;

                    document.getElementById("Retro").style.display="block";

                    });
                    });

                    $(function() {
                    $('#btn1, #btn2').on('click', function() {

                        var era = "Incorrecto";

                        if((this.value).equals(document.getElementById('resp').value)){
                            era = "Correcta";
                            document.getElementById('puntos').value = "5";  
                        }

                            document.getElementById('puntos').value = "0";
                            document.getElementById('corre').value = era;
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

                        var era = "Incorrecto";

                        if((this.value).equals(document.getElementById('resp').value)){
                            era = "Correcta";
                            document.getElementById('puntos').value = "5";  
                        }

                            document.getElementById('puntos').value = "0";
                            document.getElementById('corre').value = era;
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

        <!--
        <script LANGUAGE="JavaScript">
            history.forward()
        </script>-->

        <script type="text/javascript">
            var count = 3;

            setInterval(function(){
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
                }
            }, 1000);

        </script>
    </body>
</html>