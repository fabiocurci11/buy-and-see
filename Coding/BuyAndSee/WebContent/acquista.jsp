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

<%@include  file="indexTEMPLATE2.jsp" %> 		

 <LINK rel="stylesheet" href="info_film.css" type="text/css">
 
 
 
<% String idfilm = request.getParameter("idfilm"); System.out.println("####idfilm: "+idfilm);%> 
<% UtenteBean ub = null; %> 
<% ub = (UtenteBean)session.getAttribute("utenteBean"); %> 
<% if(ub != null){System.out.println("username: "+ub.getUsername());}%> 


<h1 id="h1_page">ACQUISTA FILM</h1>
<LINK rel="stylesheet" href="login.css" type="text/css">	
<div class="container" id="container_mod">
 	<h2 id="h2_form_login">Acquista Film</h2> 
 	
 	 <form method="post" action="<%=response.encodeURL("Acquisto_film")%>"  name="formReg" onsubmit="return validateFormReg()" id="myform" >
  	
    	<div class="form-group">
      		<label for="email">Nome intestatario:</label>
      		<input type="text" class="form-control" id="nome" placeholder="Inserisci nome" name="nome" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="pwd">Cognome intestatario:</label>
      		<input type="text" class="form-control" id="cognome" placeholder="Inserisci cognome" name="cognome" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="email">Numero carta:</label>
      		<input type="text" class="form-control" id="numeroCarta" placeholder="Inserisci numero carta" name="numero_carta" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="pwd">Scadenza carta:</label>
      		<input type="text" class="form-control" id="scadenzaCarta" placeholder="Inserisci scadenza carta" name="scadenza_carta" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="pwd">Codice di sicurezza:</label>
      		<input type="password" class="form-control" id="codiceSicurezza" placeholder="Inserisci codice di sicurezza" name="codice_sicurezza" style="width:70%;">
    	</div>
    	
    	<input class="input_hidden" type="hidden" name="idfilm" value="<%=idfilm%>">
    	<%if(ub != null) { %>
    		<input class="input_hidden" type="hidden" name="username" value="<%=ub.getUsername()%>">
    	<%}%>
    	
    	<button type="submit" class="btn btn-primary" id="button_login">Acquista</button>
 	 </form>
  
  
</div>
	
	

</div> <!-- chiusura div TEMPLATE -->
</body>
</html>