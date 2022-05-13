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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	
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
			<!--Forms-->
			<div class="row grid-responsive">
				<div class="column ">
					<div class="card">
						<div class="card-title">
							<h3>Modificar Cliente</h3>
						</div>
						<%if(request.getParameter("error")!=null){ %>
						<div class="alert background-danger"><em class="fa"></em> <i class="bi bi-exclamation-triangle"></i> Oops, ocurrio un error debe rellenar todos los campos para poder realizar la operación <i class="bi bi-exclamation-triangle"></i></div>
						<%} %>
						<%
						BDController cont = new BDController();
						
						if ((request.getParameter("id_cliente")!=null&request.getParameter("id_cliente")!="")||request.getParameter("error")!=null){
						Clientes cliente = cont.dameclientefromid(Integer.parseInt(request.getParameter("id_cliente")));
						%>
						<div class="card-block">
							<form action="operaciones.jsp?tipo=modificar_cliente&id_cliente=<%=cliente.getId()%>" method="post">
								<fieldset>
									<img src="../images/clientes/<%=cliente.getId()%>.png" alt="" style="width:100px;height:100px; margin-bottom: 1rem;">
									<label for="nameField">DNI</label>
									<input type="text" value="<%=cliente.getDni() %>" id="dni" name="dni" maxlength="9">
									<label for="nameField">Nombre</label>
									<input type="text" value="<%=cliente.getNombre() %>" id="nombre" name="nombre" maxlength="9">
									<label for="nameField">Apellidos</label>
									<input type="text" value="<%=cliente.getApellidos() %>" id="apellidos" name="apellidos" maxlength="15">
									<label for="nameField">Dirección</label>
									<input type="text" value="<%=cliente.getDireccion() %>" id="direccion" name="direccion" maxlength="15">
									<label for="nameField">Codigo postal</label>
									<input type="number" value="<%=cliente.getCp() %>" id="cp" name="cp" maxlength="5" min="0">
									<label for="nameField">Provincia</label>
									<select id="provincia" name="provincia">
									<%
									ArrayList<String> provincias = new ArrayList<String>();
									provincias.add("A Coruña");
									provincias.add("Alacant");
									provincias.add("Albacete");
									provincias.add("Almería");
									provincias.add("Araba");
									provincias.add("Asturias");
									provincias.add("Ávila");
									provincias.add("Badajoz");
									provincias.add("Barcelona");
									provincias.add("Bizkaia");
									provincias.add("Burgos");
									provincias.add("Cáceres");
									provincias.add("Cádiz");
									provincias.add("Cantabria");
									provincias.add("Castelló");
									provincias.add("Ceuta");
									provincias.add("Ciudad Real");
									provincias.add("Córdoba");
									provincias.add("Cuenca");
									provincias.add("Gipuzcoa");
									provincias.add("Girona");
									provincias.add("Granada");
									provincias.add("Guadalajara");
									provincias.add("Huelva");
									provincias.add("Huesca");
									provincias.add("Islas Baleares");
									provincias.add("Jaén");
									provincias.add("La Rioja");
									provincias.add("Las Palmas");
									provincias.add("León");
									provincias.add("Lleida");
									provincias.add("Lugo");
									provincias.add("Madrid");
									provincias.add("Málaga");
									provincias.add("Melilla");
									provincias.add("Murcia");
									provincias.add("Navarra");
									provincias.add("Orense");
									provincias.add("Palencia");
									provincias.add("Pontevedra");
									provincias.add("Salamanca");
									provincias.add("Santa Cruz de Tenerife");
									provincias.add("Segovia");
									provincias.add("Sevilla");
									provincias.add("Soria");
									provincias.add("Tarragona");
									provincias.add("Teruel");
									provincias.add("Toledo");
									provincias.add("Valencia");
									provincias.add("Valladolid");
									provincias.add("Zamora");
									provincias.add("Zaragoza");
									%>
										<option value="<%=cliente.getProvincia()%>"><%=cliente.getProvincia()%></option>
										<%
										for (int i=0;i<provincias.size();i++){
										if (cliente.getProvincia().equalsIgnoreCase(provincias.get(i))==false){ %>
										<option value="<%=provincias.get(i)%>"><%=provincias.get(i) %></option>
										<%
										}
										}
										%>
									</select>
									<input class="button-primary" type="submit" value="Modificar" style="display:block;" >
								</fieldset>
							</form>
						</div>
						
						<%}else {
							response.sendRedirect("Modificar_clientes.jsp?error=true");
							}%>
						
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