<%@ page import="tiendamotos.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Panel de administrador - Modificar cliente</title>
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
									<img src="../images/clientes/<%if (cliente.getId()>10){
									out.print("00");
								} else {
									out.print(cliente.getId());
								}%>.png" alt="" style="width:100px;height:100px; margin-bottom: 1rem;">
									<label for="nameField">DNI</label>
									<input type="text" value="<%=cliente.getDni() %>" id="dni" name="dni" maxlength="9">
									<label for="nameField">Nombre</label>
									<input type="text" value="<%=cliente.getNombre() %>" id="nombre" name="nombre" maxlength="9">
									<label for="nameField">Apellidos</label>
									<input type="text" value="<%=cliente.getApellidos() %>" id="apellidos" name="apellidos" maxlength="15">
									<label for="nameField">Dirección</label>
									<input type="text" value="<%=cliente.getDireccion() %>" id="direccion" name="direccion" maxlength="15">
									<label for="nameField">Codigo postal</label>
									<input type="number" value="<%=cliente.getCp() %>" id="cp" name="cp" max="99999" min="1">
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