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
						Clientes currentcliente = cont.dameclientefromid(Integer.parseInt(id_cliente));
						String id_moto = request.getParameter("id_moto");
						Motos currentmoto = cont.damemotoformidmoto(Integer.parseInt(id_moto));
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
						
						ArrayList<Alquiler> listalquiledemoto = cont.damealquileresfromidmoto(Integer.parseInt(id_moto));
						ArrayList<Alquiler> listalquiledemoto_currentfecha = new ArrayList<Alquiler>();
						for (int i = 0;i<listalquiledemoto.size();i++){
							if (listalquiledemoto.get(i).damesolofecha().equals(fecha)){
								listalquiledemoto_currentfecha.add(listalquiledemoto.get(i));
							}
						}
						%>
							
								<fieldset >
								<%
								String tipo = request.getParameter("tipo");
								if (tipo.equalsIgnoreCase("error")){ %>
									<div class="alert background-danger"><em class="fa fa-times-circle"></em> <i class="bi bi-exclamation-triangle"></i> Oops, ocurrio un error no hay suficientes horas disponibles desde la hora de inicio que seleccionaste <i class="bi bi-exclamation-triangle"></i></div>
								<%}%>
								<h2>Datos seleccionados:</h2>
								<a href="Alta_alquiler.jsp"><button class="button button-outline" style="margin-right:1rem;" type="button" >Volver a seleccionar</button></a>
								<div style="display:flex; flex-direccion:row; align-items: center; gap: 3rem;justify-content: center;border-radius: 29px;border: 3px solid #35cebe; margin-bottom:2rem; padding-top:2rem; width: 90rem;">
									<h3>Horas : <strong><%=num_horas %></strong></h3>
									<h3><%=dianombre %> <%=fechaenpartes[2] %> de <%=mes %> del <%=fechaenpartes[0] %></h3>
									<div style="displat:flex;">
										<img src="../images/clientes/<%=id_cliente%>.png" alt="" style="width:100px;height:100px; margin-bottom: 0.2rem;">
										<h4><%=currentcliente.getNombre() %></h4>
									</div>
									<div style="flex-direction: column;display: flex;align-items: center;justify-content: center;">
										<img src="../images/motos/<%=id_moto%>.png" alt="" style="width:100px;height:100px; margin-bottom: 0.2rem;">
										<h4><%=currentmoto.getMarca() %> <%=currentmoto.getModelo() %></h4>
									</div>
								</div>
								<h2>Seleccione hora de inicio:</h2>
								 <table style="width:60% !important;">
									<thead>
										<tr>
											<th style="text-align: center;">Hora Inicio</th>
											<th style="text-align: center;">Estado</th>
										</tr>
									</thead>
								<tbody>
									<%
									int hora_tabla = 11;
									do {
										boolean ocupado=false;
										%>
											<tr>
												<td style="text-align: center;"><%=hora_tabla %>:00-<%=(hora_tabla+1)%>:00</td>
												<%
												for (int i = 0;i<listalquiledemoto_currentfecha.size();i++){
													if (listalquiledemoto_currentfecha.get(i).damehoraentrada()<=hora_tabla&&listalquiledemoto_currentfecha.get(i).damehorasalida()>hora_tabla){
														ocupado=true;
													}
												}
												if (ocupado==true){ %>
												<td style="background-color: red; text-align: center;"><strong style="color:black !important;">Ocupado</strong></td>
												<%}else{ %>
												<td style="background-color: greenyellow; text-align: center;"><a href="operaciones.jsp?tipo=alta_alquiler2&id_cliente=<%=id_cliente%>&id_moto=<%=id_moto%>&num_horas=<%=num_horas%>&hora_inicio=<%=hora_tabla%>&fecha=<%=fecha%>"><strong style="color:black !important;">Disponible</strong></a></td>
												<%} %>
											</tr>
										<% 
										hora_tabla=hora_tabla+1;
									}while(hora_tabla<20);
									%>
								</tbody>
							</table>
							
							<%
							double preciototal = currentmoto.getPrecio_hora() * Double.parseDouble(num_horas);
							%>
							<h2>Precio Total : <strong style="color:#35cebe;"><%=preciototal %>  &euro;</strong></h2>
							
							</fieldset>
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