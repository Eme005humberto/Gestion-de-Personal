package com.Sistema.Modelo;

import com.Sistema.DAO.EmpleadosService;

public class Test {

	public static void main(String[] args) {
		EmpleadosService sr = new EmpleadosService();
		sr.listarEmpleados();
	}

}
