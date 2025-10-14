
package com.Sistema.DAO;

import com.Sistema.Modelo.Empleados;
import java.util.List;

/**
 *
 * @author Emerson Humberto
 */
public interface IEmpleadosService {
 
    public List<Empleados> listarEmpleados();
    
    public int crearEmpleado (Empleados modelo);
    
    public int modificarEmpleado(Empleados modelo);
    
    public int eliminarEmpleado(int id);
    
    public Empleados BuscarEmpleado(Empleados modelo);
}
