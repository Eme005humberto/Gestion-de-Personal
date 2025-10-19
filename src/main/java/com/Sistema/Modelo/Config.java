package com.Sistema.Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Config {
	
	private static final String USUARIO = "root";
	private static final String CLAVE = "";
	private static final String URL = "jdbc:mysql://localhost:3306/dbCRUD_JAVAWeb";
	
	private static Connection conexion = null;
	
	public static Connection conectarse() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conexion = DriverManager.getConnection(URL,USUARIO,CLAVE);
			System.out.println("Conexion exitosa!!");
		}catch(ClassNotFoundException | SQLException e) {
			System.out.println("Error de conexion "+e);
		}
		return conexion;
	}
	
	public static void close(Connection conn){
        try{
            conn.close();
        }catch(SQLException ex){
            ex.printStackTrace(System.out);
        }
    }

    public static void close(ResultSet rs){
        try{
            rs.close();
        }catch(SQLException ex){
            ex.printStackTrace(System.out);
        }
    }

    public static void close(PreparedStatement stmt){
        try{
            stmt.close();
        }catch(SQLException ex){
            ex.printStackTrace(System.out);
        }
    }
}
