/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function CambiarModo() {
  let modo = document.getElementById("modo");

  if (modo.getAttribute("href") == "../Css/ModoClaro.css") {
    modo.href = "../Css/ModoOscuro.css";
  } else {
    modo.href = "../Css/ModoClaro.css";
  }
}
