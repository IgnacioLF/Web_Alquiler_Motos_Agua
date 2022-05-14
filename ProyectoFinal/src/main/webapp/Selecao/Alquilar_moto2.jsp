<%@ page import="tiendamotos.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<%
	BDController cont = new BDController();
	int id_moto = Integer.parseInt(request.getParameter("id_moto"));
	Motos currentmoto = cont.damemotoformidmoto(id_moto);
%>
  <title>Alquiler moto - <%=currentmoto.getMarca() %> <%=currentmoto.getModelo() %></title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <link href="assets/css/podiumstyle.css" rel="stylesheet">
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center  header-transparent " style="background: #00a690 !important;">
    <div class="container d-flex align-items-center " style="justify-content: space-between!important; ">

      <div class="logo" style="display: block !important;">
        <a href="index.jsp"><img src="assets/img/logo.png" style="width: 9rem; height:9rem;"></a>
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto colorwhite" href="index.jsp#hero">Home</a></li>
          <li><a class="nav-link scrollto colorwhite" href="index.jsp#about">Quienes somos</a></li>
          <li><a class="nav-link scrollto colorwhite" href="index.jsp#motosagua">Motos de agua</a></li>
          <li><a class="nav-link scrollto colorwhite" href="index.jsp#clientes">Todos los clientes</a></li>
          <li><a class="nav-link scrollto colorwhite" href="index.jsp#podiomotos">Motos más alquiladas</a></li>
          <li><a class="nav-link scrollto colorwhite" href="index.jsp#podioclientes">Mejores clientes</a></li>
          <li><a class="nav-link scrollto colorwhite" href="index.jsp#contact">Contacto</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <main id="main" style="margin-top:6rem ;">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h1 style="font-size: 2rem; font-weight: bold;">Alquilar Moto</h1>
          <ol>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="Detalles_moto.jsp?id_moto=<%=currentmoto.getId()%>"><%=currentmoto.getMarca() %> <%=currentmoto.getModelo() %></a></li>
            <li>Alquilar moto</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">
        <form action="#" method="post" role="form" class="php-email-form">
     	 <%if (request.getParameter("error")!=null){ %>
			<div class="alert background-danger"><em class="fa "></em> <i class="bi bi-exclamation-triangle"></i> Oops, ocurrio un error no hay suficientes horas disponibles desde la hora de inicio que seleccionaste <i class="bi bi-exclamation-triangle"></i></div>
			<%}%>
          <div style="display:flex ; align-items: center; margin-bottom: 0.2rem;">
            <h2 style="margin-left:1rem ; color:#00a690; margin-right: 1.5rem;">Datos Seleccionados</h2>
            <a href="Alquilar_moto.jsp?id_moto=<%=currentmoto.getId() %>" class="btn-verdetalles" style="padding-right: 1rem !important; padding-left: 1rem !important; padding-top: 0.3rem;padding-bottom: 0.3rem;font-size: 1.2rem;border: 2px solid #00a690; background-color: #00a690; " >Volver a seleccionar</a>
         </div>
         <%
         	if (request.getParameter("nombre_cliente")==""||request.getParameter("apellidos_cliente")==""||request.getParameter("dni_cliente")==""||request.getParameter("cp_cliente")==""||request.getParameter("provincia_cliente")==""||request.getParameter("fecha")==""||request.getParameter("num_horas")==""||request.getParameter("direccion_cliente")==""){
         		response.sendRedirect("Alquilar_moto.jsp?id_moto="+id_moto+"&error=true");
         	} else {
         		String dni_cliente = request.getParameter("dni_cliente");
         		String direccion_cliente= request.getParameter("direccion_cliente");
         		String nombre_cliente = request.getParameter("nombre_cliente");
         		String apellidos_cliente =request.getParameter("apellidos_cliente");
         		String cp_cliente =request.getParameter("cp_cliente");
         		String provincia_cliente = request.getParameter("provincia_cliente");
         		String fecha =request.getParameter("fecha");
         		if (cont.existeclientefromdni(dni_cliente)){
         			if (cont.existeclientefromdniwithall(dni_cliente, nombre_cliente, apellidos_cliente, direccion_cliente, cp_cliente, provincia_cliente)==false){
         				response.sendRedirect("Alquilar_moto.jsp?id_moto="+id_moto+"&error2=true");
         			}
         		} else {
         			int id_cliente = cont.lastid_clientes() + 1;
         			cont.altacliente(id_cliente, dni_cliente, nombre_cliente, apellidos_cliente, direccion_cliente, Integer.parseInt(cp_cliente), provincia_cliente);
         		}
         		
         		int num_horas = Integer.parseInt(request.getParameter("num_horas"));
         		Date thedate = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
				SimpleDateFormat sdf2 = new SimpleDateFormat("EEEE");
				String dianombre = sdf2.format(thedate);
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
				ArrayList<Alquiler> listalquiledemoto = cont.damealquileresfromidmoto(id_moto);
				ArrayList<Alquiler> listalquiledemoto_currentfecha = new ArrayList<Alquiler>();
				for (int i = 0;i<listalquiledemoto.size();i++){
					if (listalquiledemoto.get(i).damesolofecha().equals(fecha)){
						listalquiledemoto_currentfecha.add(listalquiledemoto.get(i));
					}
				}
         
         %>
         <div style="border:2px solid #00a690 ; padding: 1rem; border-radius: 20px; display:flex; align-items: center; gap: 3rem;justify-content: center;">
            <h3>Horas : <strong><%=num_horas %></strong></h3>
            <h3><%=dianombre %> <%=fechaenpartes[2] %> de <%=mes %> del <%=fechaenpartes[0] %></h3>
            <div style="display:flex ; flex-direction:column; align-items: center;">
              <img class="imagenclientespodio" src="assets/img/cliente_default.png" alt="" style=" width:100px;height:100px; margin-bottom: 0.3rem;">
              <h4><%=nombre_cliente%></h4>
            </div>
            <div style="flex-direction: column;display: flex;align-items: center;justify-content: center;">
              <img src="assets/img/motos/<%=currentmoto.getId() %>.png" alt="" style="width:120px;height:100px; margin-bottom: 0.3rem;">
              <h4><%=currentmoto.getMarca() %> <%=currentmoto.getModelo() %></h4>
            </div>
         </div>
         <div style="display:flex; align-items: center; justify-content: center; margin-top:0.5rem;">
        	 <h4 style="margin-right:1rem; margin-top: 0.6rem;">Precio total: </h4> <strong style="font-size: 40px !important; color: #00a690; margin-right:2rem;"><%=(currentmoto.getPrecio_hora()*num_horas) %>&euro;</strong>
         </div>
         <div style="display: flex;flex-direction: column;align-items: center;">
          <h2 style="color: #ef6603; margin-bottom:1rem;">Seleccione hora de inicio</h2>
          <table class="roundedCorners" style="display: flex;">
            <tr>
              <th style="padding-left:7rem ; padding-right:7rem;">Hora de inicio</th>
              <th style="padding-left:7rem ; padding-right:7rem;">Estado</th>
            </tr>
            <%
				int hora_tabla = 11;
				do {
					boolean ocupado=false;
					%>
						<tr>
						<td><%=hora_tabla %>:00-<%=(hora_tabla+1)%>:00</td>
					<%
					for (int i = 0;i<listalquiledemoto_currentfecha.size();i++){
						if (listalquiledemoto_currentfecha.get(i).damehoraentrada()<=hora_tabla&&listalquiledemoto_currentfecha.get(i).damehorasalida()>hora_tabla){
							ocupado=true;
						}
					}
					if (hora_tabla!=19){
						if (ocupado==true){ %>
							<td style="background-color: red; text-align: center;"><strong style="color:black !important;">Ocupado</strong></td>
						<%}else{ %>
							<td style="background-color: greenyellow; text-align: center;"><a href="Alquilar_moto3.jsp?id_moto=<%=id_moto%>&nombre_cliente=<%=nombre_cliente%>&apellidos_cliente=<%=apellidos_cliente%>&dni_cliente=<%=dni_cliente%>&cp_cliente=<%=cp_cliente%>&provincia_cliente=<%=provincia_cliente%>&fecha=<%=fecha%>&num_horas=<%=num_horas%>&hora_inicio=<%=hora_tabla%>&direccion_cliente=<%=direccion_cliente%>"><strong style="color:black !important;">Disponible</strong></a></td>
						<%}
					} else {
						if (ocupado==true){ %>
						<td style="background-color: red; text-align: center; border-radius: 0px 0px 19px 0px;"><strong style="color:black !important;">Ocupado</strong></td>
					<%}else{ %>
						<td style="background-color: greenyellow; text-align: center; border-radius: 0px 0px 19px 0px;"><a href="Alquilar_moto3.jsp?id_moto=<%=id_moto%>&nombre_cliente=<%=nombre_cliente%>&apellidos_cliente=<%=apellidos_cliente%>&dni_cliente=<%=dni_cliente%>&cp_cliente=<%=cp_cliente%>&provincia_cliente=<%=provincia_cliente%>&fecha=<%=fecha%>&num_horas=<%=num_horas%>&hora_inicio=<%=hora_tabla%>&direccion_cliente=<%=direccion_cliente%>"><strong style="color:black !important;">Disponible</strong></a></td>
					<%}
					}
					%>
					</tr>
					<% 
						hora_tabla=hora_tabla+1;
				}while(hora_tabla<20);
			%>
          </table>
        </div>
        </form>
        <%} %>
      </div>
    </section><!-- End Portfolio Details Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <a href="index.jsp"><img src="assets/img/logo.png" style="width: 8rem; height:5rem;"></a>
      <p style="margin-top: 1rem; margin-bottom: 0.5rem;">Alquiler de motos de agua en Elche.</p>
      <a href="../PanelAdministrador/Index.jsp" class="colororange">Entrar como administrador</a>
      <div class="social-links" style="margin-top:1rem ;">
        <a href="#" class="twitter colorblue"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook colorblue"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram colorblue"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus colorblue"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin colorblue"><i class="bx bxl-linkedin"></i></a>
      </div>
  
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  <script src="assets/js/myjs.js"></script>

</body>

</html>