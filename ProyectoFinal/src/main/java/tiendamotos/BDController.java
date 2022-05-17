package tiendamotos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Map;


public class BDController {
	private Connection conexion;
	public BDController() {
		super();
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		try {
			this.conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/alquiler_motos","root","");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en la conexion del BDController constructor");
		}
		// TODO Auto-generated constructor stub
	}
	
	public Connection getConexion() {
		return conexion;
	}

	public void setConexion(Connection conexion) {
		this.conexion = conexion;
	}
	
	public ArrayList<Clientes> dameclientes(){
		ArrayList<Clientes> listclientes = new ArrayList<Clientes>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from clientes");
			while (rs.next()==true) {
				listclientes.add(new Clientes(rs.getInt("id_cliente"),rs.getString("dni"),rs.getString("nombre"),rs.getString("apellidos"),rs.getString("direccion"),rs.getInt("cp"),rs.getString("provincia")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo dameclientes");
		}
		return listclientes;
	}
	
	public ArrayList<Alquiler> damealquiler(){
		ArrayList<Alquiler> listalquiler = new ArrayList<Alquiler>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from alquiler");
			while (rs.next()==true) {
				listalquiler.add(new Alquiler(rs.getInt("id_moto"),rs.getInt("id_cliente"),rs.getString("fecha_hora"),rs.getInt("num_horas"),rs.getDouble("precio_total")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo damealquiler");
		}
		return listalquiler;
	}
	
	public ArrayList<Motos> damemotos(){
		ArrayList<Motos> listmotos = new ArrayList<Motos>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from motos");
			while (rs.next()==true) {
				listmotos.add(new Motos(rs.getInt("id_moto"),rs.getString("matricula"),rs.getString("marca"),rs.getString("modelo"),rs.getInt("cv"),rs.getInt("cc"),rs.getInt("num_plazas"),rs.getDouble("precio_hora")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo damealquiler");
		}
		return listmotos;
	}
	
	public Clientes dameclientefromid(int id_cliente){
		Clientes cliente = new Clientes();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from clientes where id_cliente="+id_cliente);
			while (rs.next()==true) {
				cliente = new Clientes(rs.getInt("id_cliente"),rs.getString("dni"),rs.getString("nombre"),rs.getString("apellidos"),rs.getString("direccion"),rs.getInt("cp"),rs.getString("provincia"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo dameclientefromid");
		}
		return cliente;
	}
	
	public Clientes dameclientefromdni(String dni){
		Clientes cliente = new Clientes();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from clientes where dni='"+dni+"'");
			while (rs.next()==true) {
				cliente = new Clientes(rs.getInt("id_cliente"),rs.getString("dni"),rs.getString("nombre"),rs.getString("apellidos"),rs.getString("direccion"),rs.getInt("cp"),rs.getString("provincia"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo dameclientefromid");
		}
		return cliente;
	}
	
	public Alquiler damealquilerfromidcliente(int id_cliente){
		Alquiler alquiler = new Alquiler();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from alquiler where id_cliente="+id_cliente);
			while (rs.next()==true) {
				alquiler =new Alquiler(rs.getInt("id_moto"),rs.getInt("id_cliente"),rs.getString("fecha_hora"),rs.getInt("num_horas"),rs.getDouble("precio_total"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo damealquilerfromidcliente");
		}
		return alquiler;
	}
	
	public ArrayList<Alquiler> damealquileresfromidmoto(int id_moto){
		ArrayList<Alquiler> listalquiler = new ArrayList<Alquiler>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from alquiler where id_moto="+id_moto);
			while (rs.next()==true) {
				listalquiler.add( new Alquiler(rs.getInt("id_moto"),rs.getInt("id_cliente"),rs.getString("fecha_hora"),rs.getInt("num_horas"),rs.getDouble("precio_total")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo damealquileresfromidmoto");
		}
		return listalquiler;
	}
	
	public ArrayList<Alquiler> damealquileresfromidcliente(int id_cliente){
		ArrayList<Alquiler> listalquiler = new ArrayList<Alquiler>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from alquiler where id_cliente="+id_cliente);
			while (rs.next()==true) {
				listalquiler.add( new Alquiler(rs.getInt("id_moto"),rs.getInt("id_cliente"),rs.getString("fecha_hora"),rs.getInt("num_horas"),rs.getDouble("precio_total")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo damealquileresfromidcliente");
		}
		return listalquiler;
	}
	
	public Alquiler damealquilerfromids(int id_cliente,int id_moto){
		Alquiler alquiler = new Alquiler();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from alquiler where id_moto="+id_moto +" and id_cliente="+id_cliente);
			while (rs.next()==true) {
				alquiler =new Alquiler(rs.getInt("id_moto"),rs.getInt("id_cliente"),rs.getString("fecha_hora"),rs.getInt("num_horas"),rs.getDouble("precio_total"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo damealquilerfromids");
		}
		return alquiler;
	}
	
	public Motos damemotoformidmoto(int id_moto){
		Motos moto = new Motos();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from motos where id_moto="+id_moto);
			while (rs.next()==true) {
				moto = new Motos(rs.getInt("id_moto"),rs.getString("matricula"),rs.getString("marca"),rs.getString("modelo"),rs.getInt("cv"),rs.getInt("cc"),rs.getInt("num_plazas"),rs.getDouble("precio_hora"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo damemotoformidmoto");
		}
		return moto;
	}
	
	public boolean existecliente(int id_cliente) {
		boolean resp = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from clientes where id_cliente="+id_cliente);
			while (rs.next()==true) {
				resp = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo existecliente");
		}
		return resp;
	}
	
	public boolean existealquilerfromidcliente(int id_cliente) {
		boolean resp = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from alquiler where id_cliente="+id_cliente);
			while (rs.next()==true) {
				resp = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo existealquilerfromidcliente");
		}
		return resp;
	}
	
	public boolean existealquilerfromidmoto(int id_moto) {
		boolean resp = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from alquiler where id_moto="+id_moto);
			while (rs.next()==true) {
				resp = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo existealquilerfromidmoto");
		}
		return resp;
	}
	
	public boolean existealquilerfromids(int id_cliente,int id_moto) {
		boolean resp = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from alquiler where id_cliente="+id_cliente + " and id_moto="+id_moto);
			while (rs.next()==true) {
				resp = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo existealquilerfromids");
		}
		return resp;
	}
	
	public boolean existemoto(int id_moto) {
		boolean resp = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from motos where id_moto="+id_moto);
			while (rs.next()==true) {
				resp = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo existemotos");
		}
		return resp;
	}
	
	public int lastid_motos() {
		int lastid = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT id_moto from motos ORDER BY id_moto DESC limit 1;");
			while (rs.next()==true) {
				lastid = rs.getInt("id_moto");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo lastid_motos");
		}
		return lastid;
	}
	
	public void altamoto(int id_moto,String matricula,String marca,String modelo,int cv,int cc,int num_plazas,double precio_hora) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Insert into motos (id_moto,matricula,marca,modelo,cv,cc,num_plazas,precio_hora) values ("+id_moto+",'"+matricula+"','"+marca+"','"+modelo+"',"+cv+","+cc+","+num_plazas+","+precio_hora+")";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontrole metodo altamoto");
		}
	}
	
	public int lastid_clientes() {
		int lastid = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT id_cliente from clientes ORDER BY id_cliente DESC limit 1;");
			while (rs.next()==true) {
				lastid = rs.getInt("id_cliente");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo lastid_clientes");
		}
		return lastid;
	}
	
	public void altacliente(int id_cliente,String dni,String nombre,String apellidos,String direccion,int cp,String provincia) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Insert into clientes (id_cliente,dni,nombre,apellidos,direccion,cp,provincia) values ("+id_cliente+",'"+dni+"','"+nombre+"','"+apellidos+"','"+direccion+"',"+cp+",'"+provincia+"')";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontrole metodo altacliente");
		}
	}
	
	public void altaalquiler(int id_moto,int id_cliente,String fecha_hora,int num_horas,double precio_total) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Insert into alquiler (id_moto,id_cliente,fecha_hora,num_horas,precio_total) values ("+id_moto+","+id_cliente+",'"+fecha_hora+"',"+num_horas+","+precio_total+")";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontrole metodo altaalquiler");
		}
	}
	
	public void bajamoto(int id_moto) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Delete from motos where id_moto = "+id_moto ;
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontrole metodo bajamoto");
		}
	}
	
	public void bajacliente(int id_cliente) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Delete from clientes where id_cliente = "+id_cliente ;
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontrole metodo bajacliente");
		}
	}
	
	public void bajaalquilerfromcliente(int id_cliente) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Delete from alquiler where id_cliente = "+id_cliente ;
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontrole metodo bajaalquilerfromcliente");
		}
	}
	
	public void bajaalquilerfrommoto(int id_moto) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Delete from alquiler where id_moto = "+id_moto ;
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontrole metodo bajaalquilerfrommoto");
		}
	}
	
	public void bajaalquilerfromall(int id_moto , int id_cliente,String fecha) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Delete from alquiler where id_moto = "+id_moto+" and id_cliente="+id_cliente+" and fecha_hora='"+fecha+"'";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontrole metodo bajaalquilerfromall");
		}
	}
	
	public boolean existealquilerfromall(int id_cliente,int id_moto,String fecha) {
		boolean resp = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from alquiler where id_cliente="+id_cliente+" and id_moto="+id_moto+" and fecha_hora='"+fecha+"'");
			while (rs.next()==true) {
				resp = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo existealquilerfromids");
		}
		return resp;
	}
	
	public void updatemoto(int id_moto,String matricula,String marca,String modelo,int cv,int cc,int num_plazas,double precio_hora) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "UPDATE motos set matricula='"+matricula+"', marca='"+marca+"', modelo='"+modelo+"', cv="+cv+", cc="+cc+", num_plazas="+num_plazas+", precio_hora="+precio_hora+" WHERE id_moto="+id_moto;
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontrole metodo updatemoto");
		}
	}
	
	public void updatecliente(int id_cliente,String dni,String nombre,String apellidos,String direccion, int cp , String provincia) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "UPDATE clientes set dni='"+dni+"',nombre='"+nombre+"',apellidos='"+apellidos+"',direccion='"+direccion+"',cp="+cp+",provincia='"+provincia+"' WHERE id_cliente="+id_cliente;
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontrole metodo updatecliente");
		}
	}
	
	public Alquiler damealquilerfromall(int id_cliente,int id_moto,String fecha_hora){
		Alquiler alquiler = new Alquiler();
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Select * from alquiler where id_cliente="+id_cliente+" and id_moto="+id_moto+" and fecha_hora='"+fecha_hora+"'";
			ResultSet rs = miStatement.executeQuery(cadena);
			while (rs.next()==true) {
				alquiler =new Alquiler(rs.getInt("id_moto"),rs.getInt("id_cliente"),rs.getString("fecha_hora"),rs.getInt("num_horas"),rs.getDouble("precio_total"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo damealquilerfromall");
		}
		return alquiler;
	}
	public int dametop1mot(){
		int respuesta = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT id_moto from alquiler GROUP by id_moto ORDER BY SUM(num_horas) DESC limit 1;");
			while (rs.next()==true) {
				respuesta = rs.getInt("id_moto");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo dametop1mot");
		}
		return respuesta;
	}
	
	public int dametop2mot(){
		int respuesta = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT id_moto from alquiler GROUP by id_moto ORDER BY SUM(num_horas) DESC limit 1,1;");
			while (rs.next()==true) {
				respuesta = rs.getInt("id_moto");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo dametop2mot");
		}
		return respuesta;
	}
	
	public int dametop3mot(){
		int respuesta = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT id_moto from alquiler GROUP by id_moto ORDER BY SUM(num_horas) DESC limit 2,1;");
			while (rs.next()==true) {
				respuesta = rs.getInt("id_moto");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo dametop3mot");
		}
		return respuesta;
	}
	
	public int dametotalhorasalquilerfromid_moto(int id_moto) {
		int respuesta = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT SUM(num_horas) from alquiler WHERE id_moto="+id_moto);
			while (rs.next()==true) {
				respuesta = rs.getInt("SUM(num_horas)");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo dametotalhorasalquilerfromid_moto");
		}
		return respuesta;
	}
	
	public int dametop1cliente(){
		int respuesta = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT id_cliente from alquiler GROUP BY id_cliente ORDER BY COUNT(id_cliente) DESC limit 1;");
			while (rs.next()==true) {
				respuesta = rs.getInt("id_cliente");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo dametop1cliente");
		}
		return respuesta;
	}
	public int dametop2cliente(){
		int respuesta = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT id_cliente from alquiler GROUP BY id_cliente ORDER BY COUNT(id_cliente) DESC limit 1,1;");
			while (rs.next()==true) {
				respuesta = rs.getInt("id_cliente");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo dametop2cliente");
		}
		return respuesta;
	}
	public int dametop3cliente(){
		int respuesta = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT id_cliente from alquiler GROUP BY id_cliente ORDER BY COUNT(id_cliente) DESC limit 2,1;");
			while (rs.next()==true) {
				respuesta = rs.getInt("id_cliente");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo dametop3cliente");
		}
		return respuesta;
	}
	
	public int dametotalalquilerescliente(int id_cliente) {
		int respuesta = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT count(id_cliente) from alquiler WHERE id_cliente="+id_cliente+" GROUP BY id_cliente;");
			while (rs.next()==true) {
				respuesta = rs.getInt("count(id_cliente)");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo dametotalalquilerescliente");
		}
		return respuesta;
	}
	
	public void updatealquiler(int id_moto,int id_cliente,String fecha_hora,int num_horas,double precio_total,int id_moto_old, int id_cliente_old, String fecha_hora_old) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "UPDATE alquiler set id_moto="+id_moto+",id_cliente="+id_cliente+", fecha_hora='"+fecha_hora+"', num_horas="+num_horas+", precio_total="+precio_total+" WHERE id_moto="+id_moto_old+" and id_cliente="+id_cliente_old+" and fecha_hora='"+fecha_hora_old+"'";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontrole metodo updatealquiler");
		}
	}
	public boolean existeclientefromdni(String dni) {
		boolean resp = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from clientes where dni='"+dni+"'");
			while (rs.next()==true) {
				resp = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo existeclientefromdni");
		}
		return resp;
	}
	
	public boolean existeclientefromdniwithall(String dni,String nombre,String apellidos,String direccion,String cp,String provincia) {
		boolean resp = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from clientes where dni='"+dni+"' and nombre='"+nombre+"' and apellidos='"+apellidos+"' and direccion='"+direccion+"' and cp='"+cp+"' and provincia='"+provincia+"'");
			while (rs.next()==true) {
				resp = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo existeclientefromdniwithall");
		}
		return resp;
	}
	
	public Hashtable<Integer,Motos> damemotoshashmap(){
		Hashtable<Integer,Motos> listmotos=new Hashtable<Integer,Motos>(); 
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from motos");
			while (rs.next()==true) {
				Motos currentmoto = new Motos(rs.getInt("id_moto"),rs.getString("matricula"),rs.getString("marca"),rs.getString("modelo"),rs.getInt("cv"),rs.getInt("cc"),rs.getInt("num_plazas"),rs.getDouble("precio_hora"));
				listmotos.put(rs.getInt("id_moto"),currentmoto);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroler metodo damemotoshashmap");
		}
		return listmotos;
	}
	
}
