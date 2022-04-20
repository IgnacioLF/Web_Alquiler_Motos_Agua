package tiendamotos;

public class Motos {
	private int id;
	private String matricula;
	private String marca;
	private String modelo;
	private double cv;
	private double cc;
	private int num_plazas;
	public Motos() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Motos(int id, String matricula, String marca, String modelo, double cv, double cc, int num_plazas) {
		super();
		this.id = id;
		this.matricula = matricula;
		this.marca = marca;
		this.modelo = modelo;
		this.cv = cv;
		this.cc = cc;
		this.num_plazas = num_plazas;
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the matricula
	 */
	public String getMatricula() {
		return matricula;
	}
	/**
	 * @param matricula the matricula to set
	 */
	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}
	/**
	 * @return the marca
	 */
	public String getMarca() {
		return marca;
	}
	/**
	 * @param marca the marca to set
	 */
	public void setMarca(String marca) {
		this.marca = marca;
	}
	/**
	 * @return the modelo
	 */
	public String getModelo() {
		return modelo;
	}
	/**
	 * @param modelo the modelo to set
	 */
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	/**
	 * @return the cv
	 */
	public double getCv() {
		return cv;
	}
	/**
	 * @param cv the cv to set
	 */
	public void setCv(double cv) {
		this.cv = cv;
	}
	/**
	 * @return the cc
	 */
	public double getCc() {
		return cc;
	}
	/**
	 * @param cc the cc to set
	 */
	public void setCc(double cc) {
		this.cc = cc;
	}
	/**
	 * @return the num_plazas
	 */
	public int getNum_plazas() {
		return num_plazas;
	}
	/**
	 * @param num_plazas the num_plazas to set
	 */
	public void setNum_plazas(int num_plazas) {
		this.num_plazas = num_plazas;
	}
	@Override
	public String toString() {
		return "Motos [id=" + id + ", matricula=" + matricula + ", marca=" + marca + ", modelo=" + modelo + ", cv=" + cv
				+ ", cc=" + cc + ", num_plazas=" + num_plazas + "]";
	}
	
	
}
