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
						ArrayList<Clientes> listclientes = cont.dameclientes();
						ArrayList<Motos> listmotos = cont.damemotos();
						%>
							<form action="operaciones.jsp?tipo=alta_alquileres" method="post">
								<fieldset>
							
									<select name="select2" size="3" style="height: 7rem;width: 15rem;">
									  <option style="background-color: rgb(255,0,0);text-align: center;">12:00-13:00</option>
									  <option style="text-align: center;">13:00-14:00</option>
									  <option style="text-align: center;">14:00-15:00</option>
									</select>
									<label for="nameField">Moto</label>
									<select type="number" name="id_moto" class="estilosSuperior" id="id_moto"  is="ms-dropdown" style = "width:400px" data-child-height = "400">
										    <option value="">Seleccione una moto</option>
										<%for (int i = 0;i<listmotos.size();i++){ %>
											<option value="<%=listmotos.get(i).getId()%>" data-image="../images/motos/<%=listmotos.get(i).getId()%>.png"><%=listmotos.get(i).getMarca()%> <%=listmotos.get(i).getModelo()%> (<%=listmotos.get(i).getMatricula()%>)</option>
										<%} %>
									</select>
									<label for="nameField">Cliente</label>
									<select type="number" name="id_cliente" class="estilosSuperior" id="id_cliente"  is="ms-dropdown" style = "width:400px" data-child-height = "400">
										    <option value="">Seleccione un cliente</option>
										<%for (int i = 0;i<listclientes.size();i++){ %>
											<option value="<%=listclientes.get(i).getId()%>" data-image="../images/clientes/<%=listclientes.get(i).getId()%>.png"><%=listclientes.get(i).getNombre()%> <%=listclientes.get(i).getApellidos()%></option>
										<%} %>
									</select>
									<label for="nameField">Nuemero de horas</label>
									<input type="number" placeholder="0" id="num_horas" name="num_horas" maxlength="3" min="0">	
									<label for="nameField">Fecha</label>
									<input type="date" placeholder="00/00/0000" id="fecha" name="fecha" maxlength="10" >
									<label for="nameField">Horas</label>
									<select type="number" name="hora_inicio" id="hora_inicio">
											<option value="">Seleccione la hora de inicio</option>
   											<option value="11">11:00</option>
   											<option value="12">12:00</option>
    										<option value="13">13:00</option>
    										<option value="14">14:00</option>
   											<option value="15">15:00</option>
   											<option value="16">16:00</option>
   											<option value="17">17:00</option>
   											<option value="18">18:00</option>
   											<option value="19">19:00</option>
  									</select>
									<label for="nameField">Precio total</label>
									<input type="number" placeholder="00" id="precio_total" name="precio_total" maxlength="10" min="1" step="any">
									<input class="button-primary" type="submit" value="Dar de alta" style="display:block;" >
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