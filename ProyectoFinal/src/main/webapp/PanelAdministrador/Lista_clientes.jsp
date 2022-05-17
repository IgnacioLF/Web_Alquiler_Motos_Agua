<%@ page import="tiendamotos.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Panel de administrador - Lista clientes</title>
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
			<div class="row grid-responsive">
				<div class="column ">
					<div class="card">
						<div class="card-title">
						<%
						BDController cont = new BDController();
						ArrayList<Clientes> listclientes = cont.dameclientes();
						%>
							<h3>Lista de clientes</h3>
						</div>
						<% if (request.getParameter("alta")!=null){ %>
							<div class="alert background-success"><em class="fa fa-thumbs-up"></em><i class="bi bi-check-circle"></i> Alta realizada con exito <i class="bi bi-check-circle"></i></div>
						<%} else if (request.getParameter("baja")!=null){ %>
							<div class="alert background-success"><em class="fa fa-thumbs-up"></em><i class="bi bi-check-circle"></i> Baja realizada con exito <i class="bi bi-check-circle"></i></div>
						<%} else if (request.getParameter("modificar")!=null){ %>
							<div class="alert background-success"><em class="fa fa-thumbs-up"></em><i class="bi bi-check-circle"></i> Modificación realizada con exito <i class="bi bi-check-circle"></i></div>
						<%} %>
						<div class="card-block">
							<table id="tableData" class="table-striped">
								<thead>
									<tr>
										<th>Imagen</th>
										<th>Id</th>
										<th>DNI</th>
										<th>Nombre</th>
										<th>Apellidos</th>
										<th>Direccion</th>
										<th>CP</th>
										<th>Provincia</th>
									</tr>
								</thead>
								<tbody>
								<%
								for (int i = 0;i<listclientes.size();i++){
								%>
									<tr>
										<td><img src="../images/clientes/<%if (listclientes.get(i).getId()>10){
										out.print("00");
									} else {
										out.print(listclientes.get(i).getId());
									}%>.png" alt="" style="width:60px;height:60px;"></td>
										<td><%=listclientes.get(i).getId()%></td>
										<td><%=listclientes.get(i).getDni()%></td>
										<td><%=listclientes.get(i).getNombre()%></td>
										<td><%=listclientes.get(i).getApellidos()%></td>
										<td><%=listclientes.get(i).getDireccion()%></td>
										<td><%=listclientes.get(i).getCp()%></td>
										<td><%=listclientes.get(i).getProvincia()%></td>
									</tr>
									<%} %>
								</tbody>
							</table>
							<input type="button" id="btnExport" value="Descargar en pdf" onclick="Export()" />
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<!-- jQuery -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
<!-- jQuery UI -->
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/paging.js"></script> 
<script type="text/javascript">
            $(document).ready(function() {
                $('#tableData').paging({limit:6});
            });
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
    
   <script type="text/javascript">
        function Export() {
            html2canvas(document.getElementById('tableData'), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    }; 
                    pdfMake.createPdf(docDefinition).download("Lista_clientes.pdf");
                }
            });
        }
    </script>
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