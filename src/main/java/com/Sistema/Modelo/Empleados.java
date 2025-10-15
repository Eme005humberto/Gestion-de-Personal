package com.Sistema.Modelo;

public class Empleados {
	
	private Integer id;
	private String nombre;
    private String apellido;
	private String dui;
	private String cargo;
	private String salario;
	
	
	
	public Empleados(Integer id) {
		super();
		this.id = id;
	}

	public Empleados() {
		super();
	}

	public Empleados(String nombre, String apellido, String dui, String cargo, String salario) {
		super();
		this.nombre = nombre;
		this.apellido = apellido;
		this.dui = dui;
		this.cargo = cargo;
		this.salario = salario;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getDui() {
		return dui;
	}
	public void setDui(String dui) {
		this.dui = dui;
	}
	public String getCargo() {
		return cargo;
	}
	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
	public String getSalario() {
		return salario;
	}
	public void setSalario(String salario) {
		this.salario = salario;
	}
	@Override
	public String toString() {
		return "Empleados [id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", dui=" + dui + ", cargo="
				+ cargo + ", salario=" + salario + "]";
	}
}
