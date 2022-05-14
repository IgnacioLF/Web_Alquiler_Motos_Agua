<%@ page import="tiendamotos.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>HTML5 Admin Template</title>
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700" rel="stylesheet">
	
	<!-- Template Styles -->
	<link rel="stylesheet" href="css/font-awesome.min.css">
	
	<!-- CSS Reset -->
	<link rel="stylesheet" href="css/normalize.css">
	
	<!-- Milligram CSS minified -->
	<link rel="stylesheet" href="css/milligram.min.css">
	
	<!-- Main Styles -->
	<link rel="stylesheet" href="css/styles.css">
	
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>

<body>
	<div class="navbar">
		<div class="row">
			<div class="column column-30 col-site-title"><a href="#" class="site-title float-left">Medialoot</a></div>
			<div class="column column-40 col-search"><a href="#" class="search-btn fa fa-search"></a>
				<input type="text" name="" value="" placeholder="Buscar..." />
			</div>
			<div class="column column-30">
				<div class="user-section"><a href="#">
					<img src="http://via.placeholder.com/50x50" alt="profile photo" class="circle float-left profile-photo" width="50" height="auto">
					<div class="username">
						<h4>Administrador</h4>
					</div>
				</a></div>
			</div>
		</div>
	</div>
	<div class="row">
		<div id="sidebar" class="column">
			<h5>Menu</h5>
			<ul>
				<li><a href="index.html"><em class="fa fa-home"></em>Principal</a></li>
				<li><a href="Lista_motos.jsp"><em class="fa fa-table"></em> Lista Motos</a></li>
				<li><a href="Alta_motos.jsp"><em class="fa fa fa-clone"></em> Alta Moto</a></li>
				<li><a href="Baja_motos.jsp"><em class="fa fa-warning"></em> Baja Moto</a></li>
				<li><a href="Modificar_motos.jsp"><em class="fa fa-pencil-square-o"></em> Modificar Moto</a></li>
				<li><a href="Lista_clientes.jsp"><em class="fa fa-table"></em> Lista Cliente</a></li>
				<li><a href="Alta_clientes.jsp"><em class="fa fa fa-clone"></em> Alta Cliente</a></li>
				<li><a href="Baja_clientes.jsp"><em class="fa fa-warning"></em> Baja Cliente</a></li>
				<li><a href="Modificar_clientes.jsp"><em class="fa fa-pencil-square-o"></em> Modificar Cliente</a></li>
				<li><a href="Lista_alquileres.jsp"><em class="fa fa-table"></em> Lista Alquileres</a></li>
				<li><a href="Alta_alquiler.jsp"><em class="fa fa fa-clone"></em> Alta Alquiler</a></li>
				<li><a href="Baja_alquileres.jsp"><em class="fa fa-warning"></em> Baja Alquiler</a></li>
				<li><a href="Modificar_alquileres.jsp"><em class="fa fa-pencil-square-o"></em> Modificar Alquiler</a></li>
			</ul>
		</div>
		<section id="main-content" class="column column-offset-20">
		<%
		BDController cont = new BDController();
		String tipo = request.getParameter("tipo");
		String mensaje = "";
		switch (tipo) {
		case "alta_moto":
			if (request.getParameter("matricula")=="" || request.getParameter("marca")=="" || request.getParameter("modelo")=="" || request.getParameter("cv")=="" ||request.getParameter("cc")==""|| request.getParameter("num_plazas")=="" || request.getParameter("precio_hora")==""){
				response.sendRedirect("Alta_motos.jsp?error=true");
			} else{
				String matricula = request.getParameter("matricula");
				String marca = request.getParameter("marca");
				String modelo = request.getParameter("modelo");
				int cv = Integer.parseInt(request.getParameter("cv"));
				int cc = Integer.parseInt(request.getParameter("cc"));
				int num_plazas = Integer.parseInt(request.getParameter("num_plazas"));
				int id_moto = cont.lastid_motos() + 1;
				double precio_hora = Double.parseDouble(request.getParameter("precio_hora"));
				cont.altamoto(id_moto, matricula,marca,modelo, cv, cc, num_plazas,precio_hora);
				response.sendRedirect("Lista_motos.jsp?alta=true");
			}
			break;
		case "alta_cliente":
			if (request.getParameter("dni")==""||request.getParameter("nombre")==""||request.getParameter("apellidos")==""||request.getParameter("direccion")==""||request.getParameter("cp")==""||request.getParameter("provincia")==""){
				response.sendRedirect("Alta_clientes.jsp?error=true");
			} else {
				String dni = request.getParameter("dni");
				String nombre = request.getParameter("nombre");
				String apellidos = request.getParameter("apellidos");
				String direccion = request.getParameter("direccion");
				int cp = Integer.parseInt(request.getParameter("cp"));
				String provincia = request.getParameter("provincia");
				int id_cliente = cont.lastid_clientes() + 1;
				cont.altacliente(id_cliente, dni, nombre, apellidos, direccion, cp, provincia);
				response.sendRedirect("Lista_clientes.jsp?alta=true");
			}
			break;
		case "baja_moto":
			if (request.getParameter("id_moto")==""){
				response.sendRedirect("Baja_motos.jsp?error=true");
			} else {
				int id_moto = Integer.parseInt(request.getParameter("id_moto"));
				if (cont.existealquilerfromidmoto(id_moto)){
					cont.bajaalquilerfrommoto(id_moto);
				}
				cont.bajamoto(id_moto);
				response.sendRedirect("Lista_motos.jsp?baja=true");
			}
			break;
		case "baja_cliente":
			if (request.getParameter("id_cliente")==""){
				response.sendRedirect("Baja_clientes.jsp?error=true");
			} else  {
				int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
				if (cont.existealquilerfromidcliente(id_cliente)){
					cont.bajaalquilerfromcliente(id_cliente);
				}
				cont.bajacliente(id_cliente);
				response.sendRedirect("Lista_clientes.jsp?baja=true");
			}
			break;
		case "baja_alquileres":
			if (request.getParameter("id_moto")==""||request.getParameter("id_cliente")==""||request.getParameter("fecha")==""||request.getParameter("hora_inicio")==""){
				response.sendRedirect("Baja_alquileres.jsp?error=true");
			} else {
				int id_moto = Integer.parseInt(request.getParameter("id_moto"));
				int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
				String fecha = request.getParameter("fecha");
				String hora_inicio = request.getParameter("hora_inicio");
				String myfecha = fecha +" " +hora_inicio+":00:0";
				if (cont.existealquilerfromall(id_cliente, id_moto,myfecha)){
					cont.bajaalquilerfromall(id_moto, id_cliente,myfecha);
					response.sendRedirect("Lista_alquileres.jsp?baja=true");
				} else {
					response.sendRedirect("Baja_alquileres.jsp?error2=true");
				}
			}
			break;
		case "modificar_moto":
			if(request.getParameter("matricula")=="" || request.getParameter("marca")=="" || request.getParameter("modelo")=="" || request.getParameter("cv")=="" ||request.getParameter("cc")==""|| request.getParameter("num_plazas")=="" || request.getParameter("precio_hora")==""){
				int id_moto = Integer.parseInt(request.getParameter("id_moto"));
				response.sendRedirect("Modificar_motos2.jsp?error=true&id_moto="+id_moto);
			} else {
				String matricula = request.getParameter("matricula");
				String marca = request.getParameter("marca");
				String modelo = request.getParameter("modelo");
				int cv = Integer.parseInt(request.getParameter("cv"));
				int cc = Integer.parseInt(request.getParameter("cc"));
				int num_plazas = Integer.parseInt(request.getParameter("num_plazas"));
				int id_moto = Integer.parseInt(request.getParameter("id_moto"));
				double precio_hora = Double.parseDouble(request.getParameter("precio_hora"));
				cont.updatemoto(id_moto, matricula, marca, modelo, cv, cc, num_plazas, precio_hora);
				response.sendRedirect("Lista_motos.jsp?modificar=true");
			}
			break;
		case "modificar_cliente":
			if (request.getParameter("dni")==""||request.getParameter("nombre")==""||request.getParameter("apellidos")==""||request.getParameter("direccion")==""||request.getParameter("cp")==""||request.getParameter("provincia")==""){
				int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
				response.sendRedirect("Modificar_clientes2.jsp?error=true&id_cliente="+id_cliente);
			} else {
				int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
				String dni = request.getParameter("dni");
				String nombre = request.getParameter("nombre");
				String apellidos = request.getParameter("apellidos");
				String direccion = request.getParameter("direccion");
				int cp = Integer.parseInt(request.getParameter("cp"));
				String provincia = request.getParameter("provincia");
				cont.updatecliente(id_cliente, dni, nombre, apellidos, direccion, cp, provincia);
				response.sendRedirect("Lista_clientes.jsp?modificar=true");
			}
			break;
		case "modificar_alquileres":
			if (request.getParameter("id_cliente")==""||request.getParameter("id_moto")==""||request.getParameter("fecha_hora")==""){
				response.sendRedirect("Modificar_alquileres.jsp?error=true");
			} else {
				int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
				int id_moto = Integer.parseInt(request.getParameter("id_moto"));
				String fecha = request.getParameter("fecha");
				String hora_inicio = request.getParameter("hora_inicio");
				String myfecha = fecha +" " +hora_inicio+":00:0";
				if (cont.existealquilerfromall(id_cliente, id_moto, myfecha)){
					response.sendRedirect("Modificar_alquileres2.jsp?id_cliente="+id_cliente+"&id_moto="+id_moto+"&fecha="+fecha+"&hora_inicio="+hora_inicio);
				} else {
					response.sendRedirect("Modificar_alquileres.jsp?error2=true");
				}
			}
			break;
		case "alta_alquiler1":
			if (request.getParameter("id_moto")==""||request.getParameter("id_cliente")==""||request.getParameter("fecha")==""||request.getParameter("num_horas")==""){
				response.sendRedirect("Alta_alquiler.jsp?error=true");
			} else {
				int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
				int id_moto = Integer.parseInt(request.getParameter("id_moto"));
				String fecha = request.getParameter("fecha");
				int num_horas = Integer.parseInt(request.getParameter("num_horas"));
				response.sendRedirect("Alta_alquiler2.jsp?id_cliente="+id_cliente+"&id_moto="+id_moto+"&fecha="+fecha+"&num_horas="+num_horas+"&tipo=seleccion");
			}
			break;
		case "alta_alquiler2":
			int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
			int id_moto = Integer.parseInt(request.getParameter("id_moto"));
			String fecha = request.getParameter("fecha");
			String num_horas = request.getParameter("num_horas");
			int hora_inicio = Integer.parseInt(request.getParameter("hora_inicio"));
			int hora_final = hora_inicio+Integer.parseInt(num_horas);
			Motos currentmoto = cont.damemotoformidmoto(id_moto);
			double preciototal = currentmoto.getPrecio_hora() * Double.parseDouble(num_horas);
			ArrayList<Alquiler> listalquiledemoto = cont.damealquileresfromidmoto(id_moto);
			boolean error = false;
			if (hora_final>20){
				response.sendRedirect("Alta_alquiler2.jsp?id_cliente="+id_cliente+"&id_moto="+id_moto+"&fecha="+fecha+"&num_horas="+num_horas+"&tipo=error");
				error=true;
				break;
			}
			for (int i = 0;i<listalquiledemoto.size();i++){
				if (listalquiledemoto.get(i).damesolofecha().equals(fecha)){
					if (hora_inicio<listalquiledemoto.get(i).damehoraentrada()&&hora_final>listalquiledemoto.get(i).damehoraentrada()){
						response.sendRedirect("Alta_alquiler2.jsp?id_cliente="+id_cliente+"&id_moto="+id_moto+"&fecha="+fecha+"&num_horas="+num_horas+"&tipo=error");
						error=true;
						break;
					}
				}
			}
			if (error==false) {
				String myfecha = fecha +" " +hora_inicio+":00:0";
				cont.altaalquiler(id_moto, id_cliente, myfecha, Integer.parseInt(num_horas), preciototal);
				response.sendRedirect("Lista_alquileres.jsp?alta=true");
			}
			break;
		case "modificar_alquileres2":
			if(request.getParameter("id_moto")==""||request.getParameter("id_cliente")==""||request.getParameter("fecha")==""||request.getParameter("num_horas")==""||request.getParameter("num_horas").equalsIgnoreCase("0")){
				int id_cliente_old = Integer.parseInt(request.getParameter("id_cliente_old"));
				int id_moto_old = Integer.parseInt(request.getParameter("id_moto_old"));
				String fecha_old = request.getParameter("fecha_old");
				String hora_inicio_old = request.getParameter("hora_inicio_old");
				String hora_inicio_new = hora_inicio_old;
				if (request.getParameter("hora_inicio")!=null){
					hora_inicio_new = request.getParameter("hora_inicio");
				}
				response.sendRedirect("Modificar_alquileres2.jsp?id_cliente="+id_cliente_old+"&id_moto="+id_moto_old+"&fecha="+fecha_old+"&hora_inicio_old="+hora_inicio_old+"&hora_inicio="+hora_inicio_new+"&error=true");
			} else{
				int id_cliente_new = Integer.parseInt(request.getParameter("id_cliente"));
				int id_moto_new = Integer.parseInt(request.getParameter("id_moto"));
				String fecha_new = request.getParameter("fecha");
				String num_horas_new = request.getParameter("num_horas");
				String hora_inicio_old = request.getParameter("hora_inicio_old");
				int id_cliente_old = Integer.parseInt(request.getParameter("id_cliente_old"));
				int id_moto_old = Integer.parseInt(request.getParameter("id_moto_old"));
				String fecha_old = request.getParameter("fecha_old");
				int hora_inicio_new = Integer.parseInt(request.getParameter("hora_inicio"));
				Motos currentmoto_new = cont.damemotoformidmoto(id_moto_new);
				int hora_final_new = hora_inicio_new+Integer.parseInt(num_horas_new);
				double precio_total_new = currentmoto_new.getPrecio_hora() * Double.parseDouble(num_horas_new);
				if (request.getParameter("cambiar_hora")!=null){
					response.sendRedirect("Modificar_alquileres3.jsp?id_cliente="+id_cliente_new+"&id_moto="+id_moto_new+"&num_horas="+num_horas_new+"&fecha="+fecha_new+"&hora_inicio_old="+hora_inicio_old+"&id_moto_old="+id_moto_old+"&id_cliente_old="+id_cliente_old+"&fecha_old="+fecha_old+"&hora_inicio="+hora_inicio_new);
				} else {
					ArrayList<Alquiler> listalquiledemoto_new = cont.damealquileresfromidmoto(id_moto_new);
					boolean error_new = false;
					if (hora_final_new>20){
						response.sendRedirect("Modificar_alquileres2.jsp?id_cliente="+id_cliente_new+"&id_moto="+id_moto_new+"&fecha="+fecha_new+"&num_horas="+num_horas_new+"&id_cliente_old="+id_cliente_old+"&id_moto_old="+id_moto_old+"&fecha_old="+fecha_old+"&hora_inicio_old="+hora_inicio_old+"&error2=true"+"&hora_inicio="+hora_inicio_new);
						error_new=true;
					}
					String myfecha_old = fecha_old +" " +hora_inicio_old+":00:00.0";
					if (id_moto_old==id_moto_new){
						for (int i = 0;i<listalquiledemoto_new.size();i++){
							if ((listalquiledemoto_new.get(i).getId_cliente()==id_cliente_old&&listalquiledemoto_new.get(i).getFecha().equalsIgnoreCase(myfecha_old))==false){
								if (listalquiledemoto_new.get(i).damesolofecha().equals(fecha_new)){
									if (hora_inicio_new<listalquiledemoto_new.get(i).damehoraentrada()&&hora_final_new>listalquiledemoto_new.get(i).damehoraentrada()){
										response.sendRedirect("Modificar_alquileres2.jsp?id_cliente="+id_cliente_new+"&id_moto="+id_moto_new+"&fecha="+fecha_new+"&num_horas="+num_horas_new+"&id_cliente_old="+id_cliente_old+"&id_moto_old="+id_moto_old+"&fecha_old="+fecha_old+"&hora_inicio_old="+hora_inicio_old+"&error2=true"+"&hora_inicio="+hora_inicio_new);
										error_new=true;
									}
								}
							}
						}
					} else {
						for (int i = 0;i<listalquiledemoto_new.size();i++){
							if (listalquiledemoto_new.get(i).damesolofecha().equals(fecha_new)){
								if (hora_inicio_new<listalquiledemoto_new.get(i).damehoraentrada()&&hora_final_new>listalquiledemoto_new.get(i).damehoraentrada()){
									response.sendRedirect("Modificar_alquileres2.jsp?id_cliente="+id_cliente_new+"&id_moto="+id_moto_new+"&fecha="+fecha_new+"&num_horas="+num_horas_new+"&id_cliente_old="+id_cliente_old+"&id_moto_old="+id_moto_old+"&fecha_old="+fecha_old+"&hora_inicio_old="+hora_inicio_old+"&error2=true"+"&hora_inicio="+hora_inicio_new);
									error_new=true;
								}
							}
						}
					}
					if (error_new==false) {
						String myfecha_new = fecha_new +" " +hora_inicio_new+":00:00.0";
						cont.updatealquiler(id_moto_new, id_cliente_new, myfecha_new, Integer.parseInt(num_horas_new), precio_total_new, id_moto_old, id_cliente_old, myfecha_old);
						response.sendRedirect("Lista_alquileres.jsp?modificar=true");
					}
				}
			}
			break;
		case "modificar_alquiler3":
			int id_cliente_new = Integer.parseInt(request.getParameter("id_cliente"));
			int id_moto_new = Integer.parseInt(request.getParameter("id_moto"));
			String fecha_new = request.getParameter("fecha");
			String num_horas_new = request.getParameter("num_horas");
			int hora_inicio_new = Integer.parseInt(request.getParameter("hora_inicio"));
			int hora_final_new = hora_inicio_new+Integer.parseInt(num_horas_new);
			Motos currentmoto_new = cont.damemotoformidmoto(id_moto_new);
			double preciototal_new = currentmoto_new.getPrecio_hora() * Double.parseDouble(num_horas_new);
			ArrayList<Alquiler> listalquiledemoto_new = cont.damealquileresfromidmoto(id_moto_new);
			int id_cliente_old = Integer.parseInt(request.getParameter("id_cliente_old"));
			int id_moto_old = Integer.parseInt(request.getParameter("id_moto_old"));
			String fecha_old = request.getParameter("fecha_old");
			String hora_inicio_old = request.getParameter("hora_inicio_old");
			boolean error_new = false;
			if (hora_final_new>20){
				response.sendRedirect("Modificar_alquileres3.jsp?id_cliente="+id_cliente_new+"&id_moto="+id_moto_new+"&fecha="+fecha_new+"&num_horas="+num_horas_new+"&id_cliente_old="+id_cliente_old+"&id_moto_old="+id_moto_old+"&fecha_old="+fecha_old+"&hora_inicio_old="+hora_inicio_old+"&error=true");
				error_new=true;
				break;
			}
			String myfecha_old = fecha_old +" " +hora_inicio_old+":00:00.0";
			if (id_moto_old==id_moto_new){
				for (int i = 0;i<listalquiledemoto_new.size();i++){
					if ((listalquiledemoto_new.get(i).getId_cliente()==id_cliente_old&&listalquiledemoto_new.get(i).getFecha().equalsIgnoreCase(myfecha_old))==false){
						if (listalquiledemoto_new.get(i).damesolofecha().equals(fecha_new)){
							if (hora_inicio_new<listalquiledemoto_new.get(i).damehoraentrada()&&hora_final_new>listalquiledemoto_new.get(i).damehoraentrada()){
								response.sendRedirect("Modificar_alquileres3.jsp?id_cliente="+id_cliente_new+"&id_moto="+id_moto_new+"&fecha="+fecha_new+"&num_horas="+num_horas_new+"&id_cliente_old="+id_cliente_old+"&id_moto_old="+id_moto_old+"&fecha_old="+fecha_old+"&hora_inicio_old="+hora_inicio_old+"&error=true");
								error_new=true;
								break;
							}
						}
					}
				}
			} else {
				for (int i = 0;i<listalquiledemoto_new.size();i++){
					if (listalquiledemoto_new.get(i).damesolofecha().equals(fecha_new)){
						if (hora_inicio_new<listalquiledemoto_new.get(i).damehoraentrada()&&hora_final_new>listalquiledemoto_new.get(i).damehoraentrada()){
							response.sendRedirect("Modificar_alquileres3.jsp?id_cliente="+id_cliente_new+"&id_moto="+id_moto_new+"&fecha="+fecha_new+"&num_horas="+num_horas_new+"&id_cliente_old="+id_cliente_old+"&id_moto_old="+id_moto_old+"&fecha_old="+fecha_old+"&hora_inicio_old="+hora_inicio_old+"&error=true");
							error_new=true;
							break;
						}
					}
				}
			}
			if (error_new==false) {
				response.sendRedirect("Modificar_alquileres2.jsp?id_cliente="+id_cliente_new+"&id_moto="+id_moto_new+"&fecha="+fecha_new+"&num_horas="+num_horas_new+"&id_cliente_old="+id_cliente_old+"&id_moto_old="+id_moto_old+"&fecha_old="+fecha_old+"&hora_inicio_old="+hora_inicio_old+"&hora_inicio_new="+hora_inicio_new);
			}
			break;
		}
		%>
			<!--Forms-->
			<div class="row grid-responsive">
				<div class="column ">
					<div class="card">
						<div class="card-title">
							<h3>Resultado</h3>
						</div>
						<div class="card-block">
							<%=mensaje %>
						</div>
					</div>
				</div>
			</div>
			
			
		</section>
	</div>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script>
	window.onload = function () {
		var chart1 = document.getElementById("line-chart").getContext("2d");
		window.myLine = new Chart(chart1).Line(lineChartData, {
		responsive: true,
		scaleLineColor: "rgba(0,0,0,.2)",
		scaleGridLineColor: "rgba(0,0,0,.05)",
		scaleFontColor: "#c5c7cc"
		});
		var chart2 = document.getElementById("bar-chart").getContext("2d");
		window.myBar = new Chart(chart2).Bar(barChartData, {
		responsive: true,
		scaleLineColor: "rgba(0,0,0,.2)",
		scaleGridLineColor: "rgba(0,0,0,.05)",
		scaleFontColor: "#c5c7cc"
		});
		var chart4 = document.getElementById("pie-chart").getContext("2d");
		window.myPie = new Chart(chart4).Pie(pieData, {
		responsive: true,
		segmentShowStroke: false
		});
		var chart5 = document.getElementById("radar-chart").getContext("2d");
		window.myRadarChart = new Chart(chart5).Radar(radarData, {
		responsive: true,
		scaleLineColor: "rgba(0,0,0,.05)",
		angleLineColor: "rgba(0,0,0,.2)"
		});
		var chart6 = document.getElementById("polar-area-chart").getContext("2d");
		window.myPolarAreaChart = new Chart(chart6).PolarArea(polarData, {
		responsive: true,
		scaleLineColor: "rgba(0,0,0,.2)",
		segmentShowStroke: false
		});
	};
	</script>			
</body>
</html> 