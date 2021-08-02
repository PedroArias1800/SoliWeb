<%-- 
    Document   : C_NuevaPregunta
    Created on : 08/01/2021, 10:29:20 PM
    Author     : leone
--%>

<%@page import="Entidades.Preguntas"%>
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
        <title>SOLI - Crear Pregunta</title>
    </head>
    <body class="Fondo">
        <header>    <!-- Encabezado -->
        <div class="contenedor">
            <p style="text-align: center; margin-top: 1%;">
                <img src="../Imagenes/Soli.png" alt="" width="400rem" height="200rem">
            </p>
            <form>
                
        <% 
            int tipo = Integer.parseInt(request.getParameter("tipo"));
            int nivel = Integer.parseInt(request.getParameter("nivel"));
            String enunciado = request.getParameter("enunciado");
            String retro = request.getParameter("retroalimentacion");
            String correcto = request.getParameter("correcto");
            String inco1 = request.getParameter("incorrecto1");
            String inco2 = request.getParameter("incorrecto2");
            String inco3 = request.getParameter("incorrecto3");
           
            if(tipo==1){
                inco2="No admitido";
                inco3=inco2;
            }
            
            Preguntas Pr = new Preguntas();
            boolean resultado = Pr.RegistrarPregunta(enunciado, correcto, inco1, inco2, inco3, retro, tipo, nivel);
            if(resultado){

        %>
        
            <div class="titulos" style="align-content: center">
                <h3 style="margin-bottom: 5%;">Pregunta Creada Exitosamente!</h3>
                </div>

                <div class="form-group">
                    <h2 style="text-align: center;">Se añadió la pregunta</h2><br>
                    <div class="sk-folding-cube">
                        <div class="sk-cube1 sk-cube"></div>
                        <div class="sk-cube2 sk-cube"></div>
                        <div class="sk-cube4 sk-cube"></div>
                        <div class="sk-cube3 sk-cube"></div>
                    </div><br>
                    <h2 style="text-align: center;">Redirigiendo a <strong>Formulario De Crear Preguntas...</strong></h2>
                </div>
                <head><meta http-equiv="Refresh" content="3 ; URL=../Limites/P_NuevaPregunta.html"></head>
                <%  } else{ %>
                
                <div class="titulos">
                <h3 style="margin-bottom: 5%;">No Se Pudo Crear Su Pregunta</h3>
                </div>

                <div class="form-group">
                    <h2 style="text-align: center;">No se añadió la pregunta</h2><br>
                    <div class="sk-folding-cube">
                      <div class="sk-cube1 sk-cube"></div>
                      <div class="sk-cube2 sk-cube"></div>
                      <div class="sk-cube4 sk-cube"></div>
                      <div class="sk-cube3 sk-cube"></div>
                    </div><br>
                    <h2 style="text-align: center;">Ah ocurrido un error, redirigiendo a <strong>Formulario De Crear Pregunta...</strong></h2>
                </div>
                
                <head><meta http-equiv="Refresh" content="3 ; URL=../Limites/P_NuevaPregunta.html"></head>
            
        <%      }       %> 
            
            </form>
        </div>
        </header>
        <script src="../JavaScript/script.js"></script>
    </body>
</html>
