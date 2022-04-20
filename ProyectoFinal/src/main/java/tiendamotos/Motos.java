package tiendamotos;

public class Motos {
	private int id;
	private String matricula;
	private String marca;
	private String modelo;
	private int cv;
	private int cc;
	private int num_plazas;
	private double precio_hora;
	public Motos() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Motos(int id, String matricula, String marca, String modelo, int cv, int cc, int num_plazas,
			double precio_hora) {
		super();
		this.id = id;
		this.matricula = matricula;
		this.marca = marca;
		this.modelo = modelo;
		this.cv = cv;
		this.cc = cc;
		this.num_plazas = num_plazas;
		this.precio_hora = precio_hora;
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
	public int getCv() {
		return cv;
	}
	/**
	 * @param cv the cv to set
	 */
	public void setCv(int cv) {
		this.cv = cv;
	}
	/**
	 * @return the cc
	 */
	public int getCc() {
		return cc;
	}
	/**
	 * @param cc the cc to set
	 */
	public void setCc(int cc) {
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
	/**
	 * @return the precio_hora
	 */
	public double getPrecio_hora() {
		return precio_hora;
	}
	/**
	 * @param precio_hora the precio_hora to set
	 */
	public void setPrecio_hora(double precio_hora) {
		this.precio_hora = precio_hora;
	}
	@Override
	public String toString() {
		return "Motos [id=" + id + ", matricula=" + matricula + ", marca=" + marca + ", modelo=" + modelo + ", cv=" + cv
				+ ", cc=" + cc + ", num_plazas=" + num_plazas + ", precio_hora=" + precio_hora + "]";
	}
	
	
}
