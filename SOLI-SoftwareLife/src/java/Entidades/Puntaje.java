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
public class Puntaje {

    /**
     * @return the ID_estudiante
     */
    public String getID_estudiante() {
        return ID_estudiante;
    }

    /**
     * @param ID_estudiante the ID_estudiante to set
     */
    public void setID_estudiante(String ID_estudiante) {
        this.ID_estudiante = ID_estudiante;
    }

    /**
     * @return the experienciaAvance
     */
    public int getExperienciaAvance() {
        return experienciaAvance;
    }

    /**
     * @param experienciaAvance the experienciaAvance to set
     */
    public void setExperienciaAvance(int experienciaAvance) {
        this.experienciaAvance = experienciaAvance;
    }

    /**
     * @return the intentoFacil
     */
    public int getIntentoFacil() {
        return intentoFacil;
    }

    /**
     * @param intentoFacil the intentoFacil to set
     */
    public void setIntentoFacil(int intentoFacil) {
        this.intentoFacil = intentoFacil;
    }

    /**
     * @return the intentoMedio
     */
    public int getIntentoMedio() {
        return intentoMedio;
    }

    /**
     * @param intentoMedio the intentoMedio to set
     */
    public void setIntentoMedio(int intentoMedio) {
        this.intentoMedio = intentoMedio;
    }

    /**
     * @return the intentoDificil
     */
    public int getIntentoDificil() {
        return intentoDificil;
    }

    /**
     * @param intentoDificil the intentoDificil to set
     */
    public void setIntentoDificil(int intentoDificil) {
        this.intentoDificil = intentoDificil;
    }

    /**
     * @return the total_p_correcta
     */
    public int getTotal_p_correcta() {
        return total_p_correcta;
    }

    /**
     * @param total_p_correcta the total_p_correcta to set
     */
    public void setTotal_p_correcta(int total_p_correcta) {
        this.total_p_correcta = total_p_correcta;
    }

    /**
     * @return the total_p_incorrecta
     */
    public int getTotal_p_incorrecta() {
        return total_p_incorrecta;
    }

    /**
     * @param total_p_incorrecta the total_p_incorrecta to set
     */
    public void setTotal_p_incorrecta(int total_p_incorrecta) {
        this.total_p_incorrecta = total_p_incorrecta;
    }
    
    private String ID_estudiante;
    private int experienciaAvance;
    private int intentoFacil;
    private int intentoMedio;
    private int intentoDificil;
    private int total_p_correcta;
    private int total_p_incorrecta;
    Connection cn;
    
    public Puntaje(){
        this.cn= new Conexion().OpenDb();
    }
    
    public List<Puntaje> BuscarPuntaje(String ID_estudiante) throws SQLException{

        List<Puntaje> p = new ArrayList<>();
        Puntaje P = new Puntaje();
        try{   
            Statement stmt = cn.createStatement();
            String query = "CALL PuntajeEstudiante('"+ID_estudiante+"')";
            ResultSet result = stmt.executeQuery(query);
            if(result.next()){
                P.setID_estudiante(result.getString("ID_estudiante"));/*
                P.setEnunciado(result.getString("Enunciado"));
                P.setrCorrecta(result.getString("rCorrecta"));
                P.setrIncorrecta1(result.getString("rIncorrecta1"));
                P.setrIncorrecta2(result.getString("rIncorrecta2"));
                P.setrIncorrecta3(result.getString("rIncorrecta3"));
                P.setRetroalimentacion(result.getString("Retroalimentacion"));
                P.setTipo(result.getInt("tipo"));
                P.setNivel(result.getInt("nivel"));
                */
                p.add(P);
                return(p);
            } 
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }/*
        P.setID_pregunta(0);
        P.setEnunciado(null);
        P.setrCorrecta(null);
        P.setrIncorrecta1(null);
        P.setrIncorrecta2(null);
        P.setrIncorrecta3(null);
        P.setRetroalimentacion(null);
        P.setTipo(0);
        P.setNivel(0);
        p.add(P);*/
        
        return p;
    } 
}
