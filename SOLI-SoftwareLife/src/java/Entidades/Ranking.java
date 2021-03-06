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
public class Ranking {

    /**
     * @return the nivel
     */
    public int getNivel() {
        return nivel;
    }

    /**
     * @param nivel the nivel to set
     */
    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    /**
     * @return the Nombre
     */
    public String getNombre() {
        return Nombre;
    }

    /**
     * @param Nombre the Nombre to set
     */
    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    /**
     * @return the Apellido
     */
    public String getApellido() {
        return Apellido;
    }

    /**
     * @param Apellido the Apellido to set
     */
    public void setApellido(String Apellido) {
        this.Apellido = Apellido;
    }

    /**
     * @return the pos
     */
    public int getPos() {
        return pos;
    }

    /**
     * @param pos the pos to set
     */
    public void setPos(int pos) {
        this.pos = pos;
    }

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
     * @return the puntos
     */
    public int getPuntos() {
        return puntos;
    }

    /**
     * @param puntos the puntos to set
     */
    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }
    
    private int pos=0;
    private String ID_estudiante;
    private String Nombre;
    private String Apellido;
    private int puntos;
    private int nivel;
    Connection cn;
    
    public Ranking(){
        this.cn= new Conexion().OpenDb();
    }
    
    public List<Ranking> BuscarRanking() throws SQLException{
        List<Ranking> r = new ArrayList<>();
        try{   
            Statement stmt = cn.createStatement();
            String query = "CALL MostrarRanking()";
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                Ranking R = new Ranking();
                R.setPos(pos=pos+1);
                R.setID_estudiante(result.getString("r.estudiante"));
                R.setNombre(result.getString("u.firstname"));
                R.setApellido(result.getString("u.lastname"));
                R.setPuntos(result.getInt("pun"));
                R.setNivel(result.getInt("r.nivel_id"));
                r.add(R);
            } 
           result.close();
           stmt.close();
           
           return(r);
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
       
        return(null);
    }
    
    public boolean RegistrarIntento(String Cedula, int nivel, int puntos, int i1, int i2, int i3, int tpc, int tpi, int existe) throws SQLException{
        try{
            int r;
            Statement stmt = cn.createStatement();
            String query="";
            if(existe==0){
                query = "CALL InsertarPuntajeNuevo('"+Cedula+"', '"+nivel+"', '"+puntos+"', '"+i1+"', '"+i2+"', '"+i3+"', '"+tpc+"', '"+tpi+"')";
            } else {
                query = "CALL InsertarPuntaje('"+Cedula+"', '"+nivel+"', '"+puntos+"', '"+i1+"', '"+i2+"', '"+i3+"', '"+tpc+"', '"+tpi+"')";
            }
            
            r = stmt.executeUpdate(query);
            if(r>0){
                return true;
            }
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        
        return false;
    } 
    
}