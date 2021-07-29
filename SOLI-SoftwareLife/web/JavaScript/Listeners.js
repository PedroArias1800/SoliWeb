/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function vermas(id){
    if(id==="mas"){
        document.getElementById("desplegar").style.display="block";
        document.getElementById("mas").style.display="none";
    }
    else{
        document.getElementById("desplegar").style.display="none";
        document.getElementById("mas").style.display="inline";
    }
    
    let mostrar = document.getElementById("mostrar");
  
    if(mostrar.getAttribute("onclick") === "vermas('mas')") {
        mostrar.onclick = "vermas('menos')";
        document.getElementById("desplegar").style.display="block";
        document.getElementById("mas").style.display="none";
    } else {
        mostrar.onclick = "vermas('mas')";
        document.getElementById("desplegar").style.display="none";
        document.getElementById("mas").style.display="inline";
    }
}