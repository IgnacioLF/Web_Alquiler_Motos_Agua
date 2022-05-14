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
							<h3>Modificar Alquiler</h3>
						</div>
						<%if(request.getParameter("error")!=null){ %>
						<div class="alert background-danger"><em class="fa"></em> <i class="bi bi-exclamation-triangle"></i> Oops, ocurrio un error debe rellenar todos los campos para poder realizar la operación <i class="bi bi-exclamation-triangle"></i></div>
						<%} %>
						<%
							if (request.getParameter("error2")!=null){ %>
								<div class="alert background-danger"><em class="fa "></em> <i class="bi bi-exclamation-triangle"></i> Oops, ocurrio un error no hay suficientes horas disponibles desde la hora de inicio que seleccionaste <i class="bi bi-exclamation-triangle"></i></div>
							<%}%>
						<%
						BDController cont = new BDController();
						int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
						int id_cliente_old = 0 ;
						if (request.getParameter("id_cliente_old")!=null){
							id_cliente_old =Integer.parseInt(request.getParameter("id_cliente_old"));
						} else {
							id_cliente_old=id_cliente;
						}
						int id_moto = Integer.parseInt(request.getParameter("id_moto"));;
						int id_moto_old = 0;
						if (request.getParameter("id_moto_old")!=null){
							id_moto_old = Integer.parseInt(request.getParameter("id_moto_old"));
						}else {
							id_moto_old=id_moto; 
						}
						String fecha = request.getParameter("fecha");
						String fecha_old = "";
						if (request.getParameter("fecha_old")!=null){
							fecha_old = request.getParameter("fecha_old");
						}else {
							fecha_old = fecha;
						}
						String hora_inicio = request.getParameter("hora_inicio");
						String hora_inicio_old= "";
						if (request.getParameter("hora_inicio_old")!=null){
							hora_inicio_old = request.getParameter("hora_inicio_old");
						}else {
							hora_inicio_old = hora_inicio;
						}
						if (request.getParameter("hora_inicio_new")!=null){
							hora_inicio=request.getParameter("hora_inicio_new");
						}
						Motos mymoto = cont.damemotoformidmoto(id_moto);
						Clientes mycliente = cont.dameclientefromid(id_cliente);
						String myfecha = fecha +" " +hora_inicio+":00.0";
						ArrayList<Clientes> listclientes = cont.dameclientes();
						ArrayList<Motos> listmotos = cont.damemotos();
						Alquiler myalquiler = cont.damealquilerfromall(id_cliente, id_moto, myfecha);
						int num_horas = myalquiler.getNum_horas();
						if (request.getParameter("num_horas")!=null){
							num_horas = Integer.parseInt(request.getParameter("num_horas"));
						}
						%>
						<div class="card-block">
							<form action="operaciones.jsp?tipo=modificar_alquileres2&id_moto_old=<%=id_moto_old%>&id_cliente_old=<%=id_cliente_old %>&hora_inicio_old=<%=hora_inicio_old %>&fecha_old=<%=fecha_old %>&hora_inicio=<%=hora_inicio %>" method="post">
								<fieldset>
									<label for="nameField">Moto</label>
									<select type="number" name="id_moto" class="estilosSuperior" id="id_moto"  is="ms-dropdown" style = "width:400px" data-child-height = "400">
										    <option value="<%=id_moto%>" data-image="../images/motos/<%=id_moto%>.png"><%=mymoto.getMarca()%> <%=mymoto.getModelo()%> (<%=mymoto.getMatricula()%>)</option>
										<%for (int i = 0;i<listmotos.size();i++){ 
										
										if (listmotos.get(i).getId()!=id_moto){
										%>
											<option value="<%=listmotos.get(i).getId()%>" data-image="../images/motos/<%=listmotos.get(i).getId()%>.png"><%=listmotos.get(i).getMarca()%> <%=listmotos.get(i).getModelo()%> (<%=listmotos.get(i).getMatricula()%>)</option>
										<%}} %>
									</select>
									<label for="nameField">Cliente</label>
									<select type="number" name="id_cliente" class="estilosSuperior" id="id_cliente"  is="ms-dropdown" style = "width:400px" data-child-height = "400">
										    <option value="<%=id_cliente%>" data-image="../images/clientes/<%=id_cliente%>.png"><%=mycliente.getNombre()%> <%=mycliente.getApellidos()%></option>
										<%for (int i = 0;i<listclientes.size();i++){
											if (listclientes.get(i).getId()!=id_cliente){
											%>
											<option value="<%=listclientes.get(i).getId()%>" data-image="../images/clientes/<%=listclientes.get(i).getId()%>.png"><%=listclientes.get(i).getNombre()%> <%=listclientes.get(i).getApellidos()%></option>
										<%}} %>
									</select>	
									<label for="nameField">Fecha</label>
									<input type="date" value="<%=fecha%>" id="fecha" name="fecha" maxlength="10">
									<label for="nameField">Nuemero de horas</label>
									<input type="number" value="<%=num_horas%>" id="num_horas" name="num_horas" maxlength="3" min="0">
									<label for="nameField">Hora de inicio <%=hora_inicio %>:00 <input class="button button-outline" type="submit" style="margin-left:2rem;" value="Cambiar hora inicio" name="cambiar_hora"></input></label>
									<h3 style="margin-top:1rem">Precio total  <strong style="color:#35cebe;"><%=mymoto.getPrecio_hora()*num_horas %>  &euro;</strong></h3>
									<input class="button-primary" type="submit" value="Modificar" style="display:block;" name="modificar" >
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