
package com.Sistema.DAO;

import com.Sistema.Modelo.Config;
import com.Sistema.Modelo.Empleados;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Emerson Humberto
 */
public class EmpleadosService implements IEmpleadosService{
    
    public static final String SQL_LISTAR = "SELECT id, nombre, apellido, dui,cargo ,salario FROM EMPLEADOS";
    public static final String SQL_AGREGAR = "INSERT INTO EMPLEADOS(Nombre,Apellido,DUI,Cargo,Salario)"
            + "VALUES(?,?,?,?,?)";
    public static final String SQL_MODIFICAR =  "UPDATE EMPLEADOS SET Nombre = ?,Apellido = ?, DUI = ?,Cargo = ?,"
            + "Salario = ? WHERE Id = ?";
    public static final String SQL_ELIMINAR = "DELETE FROM EMPLEADOS WHERE Id = ?";
    
    public static final String SQL_BUSCAR = "SELECT * FROM EMPLEADOS WHERE Id = ?";
    
    @Override
    public List<Empleados> listarEmpleados() {
        List<Empleados> listaEmpleados = new ArrayList<>();
        Empleados empleado = new Empleados();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Config.conectarse();//aAbrimos la conexion
            ps = con.prepareStatement(SQL_LISTAR);//Preparamos la consulta sql
            rs = ps.executeQuery();//Ejecutamos el Query
            while(rs.next()){
                empleado = new Empleados();
                empleado.setId(rs.getInt("id"));
                empleado.setNombre(rs.getString("nombre"));
                empleado.setApellido(rs.getString("apellido"));
                empleado.setDui(rs.getString("dui"));
                empleado.setCargo(rs.getString("cargo"));
                empleado.setSalario(rs.getString("salario"));
                listaEmpleados.add(empleado);//Agregamos los datos a la lista
                System.out.println(listaEmpleados);
            }
        }catch(SQLException ex){
            System.out.println("Error "+ex);
        }finally{
            //Cerramos conexiones
            Config.close(con);
            Config.close(rs);
            Config.close(ps);
        }
        return listaEmpleados;//Devolvemos los datos
    }

    @Override
    public int crearEmpleado(Empleados modelo) {
        Connection con = null;
        PreparedStatement ps = null;
        int resultado = 0;
        try{
            con = Config.conectarse();//Abrimos la conexion
            ps = con.prepareStatement(SQL_AGREGAR);
            ps.setString(1, modelo.getNombre());
            ps.setString(2, modelo.getApellido());
            ps.setString(3, modelo.getDui());
            ps.setString(4, modelo.getCargo());
            ps.setString(5, modelo.getSalario());
            resultado = ps.executeUpdate();//Ejecutamos la consulta
        }catch(SQLException ex){
            System.out.println("Error "+ex);
        }finally{
            Config.close(con);
            Config.close(ps);
        }
        return resultado; //Devolvemos el resultado
    }

    @Override
    public int modificarEmpleado(Empleados modelo) {
        Connection con = null;
        PreparedStatement ps = null;
        int resultado = 0;
        try{
            con = Config.conectarse();//Abrimos la conexion
            ps = con.prepareStatement(SQL_MODIFICAR);
            ps.setString(1, modelo.getNombre());
            ps.setString(2, modelo.getApellido());
            ps.setString(3, modelo.getDui());
            ps.setString(4, modelo.getCargo());
            ps.setString(5, modelo.getSalario());
            ps.setInt(6, modelo.getId());
            resultado = ps.executeUpdate();//Ejecutamos la consulta
        }catch(SQLException ex){
            System.out.println("Error "+ex);
        }finally{
            Config.close(con);
            Config.close(ps);
        }
        return resultado; //Devolvemos el resultado
    }

    @Override
    public int eliminarEmpleado(int id) {
         Connection con = null;
        PreparedStatement ps = null;
        int resultado = 0;
        try{
            con = Config.conectarse();//Abrimos la conexion
            ps = con.prepareStatement(SQL_ELIMINAR);
            ps.setInt(1, id);
            resultado = ps.executeUpdate();//Ejecutamos la consulta
        }catch(SQLException ex){
            System.out.println("Error "+ex);
        }finally{
            Config.close(con);
            Config.close(ps);
        }
        return resultado; //Devolvemos el resultado
    }

	@Override
	public Empleados BuscarEmpleado(Empleados modelo) {
		Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
        	con = Config.conectarse();
        	ps = con.prepareStatement(SQL_BUSCAR);	
        	ps.setInt(1, modelo.getId());
        	rs = ps.executeQuery();
        	rs.next();
        	
        	String nombre = rs.getString("nombre");
        	String apellido = rs.getString("apellido");
        	String dui = rs.getString("dui");
        	String cargo = rs.getString("cargo");
        	String salario = rs.getString("salario");
        	
        	modelo.setNombre(nombre);
        	modelo.setApellido(apellido);
        	modelo.setDui(dui);
        	modelo.setCargo(cargo);
        	modelo.setSalario(salario);
        	
        }catch(Exception ex) {
        	System.out.println("Error al encontrar al empleado "+ex);
        }finally {
        	Config.close(con);
        	Config.close(ps);
        	Config.close(rs);
        }
		return modelo;//Devolvemos el registro
	}
    
}
