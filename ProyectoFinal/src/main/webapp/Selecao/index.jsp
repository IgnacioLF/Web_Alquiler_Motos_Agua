<%@ page import="tiendamotos.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Elche Motos -Alquiler de motos de agua</title>
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

  <!-- =======================================================
  * Template Name: Selecao - v4.7.0
  * Template URL: https://bootstrapmade.com/selecao-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center  header-transparent ">
    <div class="container d-flex align-items-center myjustifycontentbetwen">

      <div class="logo">
        <a href="index.html"><img src="assets/img/logo.png" style="width: 9rem; height:9rem;"></a>
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="#about">Quienes somos</a></li>
          <li><a class="nav-link scrollto" href="#motosagua">Motos de agua</a></li>
          <li><a class="nav-link scrollto" href="#clientes">Todos los clientes</a></li>
          <li><a class="nav-link scrollto" href="#podiomotos">Motos más alquiladas</a></li>
          <li><a class="nav-link scrollto" href="#podioclientes">Mejores clientes</a></li>
          <li><a class="nav-link scrollto" href="#contact">Contacto</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex flex-column justify-content-end align-items-center" style="background-image: url('motohead2.jpg'); background-size: cover;">
    <div id="heroCarousel" data-bs-interval="5000" class="container carousel carousel-fade" data-bs-ride="carousel">
      <!-- Slide 1 -->
      <div class="carousel-item active">
        <div class="carousel-container">
          <img class="imagencentrallogo" src="assets/img/logo.png">
          <span style="height: 10rem;"> </span>
        </div>
      </div>
    </div>

    <svg class="hero-waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28 " preserveAspectRatio="none">
      <defs>
        <path id="wave-path" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z">
      </defs>
      <g class="wave1">
        <use xlink:href="#wave-path" x="50" y="3" fill="rgba(255,255,255, .3)">
      </g>
      <g class="wave2">
        <use xlink:href="#wave-path" x="50" y="0" fill="rgba(255,255,255, .5)">
      </g>
      <g class="wave3">
        <use xlink:href="#wave-path" x="50" y="9" fill="#fff">
      </g>
    </svg>

  </section><!-- End Hero -->

  <main id="main">
<%BDController cont = new BDController(); %>
    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="section-title" data-aos="zoom-out">
          <h2>Sobre Nosotros</h2>
          <p>Quienes somos</p>
        </div>

        <div class="row content" data-aos="fade-up">
          <div class="col-lg-6">
            <p>
              Somos una empresa que se dedica al alquiler de motos acuatias en la zona de  ????.
              Realizando esta actividad podras:
            </p>
            <ul>
              <li><i class="ri-check-double-line"></i> Observar la naturaleza marina</li>
              <li><i class="ri-check-double-line"></i> Pasar un buen rato con familiares o amigos</li>
              <li><i class="ri-check-double-line"></i> liberación de estrés</li>
            </ul>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0">
            <p>
              todo(MAPA DE LA ZONA)
            </p>
            <a href="#" class="btn-learn-more">Learn More</a>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->

    <!-- ======= Motos de agua Section ======= -->
    <section id="motosagua" class="testimonials">
      <div class="container">

        <div class="section-title" data-aos="zoom-out">
          <h2>Motos</h2>
          <p>Nuestras Motos de agua</p>
        </div>
        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">
            <!-- Start moto item -->
       		<%
				ArrayList<Motos> listmotos = cont.damemotos();
				for (int i = 0;i<listmotos.size();i++){
			%>
            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="assets/img/motos/<%=listmotos.get(i).getId()%>.png"  alt="" style="width: 200px;">
                <h3><%=listmotos.get(i).getMarca()%></h3>
                <h4 style="margin-bottom: 1rem;"><%=listmotos.get(i).getModelo()%></h4>
                <h4 class="motosaguaprecio"><sup class="motosaguaeuros">&euro;</sup><%=listmotos.get(i).getPrecio_hora()%><span class="motoaguahoras"> / Hora</span></h4>
                <a href="#" class="btn-verdetalles" >Ver detalles</a>
              </div>
            </div>
            <%} %>
            <!-- End moto item -->
          </div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </section>
    <!-- End motos de agua Section -->


<!-- ======= clientes Section ======= -->
<section id="clientes" class="testimonials">
  <div class="container">

    <div class="section-title" data-aos="zoom-out">
      <h2>Clientes</h2>
      <p>Todos nuestros clientes</p>
    </div>
    <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
      <div class="swiper-wrapper">
        <!-- Start cliente item -->
        <%
        ArrayList<Clientes> listclientes = cont.dameclientes();
        for (int i = 0;i<listclientes.size();i++){
        %>
        <div class="swiper-slide">
          <div class="testimonial-item">
            <img src="assets/img/clientes/<%=listclientes.get(i).getId()%>.png" class="testimonial-img" alt="" style="width: 200px;">
            <h3 style="margin-top: 1.5rem;"><%=listclientes.get(i).getNombre()%></h3>
            <h4 style="margin-bottom: 1.5rem;"><%=listclientes.get(i).getApellidos()%></h4>
            <a href="#" class="btn-verdetalles" >Ver más</a>
          </div>
        </div>
        <%} %>
        <!-- End cliente item -->
      </div>
      <div class="swiper-pagination"></div>
    </div>
  </div>
</section>
<!-- End cliente Section -->


<!-- podio motos-->
<section id="podiomotos" class="podiomotos" >
  <div class="container">
    <div class="section-title" data-aos="zoom-out">
      <h2>Motos más alquiladas</h2>
      <p>Nuestras motos más alquiladas</p>
    </div>
    <%
   	Motos top1moto = cont.damemotoformidmoto(cont.dametop1mot());
    Motos top2moto = cont.damemotoformidmoto(cont.dametop2mot());
    Motos top3moto = cont.damemotoformidmoto(cont.dametop3mot());
    %>
    <div class="cards" style="margin-top: 3rem;">
      <div class="card silver shadow">
        <ul>
          <img src="assets/img/motos/<%=top2moto.getId()%>.png"  alt="" style="width: 200px;">
          <li class="pack marca"><%=top2moto.getMarca() %></li>
          <li class="pack modelo bottom-bar"><%=top2moto.getModelo() %></li>
          <li class="bottom-bar">Matricula : <%=top2moto.getMatricula() %></li>
          <li class="bottom-bar">Horas Alquilada : <%=cont.dametotalhorasalquilerfromid_moto(top2moto.getId()) %></li>
          <li><a href="#" class="btn-verdetalles-podio" >Ver detalles</a></li>
        </ul>
      </div>
      <div class="card gold">
        <ul>
          <img src="assets/img/motos/<%=top1moto.getId()%>.png"  alt="" style="width: 200px;">
          <li class="pack marca"><%=top1moto.getMarca() %></li>
          <li class="pack modelo bottom-bar"><%=top1moto.getModelo() %></li>
          <li class="bottom-bar">Matricula : <%=top1moto.getMatricula() %></li>
          <li class="bottom-bar">Horas Alquilada : <%=cont.dametotalhorasalquilerfromid_moto(top1moto.getId()) %></li>
          <li><a href="#" class="btn-verdetalles-podio" >Ver detalles</a></li>
        </ul>
      </div>
      <div class="card bronce shadow">
        <ul>
          <img src="assets/img/motos/<%=top3moto.getId()%>.png"  alt="" style="width: 200px;">
          <li class="pack marca"><%=top3moto.getMarca() %></li>
          <li class="pack modelo bottom-bar"><%=top3moto.getModelo() %></li>
          <li class="bottom-bar">Matricula : <%=top3moto.getMatricula() %></li>
          <li class="bottom-bar">Horas Alquilada : <%=cont.dametotalhorasalquilerfromid_moto(top3moto.getId()) %></li>
          <li><a href="#" class="btn-verdetalles-podio" >Ver detalles</a></li>
        </ul>
      </div>
    </div>
  </div>
</section>
<!-- End podio motos-->

<!-- podio clientes-->
<section id="podioclientes" class="podioclientes" >
  <div class="container">
    <div class="section-title" data-aos="zoom-out">
      <h2>Mejores clientes</h2>
      <p>Nuestros mejores clientes</p>
    </div>
    <%
    Clientes top1cliente = cont.dameclientefromid(cont.dametop1cliente());
    Clientes top2cliente = cont.dameclientefromid(cont.dametop2cliente());
    Clientes top3cliente = cont.dameclientefromid(cont.dametop3cliente());
    %>
    <div class="cards" style="margin-top: 3rem;">
      <div class="card silver shadow">
        <ul>
          <img src="assets/img/clientes/<%=top2cliente.getId() %>.png" class="imagenclientespodio" alt="" style="width: 200px;height: 184px;">
          <li class="pack marca"><%=top2cliente.getNombre() %></li>
          <li class="pack modelo bottom-bar"><%=top2cliente.getApellidos() %></li>
          <li class="bottom-bar">Alquileres realizados : <%=cont.dametotalalquilerescliente(top2cliente.getId()) %></li>
          <li><a href="#" class="btn-verdetalles-podio" >Ver mas</a></li>
        </ul>
      </div>
      <div class="card gold">
        <ul>
          <img src="assets/img/clientes/<%=top1cliente.getId() %>.png" class="imagenclientespodio" alt="" style="width: 200px;height: 184px;">
          <li class="pack marca"><%=top1cliente.getNombre() %></li>
          <li class="pack modelo bottom-bar"><%=top1cliente.getApellidos() %></li>
          <li class="bottom-bar">Alquileres realizados : <%=cont.dametotalalquilerescliente(top1cliente.getId()) %></li>
          <li><a href="#" class="btn-verdetalles-podio" >Ver mas</a></li>
        </ul>
      </div>
      <div class="card bronce shadow">
        <ul>
          <img src="assets/img/clientes/<%=top3cliente.getId() %>.png" class="imagenclientespodio" alt="" style="width: 200px;height: 184px;">
          <li class="pack marca"><%=top3cliente.getNombre() %></li>
          <li class="pack modelo bottom-bar"><%=top3cliente.getApellidos() %></li>
          <li class="bottom-bar">Alquileres realizados : <%=cont.dametotalalquilerescliente(top3cliente.getId()) %></li>
          <li><a href="#" class="btn-verdetalles-podio" >Ver mas</a></li>
        </ul>
      </div>
    </div>
  </div>
</section>
<!-- End podio clientes-->
    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container">

        <div class="section-title" data-aos="zoom-out">
          <h2>Contacto</h2>
          <p>Contactanos</p>
        </div>

        <div class="row mt-5">

          <div class="col-lg-4" data-aos="fade-right">
            <div class="info">
              <div class="address">
                <i class="bi bi-geo-alt"></i>
                <h4>Localización:</h4>
                <p>##################</p>
              </div>

              <div class="email">
                <i class="bi bi-envelope"></i>
                <h4>Correo eléctronico:</h4>
                <p>info@example.com</p>
              </div>

              <div class="phone">
                <i class="bi bi-phone"></i>
                <h4>Teléfono:</h4>
                <p>+1 5589 55488 55s</p>
              </div>

            </div>

          </div>

          <div class="col-lg-8 mt-5 mt-lg-0" data-aos="fade-left">

            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Tu nombre" required>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Tu correo electronico" required>
                </div>
              </div>
              <div class="form-group mt-3">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Asunto" required>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="message" rows="5" placeholder="Mensaje" required></textarea>
              </div>
              <div class="my-3">
                <div class="loading">Cargando</div>
                <div class="error-message"></div>
                <div class="sent-message">Tu mensaje ha sido enviado. Gracias!</div>
              </div>
              <div class="text-center"><button type="submit">Enviar Mensaje</button></div>
            </form>

          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <h3>Selecao</h3>
      <p>Et aut eum quis fuga eos sunt ipsa nihil. Labore corporis magni eligendi fuga maxime saepe commodi placeat.</p>
      <div class="social-links">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
      <div class="copyright">
        &copy; Copyright <strong><span>Selecao</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/selecao-bootstrap-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
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