package tiendamotos;

public class Alquiler {
	private int id_moto;
	private int id_cliente;
	private String fecha;
	private int num_horas;
	private double precio_total;
	public Alquiler() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Alquiler(int id_moto, int id_cliente, String fecha, int num_horas, double precio_total) {
		super();
		this.id_moto = id_moto;
		this.id_cliente = id_cliente;
		this.fecha = fecha;
		this.num_horas = num_horas;
		this.precio_total = precio_total;
	}

	/**
	 * @return the id_moto
	 */
	public int getId_moto() {
		return id_moto;
	}
	/**
	 * @param id_moto the id_moto to set
	 */
	public void setId_moto(int id_moto) {
		this.id_moto = id_moto;
	}
	/**
	 * @return the id_cliente
	 */
	public int getId_cliente() {
		return id_cliente;
	}
	/**
	 * @param id_cliente the id_cliente to set
	 */
	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}
	/**
	 * @return the fecha
	 */
	public String getFecha() {
		return fecha;
	}
	/**
	 * @param fecha the fecha to set
	 */
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	/**
	 * @return the num_horas
	 */
	public int getNum_horas() {
		return num_horas;
	}
	/**
	 * @param num_horas the num_horas to set
	 */
	public void setNum_horas(int num_horas) {
		this.num_horas = num_horas;
	}
	/**
	 * @return the precio_total
	 */
	public double getPrecio_total() {
		return precio_total;
	}
	/**
	 * @param precio_total the precio_total to set
	 */
	public void setPrecio_total(double precio_total) {
		this.precio_total = precio_total;
	}
	
	public String damesolofecha() {
		String[] partes = this.fecha.split(" ");
		return partes[0];
	}
	
	public int damehoraentrada() {
		String[] partes = this.fecha.split(" ");
		String[] splithoras = partes[1].split(":");
		int hora = Integer.parseInt(splithoras[0]);
	return	hora;
	}
	
	public int damehorasalida() {
		String[] partes = this.fecha.split(" ");
		String[] splithoras = partes[1].split(":");
		int hora = Integer.parseInt(splithoras[0]);
		hora = hora + this.num_horas;
	return	hora;
	}
	@Override
	public String toString() {
		return "Alquiler [id_moto=" + id_moto + ", id_cliente=" + id_cliente + ", fecha=" + fecha + ", num_horas="
				+ num_horas + "]";
	}
	
}
