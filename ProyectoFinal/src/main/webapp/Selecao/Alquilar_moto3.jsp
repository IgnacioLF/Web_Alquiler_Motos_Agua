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
  	String direccion_cliente = request.getParameter("direccion_cliente");
  	String nombre_cliente = request.getParameter("nombre_cliente");
	String apellidos_cliente =request.getParameter("apellidos_cliente");
	String dni_cliente = request.getParameter("dni_cliente");
	String cp_cliente =request.getParameter("cp_cliente");
	String provincia_cliente = request.getParameter("provincia_cliente");
	String fecha =request.getParameter("fecha");
	String num_horas = request.getParameter("num_horas");
  
 	int id_moto = Integer.parseInt(request.getParameter("id_moto"));
	int hora_inicio = Integer.parseInt(request.getParameter("hora_inicio"));
	int hora_final = hora_inicio+Integer.parseInt(num_horas);
	Motos currentmoto = cont.damemotoformidmoto(id_moto);
	double precio_total = currentmoto.getPrecio_hora() * Double.parseDouble(num_horas);
	ArrayList<Alquiler> listalquiledemoto = cont.damealquileresfromidmoto(id_moto);
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
	boolean error = false;
	if (hora_final>20){
		response.sendRedirect("Alquilar_moto2.jsp?id_moto="+id_moto+"&nombre_cliente="+nombre_cliente+"&apellidos_cliente="+apellidos_cliente+"&dni_cliente="+dni_cliente+"&cp_cliente="+cp_cliente+"&provincia_cliente="+provincia_cliente+"&fecha="+fecha+"&num_horas="+num_horas+"&error=true&direccion_cliente="+direccion_cliente);
		error=true;
	}
	for (int i = 0;i<listalquiledemoto.size();i++){
		if (listalquiledemoto.get(i).damesolofecha().equals(fecha)){
			if (hora_inicio<listalquiledemoto.get(i).damehoraentrada()&&hora_final>listalquiledemoto.get(i).damehoraentrada()){
				response.sendRedirect("Alquilar_moto2.jsp?id_moto="+id_moto+"&nombre_cliente="+nombre_cliente+"&apellidos_cliente="+apellidos_cliente+"&dni_cliente="+dni_cliente+"&cp_cliente="+cp_cliente+"&provincia_cliente="+provincia_cliente+"&fecha="+fecha+"&num_horas="+num_horas+"&error=true&direccion_cliente="+direccion_cliente);
				error=true;
			}
		}
	}
	if (error==false) {
		Clientes currentcliente = cont.dameclientefromdni(dni_cliente);
		String myfecha = fecha +" " +hora_inicio+":00:0";
		cont.altaalquiler(id_moto, currentcliente.getId(), myfecha, Integer.parseInt(num_horas), precio_total);
	}
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
        <a href="index.html"><img src="assets/img/logo.png" style="width: 9rem; height:9rem;"></a>
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto colorwhite" href="#hero">Home</a></li>
          <li><a class="nav-link scrollto colorwhite" href="#about">Quienes somos</a></li>
          <li><a class="nav-link scrollto colorwhite" href="#motosagua">Motos de agua</a></li>
          <li><a class="nav-link scrollto colorwhite" href="#clientes">Todos los clientes</a></li>
          <li><a class="nav-link scrollto colorwhite" href="#podiomotos">Motos más alquiladas</a></li>
          <li><a class="nav-link scrollto colorwhite" href="#podioclientes">Mejores clientes</a></li>
          <li><a class="nav-link scrollto colorwhite" href="#contact">Contacto</a></li>
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
            <li><a href="index.html">Home</a></li>
            <li><a href="#"><%=currentmoto.getMarca() %> <%=currentmoto.getModelo() %></a></li>
            <li>Alquilar moto</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">
      	<div style="display: flex; align-items: center; justify-content: center;">
      	<h1><strong>Pedido Realizado con exito</strong></h1>
          </div>
          <h2 style="margin-left:1rem ; color:#ef6603;">Cliente</h2>
          <div style="border:2px solid #ef6603 ; padding: 1rem; border-radius: 20px;">
            <div style="display: flex; ">
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Nombre: <a style="color:#00a690;"><%=nombre_cliente %></a></h4>
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Apellidos: <a style="color:#00a690;"><%=apellidos_cliente %></a></h4>
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Dni: <a style="color:#00a690;"><%=dni_cliente %></a></h4>
            </div>
            <div style="display: flex; margin-top: 1rem;">
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Código Postal: <a style="color:#00a690;"><%=cp_cliente %></a></h4>
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Provincia: <a style="color:#00a690;"><%=provincia_cliente %></a></h4>
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Dirección: <a style="color:#00a690;"><%=direccion_cliente %></a></h4>
            </div>
          </div>
          <h2 style="margin-left:1rem ; color:#ef6603; margin-top: 1rem;">Pedido</h2>
          <div style="border:2px solid #ef6603 ; padding: 1rem; border-radius: 20px;">
            <div style="display: flex; ">
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Fecha: <a style="color:#00a690;"><%=dianombre %> <%=fechaenpartes[2] %> de <%=mes %> del <%=fechaenpartes[0] %></a></h4>
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Numero de horas: <a style="color:#00a690;"><%=num_horas %></a></h4>
            </div>
            <div style="display: flex; align-items: center; margin-top: 1rem;">
            <h4 style="margin-right:1rem; margin-top: 0.5rem;">Precio por hora: </h4> <strong style="font-size: 40px !important; color: #00a690; margin-right:2rem;"><%=currentmoto.getPrecio_hora() %>&euro;</strong>
             <h4 style="margin-right:1rem; margin-top: 0.5rem;">Moto seleccionada:</h4>
             <div style="display:flex ; flex-direction:column; margin-right: 1rem; align-items: center;">
              <img src="assets/img/motos/<%=currentmoto.getId() %>.png" alt="" style="width: 120px; height: 100px; ">
              <p style="color:#00a690;"><%=currentmoto.getMarca() %> <%=currentmoto.getModelo() %></p>
             </div>
            </div>
            <div style="display: flex; align-items: center;">
              <h4 style="margin-right: 2rem; margin-top: 0.6rem;">Hora de inicio: <a style="color:#00a690;"><%=hora_inicio %>:00</a></h4>
              <h4 style="margin-right:1rem; margin-top: 0.6rem;">Precio total: </h4> <strong style="font-size: 40px !important; color: #00a690; margin-right:2rem;"><%=precio_total %>&euro;</strong>
            </div>
          </div>
      </div>
    </section><!-- End Portfolio Details Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <a href="index.html"><img src="assets/img/logo.png" style="width: 8rem; height:5rem;"></a>
      <p style="margin-top: 1rem; margin-bottom: 0.5rem;">Alquiler de motos de agua en Elche.</p>
      <a href="#" class="colororange">Entrar como administrador</a>
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