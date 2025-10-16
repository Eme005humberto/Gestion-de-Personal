package com.Sistema.Controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Sistema.DAO.EmpleadosService;
import com.Sistema.Modelo.Empleados;

@WebServlet("/SvEmpleados")
public class SvEmpleados extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SvEmpleados() {
        super();
        
    }

    private void accionDefault(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            List<Empleados> listaEmpleados = new EmpleadosService().listarEmpleados();
            request.setAttribute("empleados", listaEmpleados);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");
		if(accion != null) {
			switch(accion) {
			case "editar":
			 this.editarEmpleado(request,response);
			}
		}
		 accionDefault(request, response);
	}

	
	private void editarEmpleado(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException{
		int idEmpleado = Integer.parseInt(request.getParameter("id"));
		Empleados empleado = new EmpleadosService().BuscarEmpleado(new Empleados(idEmpleado));
		request.setAttribute("empleado", empleado);
		
		String jspEditar = "editarEmpleado.jsp";
		request.getRequestDispatcher(jspEditar).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");
		if(accion != null) {
			switch(accion) {
			case "insertar":
				this.insertarEmpleado(request,response);
				return;
			case "modificar":
				this.modificarEmpleado(request,response);
				return;
		}
	}else {
		
	}
		accionDefault(request,response);
}

	private void modificarEmpleado(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException,IOException{
		/*Agregamos los parametros a utilizar*/
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String dui = request.getParameter("dui");
		String cargo = request.getParameter("cargo");
		String salario = request.getParameter("salario");
		int id = Integer.parseInt(request.getParameter("id"));
		
		Empleados empleado = new Empleados(id,nombre,apellido,dui,cargo,salario); 
		int registrosModificados = new EmpleadosService().modificarEmpleado(empleado);
		System.out.println("Registros modificados: "+registrosModificados);
		
		this.accionDefault(request, response);//Invocamos el metodo que carga la lista
		//de empleados
		
	}

	private void insertarEmpleado(HttpServletRequest request, HttpServletResponse response)
		throws ServletException,IOException{
		    /*Agregamos los parametros a utilizar*/
			String nombre = request.getParameter("nombre");
			String apellido = request.getParameter("apellido");
			String dui = request.getParameter("dui");
			String cargo = request.getParameter("cargo");
			String salario = request.getParameter("salario");
			/*Creamos un objeto del modelo con sus parametros*/
			Empleados empleado = new Empleados(nombre,apellido,dui,cargo,salario);
			/*Invocamos el metodo que se encarga de crear un nuevo empleado y el resultado
			 * lo guardamos en una variable*/
			int registroModificados = new EmpleadosService().crearEmpleado(empleado);
			/*creamos una clave y la obtenemos por medio de una sesion
			 * en donde validamos si hubieron registros ingresados o modificados si se agrego
			 * 1 registro la respuesta es ok y caso contrario si no se ingreso
			 * la respuesta es error posteriormente enviamos la respuesta al contexto del 
			 * servlet para que envie la informacion actualizada a la vista*/
			request.getSession().setAttribute("flash", (registroModificados == 1) ? "ok" : "error");
		    response.sendRedirect(request.getContextPath() + "/SvEmpleados");
		}
		
	}

