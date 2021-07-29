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
</head>
<body>
    
    <%
        //int dif = Integer.parseInt(request.getParameter("dificultad"));
        int _preguntaActual=1, siguiente=0;
        String _nivel="", _tipo="";
        /*
        if(dif==1){
            _nivel="Fácil";
        } else if (dif==2){
            _nivel="Medio";
        } else {
            _nivel="Difícil";
        }*/
        
    %>
    
    <p id="mod">Prueba - Nivel: <%=_nivel%></p><hr>
    
    <%
        Preguntas p = new Preguntas();
        List<Preguntas> P = p.BuscarPreguntas(1);
        for(Preguntas pr: P){
            if(pr.getTipo()==1){
                _tipo="Cierto Y Falso";
            } else {
                _tipo="Mejor Respuesta";
            }
           
    %>
    
    <h3 id="timer"></h3>
    
    <h2 id="num"><b><u>Pregunta #<%=_preguntaActual%></u></b></h2>
    <h2><b><u>Tipo :<%=_tipo%></u></b></h2>
    <h1 id="preg"><%=pr.getEnunciado()%></h1>

    <div>
        <input type="button"
        value="<%=pr.getrCorrecta()%>"
        class="btn" id="btn1">
        <input type="button"
        value="<%=pr.getrIncorrecta1()%>"
        class="btn" id="btn2">
    </div>

        <%
            if(pr.getTipo()!=1){
        %>
        
    <div>
        <input type="button"
        value="<%=pr.getrIncorrecta2()%>"
        class="btn" id="btn3">
        <input type="button"
        value="<%=pr.getrIncorrecta3()%>"
        class="btn" id="btn4">
    </div>
    
    <%      }      %>
    
    <input type="button" onclick=""
    value="Siguiente Pregunta"
    class="btn btn5" id="sig" disabled>
    
    <head><meta http-equiv="Refresh" content=" ;"></head>
    
    <%
        
        if(siguiente>0){
            Thread.sleep(5000);
        }
        _preguntaActual++;
        siguiente++;
        
      }
        
    %>    
    
</body>

<script>
    
    
</script>

<script type="text/javascript">
    var count = 11;

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
        }
    }, 1000);

</script>

</html>