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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ranking</title>
        <link rel="stylesheet" href="../Css/LoginPrincipal.css"/>
        <!--<link rel="stylesheet" href="../Css/CSShumilde.css">-->
        <link rel="stylesheet" href="../Css/ModoClaro.css"/>
        <link rel="stylesheet" href="../Css/p_ranking.css"/>

    </head>
    <body class="Fondo">
        <header>    <!-- Encabezado -->
           
            <div class="container">
                    <span style="--l: 'S';" >S</span>
                    <span style="--l: 'O';" >O </span>
                    <span style="--l: 'L';" >L</span>
                    <span style="--l: 'I';" >I</span>
                    <br>
                    </div>
                    <div class="container1">
                    <span style="-l: '¡Software Life';">Software Life</span>         
            </div>
           <!--  <h1 class="Titulo">SOLI<br>Software Life</h1>
            <h2 class="Login">Menú Principal</h2> -->
        </header>
        <div>
            <label for='dif'>Selecciona una dificultad</label>
            <select name='dif'>
                <optgroup>
                    <option value='1'>Fácil</option>
                    <option value='2'>Medio</option>
                    <option value='3'>Difícil</option>
                </optgroup>
            </select>
        </div>
        <div id="main-container">
            
            <table>
                <caption>Ranking De Los Estudiantes</caption>
                <thead>
                    <tr>
                        <th>Posición</th>
                        <th>Cédula</th>
                        <th>Nombre Completo</th>
                        <th>Puntos</th>
                    </tr>
                </thead>
                <tbody>
            
            <%
                Ranking r = new Ranking();
                List<Ranking> R = r.BuscarRanking();
                for(Ranking ra: R){
            %>

                    <tr>
                        <td><%=ra.getPos()%></td>
                        <td><%=ra.getID_estudiante()%></td>
                        <td><%=ra.getNombre()+" "+ra.getApellido()%></td>
                        <td><%=ra.getPuntos()%></td>
                    </tr>

            <%
                }
            %>
                    
                </tbody>
            </table>
        </div>
            
        <footer>    <!-- Imágenes Con Enlaces De La UTP Y FISC -->
            <a href="https://utp.ac.pa/"><img class="utp" src="https://utp.ac.pa/documentos/2015/imagen/logo_utp_1_72.png" alt="" width="150" height="150"></a>
            <a href="https://fisc.utp.ac.pa/"><img src="https://fisc.utp.ac.pa/sites/fisc.utp.ac.pa/files/documentos/2020/imagen/logo_en_contactenos.png" alt="" width="150" height="150"></a>
        </footer>
    </body>
</html>
