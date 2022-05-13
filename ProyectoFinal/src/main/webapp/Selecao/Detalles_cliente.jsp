<%@ page import="tiendamotos.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<%
	BDController cont = new BDController();
	String id_cliente = request.getParameter("id_cliente");
	Clientes currentcliente = cont.dameclientefromid(Integer.parseInt(id_cliente));
	%>
  <title>Detalles - <%=currentcliente.getNombre() %> <%=currentcliente.getApellidos() %></title>
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
          <h1 style="font-size: 2rem; font-weight: bold;">Detalles del cliente</h1>
          <ol>
            <li><a href="index.jsp">Home</a></li>
            <li><%=currentcliente.getNombre() %> <%=currentcliente.getApellidos() %></li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-6">
            <div class="portfolio-details-slider swiper">
              <div class="align-items-center">

                <div class="swiper-slide " style="display: flex;align-items: center;justify-content: center;">
                  <img class="imagenclientespodio" src="assets/img/clientes/<%=currentcliente.getId() %>.png" alt="" style="border: 7px solid #ef6603; width: 356px; height: 365px; ">
                </div>
              </div>
              <div class="swiper-pagination"></div>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="portfolio-info detalles" style="align-items: start;">
              <h2><%=currentcliente.getNombre() %> <%=currentcliente.getApellidos() %></h2>
              <ul>
                <li><strong>DNI</strong>: <%=currentcliente.getDni() %></li>
                <li><strong>Dirección</strong>: <%=currentcliente.getDireccion() %></li>
                <li><strong>Código postal</strong>: <%=currentcliente.getCp() %></li>
                <li><strong>Provincia</strong>: <%=currentcliente.getProvincia() %></li>
                
              </ul>
            </div>
          </div>
          <div class="portfolio-description" style="display: flex;flex-direction: column;align-items: center;">
            <h2>Historial de alquileres</h2>
            <table class="roundedCorners" style="display: flex;">
              <tr>
                <th>Moto</th>
                <th>Marca</th>
                <th>Modelo</th>
                <th>Matricula</th>
                <th>Fecha_hora</th>
                <th>Numero de horas</th>
                <th>Precio total</th>
              </tr>
              <%
              ArrayList<Alquiler> listalquiler_cliente = cont.damealquileresfromidcliente(currentcliente.getId());
              for (int i = 0;i<listalquiler_cliente.size();i++){
            	  Motos currentalquilermoto = cont.damemotoformidmoto(listalquiler_cliente.get(i).getId_moto());
              %>
              <tr>
                <td><img src="assets/img/motos/<%=listalquiler_cliente.get(i).getId_moto()%>.png" alt="" style="with:100px; height:100px;"></td>
                <td><%=currentalquilermoto.getMarca() %></td>
                <td><%=currentalquilermoto.getModelo() %></td>
                <td><%=currentalquilermoto.getMatricula() %></td>
                <td><%=listalquiler_cliente.get(i).getFecha() %></td>
                <td><%=listalquiler_cliente.get(i).getNum_horas() %></td>
                <td><%=listalquiler_cliente.get(i).getPrecio_total() %>&euro;</td>
              </tr>
              <%} %>
            </table>
          </div>

        </div>

      </div>
    </section><!-- End Portfolio Details Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <a href="index.jsp"><img src="assets/img/logo.png" style="width: 8rem; height:5rem;"></a>
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

</body>

</html>