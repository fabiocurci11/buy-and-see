<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="index.css" type="text/css">
<%
	Boolean log=false;
	log = (Boolean)session.getAttribute("login");
	System.out.println("log attribute:" + log);
	
%>

<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
        <div class="container" id="container_mod_nav">
          <a href="<%=response.encodeURL("index.jsp")%>" class="navbar-brand font-weight-bold">Home</a>
          <button type="button" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbars" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler">
                    <span class="navbar-toggler-icon"></span>
                </button>
      
      
          <div id="navbarContent" class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
              <!-- Level one dropdown -->
              <li class="nav-item dropdown">
                <a id="dropdownMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Sfoglia Catalogo</a>
                <ul aria-labelledby="dropdownMenu1" class="dropdown-menu border-0 shadow">
                  <li><a href="#" class="dropdown-item">Per Anno</a></li>
                  <li><a href="#" class="dropdown-item">Per tutti i Film</a></li>
                  <li><a href="novita.jsp" class="dropdown-item">Per Sezione novità </a></li>
      
                  <li class="dropdown-divider"></li>
                  <!-- Level two dropdown-->
                  <li class="dropdown-submenu">
                    <a id="dropdownMenu2" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-item dropdown-toggle">Per Genere</a>
                    <ul aria-labelledby="dropdownMenu2" class="dropdown-menu border-0 shadow">

                      <li><a tabindex="-1" href="#" class="dropdown-item">Horror</a></li>
                      <li><a tabindex="-1" href="#" class="dropdown-item">Comico</a></li>
                      <li><a href="#" class="dropdown-item">Thriller</a></li>
                      <li><a href="#" class="dropdown-item">level 2</a></li>
                    </ul>
                  </li>
                  <!-- End Level two -->
                </ul>
              </li>
              <!-- End Level one -->

           
    	<form class="form-inline my-2 my-lg-0">
      		<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    	</form>
    	
    	<%System.out.println("#@log: " + log);%>
    	
    	<%if((log == null) || log.equals(false)) {%>
    	<%}else{%>
    		<ul class="navbar-nav" id="nav_profilo">
      			<li class="nav-item">
      				<a class="nav-link" href="profilo.jsp">Profilo</a>
      			</li>
      		</ul>  
    	<%}%>
    	
    	<ul class="navbar-nav" id="nav_login_logout">
      		<li class="nav-item">
      			<%if((log == null) || log.equals(false)) {%>
        			<a class="nav-link" href="login.jsp">Login</a>
        		<%}else{%>					<!-- se utente fa login --> 
   				 	<a class="nav-link" href="Utente_Logout" >Logout</a>
   				 <%} %>
      		</li>
      	</ul>   	
      

          </div>
        </div>
</nav>



<script>

$('.dropdown-submenu > a').on("click", function(e) {
    var submenu = $(this);
    $('.dropdown-submenu .dropdown-menu').removeClass('show');
    submenu.next('.dropdown-menu').addClass('show');
    e.stopPropagation();
});

$('.dropdown').on("hidden.bs.dropdown", function() {
    // hide any open menus when parent closes
    $('.dropdown-menu.show').removeClass('show');
});



</script>

	
<div class="container-fluid p-3 my-3 text-white">