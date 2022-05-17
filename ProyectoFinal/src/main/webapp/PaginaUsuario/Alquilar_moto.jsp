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
	int id_moto = Integer.parseInt(request.getParameter("id_moto"));
	Motos currentmoto = cont.damemotoformidmoto(id_moto);
	%>
  <title>Alquiler - <%=currentmoto.getMarca() %> <%=currentmoto.getModelo() %></title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">
  <link href="assets/css/podiumstyle.css" rel="stylesheet">
</head>
<body>
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
      </nav>
    </div>
  </header>
  <main id="main" style="margin-top:6rem ;">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h1 style="font-size: 2rem; font-weight: bold;">Alquilar Moto</h1>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="Detalles_moto.jsp?id_moto=<%=currentmoto.getId()%>"><%=currentmoto.getMarca() %> <%=currentmoto.getModelo() %></a></li>
            <li>Alquilar</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">
        <form action="Alquilar_moto2.jsp?id_moto=<%=id_moto %>" method="post">
          <%if(request.getParameter("error")!=null){ %>
						<div class="alert background-danger"><em class="fa"></em> <i class="bi bi-exclamation-triangle"></i> Oops, ocurrio un error debe rellenar todos los campos para poder realizar el pedido <i class="bi bi-exclamation-triangle"></i></div>
						<%} %>
		<%if(request.getParameter("error2")!=null){ %>
			<div class="alert background-danger"><em class="fa"></em> <i class="bi bi-exclamation-triangle"></i> Error los datos introducidos no coinciden con los que estan asociados al dni <i class="bi bi-exclamation-triangle"></i></div>
		<%} %>
          <h2 style="margin-left:1rem ; color:#ef6603;">Cliente</h2>
          <div style="border:2px solid #ef6603 ; padding: 1rem; border-radius: 20px;">
            <div style="display: flex; ">
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Nombre:</h4>
              <input style="padding-left:0.5rem ; margin-right:1rem;" type="text"  name="nombre_cliente" id="nombre_cliente" maxlength="9" required>
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Apellidos:</h4>
              <input style="padding-left:0.5rem ; margin-right:1rem;" type="text"  name="apellidos_cliente" id="apellidos_cliente" maxlength="15" required>
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Dni:</h4>
              <input style="padding-left:0.5rem ;" type="text"  name="dni_cliente" id="dni_cliente" maxlength="9" required>
            </div>
            <div style="display: flex; margin-top: 1rem;">
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Código Postal:</h4>
              <input style="padding-left:0.5rem ; margin-right:1rem;" type="number" placeholder="" id="cp_cliente" name="cp_cliente" max="99999" min="1">
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Provincia:</h4>
              <select style="padding-left:0.5rem ; margin-right:1rem;" id="provincia_cliente" name="provincia_cliente">
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
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Dirección:</h4>
              <input style="padding-left:0.5rem ;" type="text"  name="direccion_cliente" id="direccion_cliente" maxlength="15" required>
            </div>
          </div>
          <h2 style="margin-left:1rem ; color:#ef6603; margin-top: 1rem;">Pedido</h2>
          <div style="border:2px solid #ef6603 ; padding: 1rem; border-radius: 20px;">
            <div style="display: flex; ">
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Fecha:</h4>
              <input style="margin-right:1rem ; padding-left:0.5rem ;" type="date" placeholder="00/00/0000" id="fecha" name="fecha" maxlength="10" >
              <h4 style="margin-right:1rem; margin-top: 0.5rem;">Numero de horas:</h4>
              <input style="margin-right:1rem ; padding-left:0.5rem ; "type="number" id="num_horas" name="num_horas" max="9" min="1">
            </div>
            <div style="display: flex; align-items: center; margin-top: 1rem;">
            <h4 style="margin-right:1rem; margin-top: 0.6rem;">Precio por hora: </h4> <strong style="font-size: 40px !important; color: #00a690; margin-right:2rem;"><%=currentmoto.getPrecio_hora() %>&euro;</strong>
             <h4 style="margin-right:1rem; margin-top: 0.6rem;">Moto seleccionada:</h4>
             <div style="display:flex ; flex-direction:column; margin-right: 1rem; align-items: center;">
              <img src="assets/img/motos/<%if (currentmoto.getId()>6){
              out.print("00");
              } else {
            	  out.print(currentmoto.getId());
              }%>.png" alt="" style="width: 120px; height: 100px; ">
              <p><%=currentmoto.getMarca() %> <%=currentmoto.getModelo() %></p>
             </div>
            </div>
          </div>
          <div style="display: flex; align-items: center; justify-content: center;">
           <input type="submit" class="btn-verdetalles" style="padding-top: 0.5rem;padding-bottom: 0.5rem;font-size: 1.7rem;margin-top: 2rem; border: 2px solid #ef6603;" value="Realizar Pedido"></input>
          </div>
        </form>
        
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