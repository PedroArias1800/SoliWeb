/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author leone
 */

import Procesos.Conexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Usuario {

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the type
     */
    public int getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(int type) {
        this.type = type;
    }

    /**
     * @return the ID_usuario
     */
    public String getID_usuario() {
        return ID_usuario;
    }

    /**
     * @param ID_usuario the ID_usuario to set
     */
    public void setID_usuario(String ID_usuario) {
        this.ID_usuario = ID_usuario;
    }
    
    private String firstName;
    private String lastName;
    private String email;
    private int type;
    private String ID_usuario;
    Connection cn;
    
    public Usuario(){
        this.cn= new Conexion().OpenDb();
    }
    
    public List<Usuario> LoginUser(String email, String psswd) throws SQLException{
        List<Usuario> u = new ArrayList<>();
        Usuario U = new Usuario();
        try{   
            Statement stmt = cn.createStatement();
            String query = "SELECT * FROM cvid_usuario ";
            query += "WHERE email='"+email+"' and psswd='"+psswd+"'";
            ResultSet result = stmt.executeQuery(query);
            if(result.next()){
                U.setFirstName(result.getString("firstname"));
                U.setLastName(result.getString("lastname"));
                U.setEmail(result.getString("email"));
                U.setType(result.getInt("tipo"));
                U.setID_usuario(result.getString("ID_usuario"));
                u.add(U);
                return(u);
            } 
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        U.setFirstName(null);
        U.setLastName(null);
        U.setEmail(null);
        U.setType(0);
        U.setID_usuario(null);
        u.add(U);
        
        return u;
    } 
    
    public boolean RegistrarUsuario(String Cedula, String firstName, String lastName, String Email, String Contra1, int Type) throws SQLException{
        try{   
            int r;
            Statement stmt = cn.createStatement();
            //String query = "INSERT INTO cvid_usuario('"+Cedula+"','"+firstName+"', '"+lastName+"', '"+Email+"'. '"+Contra1+"', '"+Type+"')";
            String query = "CALL RegistrarUsuario('"+Cedula+"', '"+firstName+"', '"+lastName+"', '"+Email+"', '"+Contra1+"', '"+Type+"')";
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
