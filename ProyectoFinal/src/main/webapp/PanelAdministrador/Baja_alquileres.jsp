<%@ page import="tiendamotos.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Panel de administrador - Baja alquiler</title>
	<link href="../images/favicon.png" rel="icon">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/milligram.min.css">
	<link rel="stylesheet" href="css/styles.css">
	<link rel="stylesheet" href="../assets/css/dd.css?v=4.0">
	<link rel="stylesheet" type="text/css" href="../assets/css/flags.css?v=1.0" />
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
							<h3>Baja Alquiler</h3>
						</div>
						<%if(request.getParameter("error")!=null){ %>
						<div class="alert background-danger"><em class="fa"></em> <i class="bi bi-exclamation-triangle"></i> Oops, ocurrio un error debe rellenar todos los campos para poder realizar la operación <i class="bi bi-exclamation-triangle"></i></div>
						<%} %>
						<%if(request.getParameter("error2")!=null){ %>
						<div class="alert background-danger"><em class="fa"></em> <i class="bi bi-exclamation-triangle"></i> Oops, ocurrio un error no existe ningun alquiler con esos valores <i class="bi bi-exclamation-triangle"></i></div>
						<%} %>
						<div class="card-block">
						<%
						BDController cont = new BDController();
						ArrayList<Alquiler> listalquileres = cont.damealquiler();
						ArrayList<Clientes> listclientes = cont.dameclientes();
						ArrayList<Motos> listmotos = cont.damemotos();
						%>
							<form action="operaciones.jsp?tipo=baja_alquileres" method="post">
								<fieldset>
									<label for="nameField">Moto</label>
									<select type="number" name="id_moto" class="estilosSuperior" id="id_moto"  is="ms-dropdown" style = "width:400px" data-child-height = "400">
										    <option value="">Seleccione una moto</option>
										<%for (int i = 0;i<listmotos.size();i++){ %>
											<option value="<%=listmotos.get(i).getId()%>" data-image="../images/motos/<%if (listmotos.get(i).getId()>6){
											out.print("00");
										} else {
											out.print(listmotos.get(i).getId());
										}%>.png"><%=listmotos.get(i).getMarca()%> <%=listmotos.get(i).getModelo()%> (<%=listmotos.get(i).getMatricula()%>)</option>
										<%} %>
									</select>
									<label for="nameField">Cliente</label>
									<select type="number" name="id_cliente" class="estilosSuperior" id="id_cliente"  is="ms-dropdown" style = "width:400px" data-child-height = "400">
										    <option value="">Seleccione un cliente</option>
										<%for (int i = 0;i<listclientes.size();i++){ %>
											<option value="<%=listclientes.get(i).getId()%>" data-image="../images/clientes/<%if (listclientes.get(i).getId()>10){
											out.print("00");
										} else {
											out.print(listclientes.get(i).getId());
										}%>.png"><%=listclientes.get(i).getNombre()%> <%=listclientes.get(i).getApellidos()%></option>
										<%} %>
									</select>
									<label for="nameField">Fecha</label>
									<input type="date" placeholder="00/00/0000 00:00" id="fecha" name="fecha" maxlength="10">
									<label for="nameField">Horas Inicio</label>
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
									<input class="button-primary" type="submit" value="Dar de baja" style="display:block;" >
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