/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author leone
 */
public class Conexion {
    public Connection OpenDb(){
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/soli", "root", "");
        }
        catch(ClassNotFoundException ex){
            System.out.println("Error, no encontré la clase MySQL");
        }
        catch(SQLException ex){
            System.out.println("Error, no pude conectarme a la Base De Datos");
        }
    return null;
    }    
}
