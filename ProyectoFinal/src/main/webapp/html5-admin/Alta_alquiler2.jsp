<%@ page import="tiendamotos.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
	
		<link rel="stylesheet" href="../assets/css/dd.css?v=4.0">
		<link rel="stylesheet" type="text/css" href="../assets/css/flags.css?v=1.0" />
	
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
				<li><a href="Alta_alquileres.jsp"><em class="fa fa fa-clone"></em> Alta Alquiler</a></li>
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
							<h3>Alta Alquiler</h3>
						</div>
						<div class="card-block">
						<%
						boolean click = false;
						BDController cont = new BDController();
						String id_cliente = request.getParameter("id_cliente");
						String id_motoo = request.getParameter("id_moto");
						String fecha = request.getParameter("fecha");
						Date thedate = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
						SimpleDateFormat sdf2 = new SimpleDateFormat("EEEE");
						String dianombre = sdf2.format(thedate);
						String num_horas = request.getParameter("num_horas");
						String[] fechaenpartes = fecha.split("-");
						String mes = "";
						int nummes = Integer.parseInt(fechaenpartes[1]);
						switch (nummes) {
						case 1 :
							mes = "Enero";
							break;
						case 2 :
							mes = "Febrero";
							break;
						case 3 :
							mes = "Marzo";
							break;
						case 4 :
							mes = "Abril";
							break;
						case 5 :
							mes = "Mayo";
							break;
						case 6 :
							mes = "Junio";
							break;
						case 7 :
							mes = "Julio";
							break;
						case 8 :
							mes = "Agosto";
							break;
						case 9 :
							mes = "Septiembre";
							break;
						case 10 :
							mes = "Octubre";
							break;
						case 11 :
							mes = "Noviembre";
							break;
						case 12 :
							mes = "Diciembre";
							break;
						}
						%>
							<form action="Alta_alquiler2.jsp?tipo=alta_alquilere" method="post">
								<fieldset >
								<h3><%=dianombre %> <%=fechaenpartes[2] %> de <%=mes %> del <%=fechaenpartes[0] %></h3>
								 <table style="with:0% !importan;">
									<thead>
										<tr>
											<th>Hora Inicio</th>
											<th>Estado</th>
										</tr>
									</thead>
								<tbody>
									<tr>
										<td>11:00</td>
										<td>Ocupado</td>
									</tr>
									<tr>
										<td>11:00</td>
										<td>Ocupado</td>
									</tr>
									<tr>
										<td>11:00</td>
										<td>Ocupado</td>
									</tr>
									<tr>
										<td>11:00</td>
										<td>Ocupado</td>
									</tr>
								</tbody>
							</table>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			
		</section>
	</div>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="../assets/js/dropdown.js"></script>
	<script src="../assets/js/dd.min.js?ver=4.0"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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