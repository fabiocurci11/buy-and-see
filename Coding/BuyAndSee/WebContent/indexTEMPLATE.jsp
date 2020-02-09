<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<script src="scriptJQ/jquery.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="scriptJQ/jquery.js"></script>  -->
<LINK rel="stylesheet" href="index.css" type="text/css">

<%
	Boolean log=false;
	log = (Boolean)session.getAttribute("login");
%>

<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">

	<div class="collapse navbar-collapse" id="navbarSupportedContent" >
    	<ul class="navbar-nav mr-auto">
      		<li class="nav-item">
        		<a class="nav-link" href="index.jsp">Home</a>
      		</li>
      		
      		<li class="nav-item dropdown" id="sh2">
        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Sfoglia Catalogo	</a>
	        	<div class="dropdown-menu bg-dark" aria-labelledby="navbarDropdownMenuLink" id="sh3">
	          		<a class="dropdown-item text-white" href="#">Per Anno</a>
	          		<a class="dropdown-item text-white" href="#">Per Tutti i Film</a>
	          		<a class="dropdown-item text-white" href="#">Per Sezione Novità</a>
	          		
	          		<a class="dropdown-item text-white btn" >Per Genere</a>
	          	
	          		<div id="collapseExample" >
  						<a class="dropdown-item text-white" href="#">Horro</a>
	          			<a class="dropdown-item text-white" href="#">Comico</a>
	          		</div>
	          		
	
				</div>
     		 </li>
     		
    	</ul>
    	
    </div>
    	
    	<form class="form-inline my-2 my-lg-0">
      		<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    	</form>
    	
    	<%System.out.println("#@log: " + log);%>
    	
    	<%if((log == null) || log.equals(false)) {%>
    	<%}else{%>
    		<ul class="navbar-nav">
      			<li class="nav-item">
      				<a class="nav-link" href="profilo.jsp">Profilo</a>
      			</li>
      		</ul>  
    	<%}%>
    	
    	<ul class="navbar-nav">
      		<li class="nav-item">
      			<%if((log == null) || log.equals(false)) {%>
        			<a class="nav-link" href="login.jsp">Login</a>
        		<%}else{%>					<!-- se utente fa login --> 
   				 	<a class="nav-link" href="Utente_Logout">Logout</a>
   				 <%} %>
      		</li>
      	</ul>   	
  	
</nav>  


<div class="container-fluid p-3 my-3 text-white">

