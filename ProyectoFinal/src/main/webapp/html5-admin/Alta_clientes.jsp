<%@ page import="tiendamotos.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Panel de administrador - Alta cliente</title>
	<link href="../images/favicon.png" rel="icon">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/milligram.min.css">
	<link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<div class="navbar" style="background-color:#00a690; height: 90px; padding:0px;">
		<div style="display:flex; justify-content: center; margin-top:1rem;">
			 <a href="Index.jsp"><img src="../images/logo.png" style="width: 11rem; height:7rem;"></a>
		</div>
	</div>
	<div class="row">
		<div id="sidebar" class="column" style="margin-top:7rem;width: 17% !important; ">
			<div style="display:flex; justify-content: center;">
				<h4><strong>Menu</strong></h4>
			</div>
			<ul>
				<li><a href="Index.jsp"><em class="fa fa-home"></em><i class="bi bi-house"></i> Principal</a></li>
				<li><a href="Lista_motos.jsp"><em class="fa fa-table"></em><i class="bi bi-list-ul"></i> Lista Motos</a></li>
				<li><a href="Alta_motos.jsp"><em class="fa fa fa-clone"></em><i class="bi bi-plus-circle"></i> Alta Moto</a></li>
				<li><a href="Baja_motos.jsp"><em class="fa fa-warning"></em><i class="bi bi-dash-circle"></i> Baja Moto</a></li>
				<li><a href="Modificar_motos.jsp"><em class="fa fa-pencil-square-o"></em><i class="bi bi-pencil-square"></i> Modificar Moto</a></li>
				<li><a href="Lista_clientes.jsp"><em class="fa fa-table"></em><i class="bi bi-list-ul"></i> Lista Cliente</a></li>
				<li><a href="Alta_clientes.jsp"><em class="fa fa fa-clone"></em><i class="bi bi-plus-circle"></i> Alta Cliente</a></li>
				<li><a href="Baja_clientes.jsp"><em class="fa fa-warning"></em><i class="bi bi-dash-circle"></i> Baja Cliente</a></li>
				<li><a href="Modificar_clientes.jsp"><em class="fa fa-pencil-square-o"></em><i class="bi bi-pencil-square"></i> Modificar Cliente</a></li>
				<li><a href="Lista_alquileres.jsp"><em class="fa fa-table"></em><i class="bi bi-list-ul"></i> Lista Alquileres</a></li>
				<li><a href="Alta_alquiler.jsp"><em class="fa fa fa-clone"></em><i class="bi bi-plus-circle"></i> Alta Alquiler</a></li>
				<li><a href="Baja_alquileres.jsp"><em class="fa fa-warning"></em><i class="bi bi-dash-circle"></i> Baja Alquiler</a></li>
				<li><a href="Modificar_alquileres.jsp"><em class="fa fa-pencil-square-o"></em><i class="bi bi-pencil-square"></i> Modificar Alquiler</a></li>
			</ul>
		</div>
		<section id="main-content" class="column column-offset-20">
			<!--Forms-->
			<div class="row grid-responsive">
				<div class="column ">
					<div class="card">
						<div class="card-title">
							<h3>Alta Cliente</h3>
						</div>
						<%if(request.getParameter("error")!=null){ %>
						<div class="alert background-danger"><em class="fa"></em> <i class="bi bi-exclamation-triangle"></i> Oops, ocurrio un error debe rellenar todos los campos para poder realizar la operación <i class="bi bi-exclamation-triangle"></i></div>
						<%} %>
						<div class="card-block">
							<form action="operaciones.jsp?tipo=alta_cliente" method="post">
								<fieldset>
									<label for="nameField">DNI</label>
									<input type="text" placeholder="12345678X" id="dni" name="dni" maxlength="9">
									<label for="nameField">Nombre</label>
									<input type="text" placeholder="Juan" id="nombre" name="nombre" maxlength="9">
									<label for="nameField">Apellidos</label>
									<input type="text" placeholder="Perez Bonet" id="apellidos" name="apellidos" maxlength="15">
									<label for="nameField">Dirección</label>
									<input type="text" placeholder="Carrera Madrid, 61" id="direccion" name="direccion" maxlength="15">
									<label for="nameField">Codigo postal</label>
									<input type="number" placeholder="37799" id="cp" name="cp" maxlength="5" min="0">
									<label for="nameField">Provincia</label>
									<select id="provincia" name="provincia">
										<option value="">Seleccione Provincia</option>
										<option value="A Coruña">A Coruña</option>
										<option value="Alacant">Alacant</option>
										<option value="Albacete">Albacete</option>
										<option value="Almería">Almería</option>
										<option value="Araba">Araba</option>
										<option value="Asturias">Asturias</option>
										<option value="Ávila">Ávila</option>
										<option value="Badajoz">Badajoz</option>
										<option value="Barcelona">Barcelona</option>
										<option value="Bizkaia">Bizkaia</option>
										<option value="Burgos">Burgos</option>
										<option value="Cáceres">Cáceres</option>
										<option value="Cádiz">Cádiz</option>
										<option value="Cantabria">Cantabria</option>
										<option value="Castelló">Castelló</option>
										<option value="Ceuta">Ceuta</option>
										<option value="Ciudad Real">Ciudad Real</option>
										<option value="Córdoba">Córdoba</option>
										<option value="Cuenca">Cuenca</option>
										<option value="Gipuzcoa">Gipuzcoa</option>
										<option value="Girona">Girona</option>
										<option value="Granada">Granada</option>
										<option value="Guadalajara">Guadalajara</option>
										<option value="Huelva">Huelva</option>
										<option value="Huesca">Huesca</option>
										<option value="Islas Baleares">Islas Baleares</option>
										<option value="Jaén">Jaén</option>
										<option value="La Rioja">La Rioja</option>
										<option value="Las Palmas">Las Palmas</option>
										<option value="León">León</option>
										<option value="Lleida">Lleida</option>
										<option value="Lugo">Lugo</option>
										<option value="Madrid">Madrid</option>
										<option value="Málaga">Málaga</option>
										<option value="Melilla">Melilla</option>
										<option value="Murcia">Murcia</option>
										<option value="Navarra">Navarra</option>
										<option value="Orense">Orense</option>
										<option value="Palencia">Palencia</option>
										<option value="Pontevedra">Pontevedra</option>
										<option value="Salamanca">Salamanca</option>
										<option value="Santa Cruz de Tenerife">Santa Cruz de Tenerife</option>
										<option value="Segovia">Segovia</option>
										<option value="Sevilla">Sevilla</option>
										<option value="Soria">Soria</option>
										<option value="Tarragona">Tarragona</option>
										<option value="Teruel">Teruel</option>
										<option value="Toledo">Toledo</option>
										<option value="Valencia">Valencia</option>
										<option value="Valladolid">Valladolid</option>
										<option value="Zamora">Zamora</option>
										<option value="Zaragoza">Zaragoza</option>
									</select>
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