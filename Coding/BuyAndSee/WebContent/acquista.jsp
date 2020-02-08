<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<meta charset="ISO-8859-1">
<title>Acquisto Film</title> 
</head>
<body>

<%@include  file="indexTEMPLATE.jsp" %> 		

 <LINK rel="stylesheet" href="info_film.css" type="text/css">
 

<h1 id="h1_page">ACQUISTA FILM</h1>
<LINK rel="stylesheet" href="login.css" type="text/css">	
<div class="container">
 	<h2 id="h2_form_login">Acquista Film</h2> 
 	<form method="post" action= "Utente_login" name="formLogin" id="myform">
  	
    	<div class="form-group">
      		<label for="email">Nome intestatario:</label>
      		<input type="text" class="form-control" id="username" placeholder="Inserisci Username" name="username" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="pwd">Cognome intestatario:</label>
      		<input type="password" class="form-control" id="password" placeholder="Inserisci Password" name="password" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="email">Numero carta:</label>
      		<input type="text" class="form-control" id="username" placeholder="Inserisci Username" name="username" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="pwd">Scadenza carta:</label>
      		<input type="password" class="form-control" id="password" placeholder="Inserisci Password" name="password" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="pwd">Codice di sicurezza:</label>
      		<input type="password" class="form-control" id="password" placeholder="Inserisci Password" name="password" style="width:70%;">
    	</div>
    
    	<button type="submit" class="btn btn-primary" id="button_login">Acquista</button>
 	 </form>
  
  
</div>
	
	

</div> <!-- chiusura div TEMPLATE -->
</body>
</html>