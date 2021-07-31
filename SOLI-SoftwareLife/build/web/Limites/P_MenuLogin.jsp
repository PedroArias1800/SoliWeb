<%-- 
    Document   : P_MenuLogin
    Created on : 06/21/2021, 01:26:31 PM
    Author     : leone
--%>

<%@page import="Entidades.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>    <!-- Titulo De La Página Del Navegador -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../Css/menu.css"/>
        <link rel="stylesheet" href="../Css/normalize.css"/>
        <!--<link rel="stylesheet" href="../Css/CSShumilde.css">-->
        <!-- comment <link rel="stylesheet" href="../Css/ModoClaro.css"/> --> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/fa9fd926a9.js" crossorigin="anonymous"></script>
        <!--<link rel="stylesheet" href="../Css/LoginMenuPrincipal.css"/>-->
    </head>
    <body>
        <header>  
            <h1 class="h1">Soli Software Life</h1><!-- Encabezado -->
           <p>
    
      
        <button class="btna" type="" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
            <i class="fas fa-cog  fa-camera fa-3x"></i>
        </button>
      </p>
      <div class="collapse submit" id="collapseExample">
        <div class="cc card-body">
            <Button  class="oscuro dark" id="dark">Modo Oscuro</Button>
            <Button onclick="window.location.href='P_Login.html'" class="oscuro dark" id="dark">Cerrar Session</Button>
      </div>
        </header>
        <%
            int IDUsuario = 0;
            if(session.getAttribute("tipoUsuario") != null){
                IDUsuario=(int)session.getAttribute("tipoUsuario");
            }
            Usuario u = new Usuario();
            u.setType(IDUsuario);
        %>
        <div  class="Opc2">
                <form action="../Controles/C_Login.jsp" method="post">
                    <input class="Botones" type="hidden" value="Salir" name="Correo">
                    <input class="Botones" type="hidden" value="Salir2" name="Password">
                    <input class="Botones" type="hidden" value="1" name="vengoDe"> 
                    <input class="Botones"  type="submit" value="" >
                </form>
            </div>
        <%
            if(IDUsuario==3){ 
        %>
        
        <% 
           session.setAttribute("iniciar", 1); 
           session.setAttribute("prA", 0);
           session.setAttribute("puntaje", 0);
        %>
         <h2>Menu Principal</h2>
          <div class="container">
    <div class="card">
        <div class="face face1">
            <div class="content">
                <i class="fas fasju fa-chalkboard-teacher fa-camera fa-5x"></i>
                <h3>Jugar</h3>
            </div>
        </div>
        <div class="face face2">
            <div class="content">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas cum cumque minus iste veritatis provident at.</p>
                    <a href="P_EscogerDificultad.html">Jugar</a>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="face face1">
            <div class="content">
                <i class="fas fasra fa-award fa-5x"></i>
                <h3>Ranking</h3>
            </div>
        </div>
        <div class="face face2">
            <div class="content">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas cum cumque minus iste veritatis provident at.</p>
                    <a href="P_Ranking.jsp">Ver Ranking</a>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="face face1">
            <div class="content">
                <img src="https://github.com/Jhonierpc/WebDevelopment/blob/master/CSS%20Card%20Hover%20Effects/img/launch_128.png?raw=true">
                <h3>Acerca de</h3>
            </div>
        </div>
        <div class="face face2">
            <div class="content">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas cum cumque minus iste veritatis provident at.</p>
                    <a href="P_AcercaDe.html">Saber mas</a>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="face face1">
            <div class="content">
                <i class="fas fasac fa-info fa-5x"></i>
                <h3>Infografia</h3>
            </div>
        </div>
        <div class="face face2">
            <div class="content">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas cum cumque minus iste veritatis provident at.</p>
                    <a href="#">Leer</a>
            </div>
        </div>
    </div>

 </div>

              <%  }
            else if(IDUsuario==2){
        %>
        <h2>Menu Principal</h2>
         <div class="container">
       <div class="card">
        <div class="face face1">
            <div class="content">
                <i class="fas fasju fa-chalkboard-teacher fa-camera fa-5x"></i>
                <h3>Jugar</h3>
            </div>
        </div>
        <div class="face face2">
            <div class="content">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas cum cumque minus iste veritatis provident at.</p>
                    <a href="P_EscogerDificultad.html">Jugar</a>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="face face1">
            <div class="content">
                <i class="fas fasra fa-award fa-5x"></i>
                <h3>Ranking</h3>
            </div>
        </div>
        <div class="face face2">
            <div class="content">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas cum cumque minus iste veritatis provident at.</p>
                    <a href="P_Ranking.jsp">Ver Ranking</a>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="face face1">
            <div class="content">
                <img src="https://github.com/Jhonierpc/WebDevelopment/blob/master/CSS%20Card%20Hover%20Effects/img/launch_128.png?raw=true">
                <h3>Ad. Preguntas</h3>
            </div>
        </div>
        <div class="face face2">
            <div class="content">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas cum cumque minus iste veritatis provident at.</p>
                    <a href="#">Saber mas</a>
            </div>
        </div>
    </div>
             </div>
        <%
            }
            else{
        %>  
        <h2>Menu Principal</h2>
         <div class="container">
        <div class="card ">
        <div class="face face1 ">
            <div class="content ">
                <i class="fas fasju fa-chalkboard-teacher fa-camera fa-5x"></i>
                <h3>Ad. Usuarios</h3>
            </div>
        </div>
        <div class="face face2">
            <div class="content">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas cum cumque minus iste veritatis provident at.</p>
                    <a href="#">Gestionar</a>
            </div>
        </div>
    </div>
             </div>
       
         
        <%  }  %>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="../JavaScript/script.js"></script>
    </body>
</html>
