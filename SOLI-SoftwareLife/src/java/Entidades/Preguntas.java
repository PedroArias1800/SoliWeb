/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import Procesos.Conexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author leone
 */
public class Preguntas {

    /**
     * @return the ID_pregunta
     */
    public int getID_pregunta() {
        return ID_pregunta;
    }

    /**
     * @param ID_pregunta the ID_pregunta to set
     */
    public void setID_pregunta(int ID_pregunta) {
        this.ID_pregunta = ID_pregunta;
    }

    /**
     * @return the Enunciado
     */
    public String getEnunciado() {
        return Enunciado;
    }

    /**
     * @param Enunciado the Enunciado to set
     */
    public void setEnunciado(String Enunciado) {
        this.Enunciado = Enunciado;
    }

    /**
     * @return the rCorrecta
     */
    public String getrCorrecta() {
        return rCorrecta;
    }

    /**
     * @param rCorrecta the rCorrecta to set
     */
    public void setrCorrecta(String rCorrecta) {
        this.rCorrecta = rCorrecta;
    }

    /**
     * @return the rIncorrecta1
     */
    public String getrIncorrecta1() {
        return rIncorrecta1;
    }

    /**
     * @param rIncorrecta1 the rIncorrecta1 to set
     */
    public void setrIncorrecta1(String rIncorrecta1) {
        this.rIncorrecta1 = rIncorrecta1;
    }

    /**
     * @return the rIncorrecta2
     */
    public String getrIncorrecta2() {
        return rIncorrecta2;
    }

    /**
     * @param rIncorrecta2 the rIncorrecta2 to set
     */
    public void setrIncorrecta2(String rIncorrecta2) {
        this.rIncorrecta2 = rIncorrecta2;
    }

    /**
     * @return the rIncorrecta3
     */
    public String getrIncorrecta3() {
        return rIncorrecta3;
    }

    /**
     * @param rIncorrecta3 the rIncorrecta3 to set
     */
    public void setrIncorrecta3(String rIncorrecta3) {
        this.rIncorrecta3 = rIncorrecta3;
    }

    /**
     * @return the Retroalimentacion
     */
    public String getRetroalimentacion() {
        return Retroalimentacion;
    }

    /**
     * @param Retroalimentacion the Retroalimentacion to set
     */
    public void setRetroalimentacion(String Retroalimentacion) {
        this.Retroalimentacion = Retroalimentacion;
    }

    /**
     * @return the Tipo
     */
    public int getTipo() {
        return Tipo;
    }

    /**
     * @param Tipo the Tipo to set
     */
    public void setTipo(int Tipo) {
        this.Tipo = Tipo;
    }

    /**
     * @return the Nivel
     */
    public int getNivel() {
        return Nivel;
    }

    /**
     * @param Nivel the Nivel to set
     */
    public void setNivel(int Nivel) {
        this.Nivel = Nivel;
    }
    
    private int ID_pregunta;
    private String Enunciado;
    private String rCorrecta;
    private String rIncorrecta1;
    private String rIncorrecta2;
    private String rIncorrecta3;
    private String Retroalimentacion;
    private int Tipo;
    private int Nivel;
    Connection cn;
    
    public Preguntas(){
        this.cn= new Conexion().OpenDb();
    }
    
    public List<Preguntas> BuscarPreguntas(int nivel) throws SQLException{
        int cant;
        if(nivel==1){
            cant = 10;
        } else if(nivel==2){
            cant = 12;
        } else {
            cant = 15;
        }
        List<Preguntas> p = new ArrayList<>();
        try{   
            Statement stmt = cn.createStatement();
            String query = " SELECT * FROM cvid_pregunta WHERE nivel='"+nivel+"' ORDER BY rand() limit "+cant;
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                Preguntas P = new Preguntas();
                P.setID_pregunta(result.getInt("ID_pregunta"));
                P.setEnunciado(result.getString("Enunciado"));
                P.setrCorrecta(result.getString("rCorrecta"));
                P.setrIncorrecta1(result.getString("rIncorrecta1"));
                P.setrIncorrecta2(result.getString("rIncorrecta2"));
                P.setrIncorrecta3(result.getString("rIncorrecta3"));
                P.setRetroalimentacion(result.getString("Retroalimentacion"));
                P.setTipo(result.getInt("tipo"));
                P.setNivel(result.getInt("nivel"));
                
                p.add(P);
            } 
            result.close();
            stmt.close();
            
            return(p);
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        
        return null;
    } 
    
}
