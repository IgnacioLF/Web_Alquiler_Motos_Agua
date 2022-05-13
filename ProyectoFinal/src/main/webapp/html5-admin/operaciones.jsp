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
				mensaje="Alta moto realizada satisfactoriamente.";
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
				mensaje="Alta de cliente realizada con exito";
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
				mensaje="Baja moto realizada con exito";
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
				mensaje="Baja cliente realizada con exito";
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
					mensaje="Baja alquiler realizada satisfactoriamente";
				} else {
					mensaje="Error no se puede realizar la baja porque no existe ningun alquiler con esos valores";
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
				mensaje="Moto modificada satisfactoriamente";
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
				mensaje="Cliente modificao correctamete";
			}
			break;
		case "modificar_alquileres":
			if (request.getParameter("id_cliente")==""||request.getParameter("id_moto")==""||request.getParameter("fecha_hora")==""){
				mensaje="Debe rellenar todos los campos";
			} else {
				int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
				int id_moto = Integer.parseInt(request.getParameter("id_moto"));
				String fecha_hora = request.getParameter("fecha_hora");
				if (cont.existealquilerfromall(id_cliente, id_moto, fecha_hora)){
					response.sendRedirect("Modificar_alquileres2.jsp?id_cliente="+id_cliente+"&id_moto="+id_moto+"&fecha_hora="+fecha_hora);
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
				mensaje="Alta realizada exitosamente";
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