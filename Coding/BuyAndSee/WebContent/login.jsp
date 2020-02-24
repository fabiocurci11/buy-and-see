<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head> 
<body>

<%@include  file="indexTEMPLATE2.jsp" %> 
<LINK rel="stylesheet" href="login.css" type="text/css">	
 


<% Boolean reg_ok = (Boolean) request.getAttribute("reg_ok"); System.out.println("@@@ reg_ok = "+reg_ok);%> 
<% UtenteBean ub = (UtenteBean) request.getAttribute("utenteBean");%> 
<% Boolean bad = (Boolean) request.getAttribute("denied");%> 
<% Boolean log_for_buy = (Boolean) request.getAttribute("log_for_buy");  System.out.println("LOG_FOR_BUY = "+log_for_buy);%> 
<% String url=response.encodeUrl(session.getId());%>

<h1 id="h1_page">LOGIN</h1>

<!-- registrazione effettuata con successo -->
<% if (reg_ok != null && reg_ok == true) { %>
			<!-- <h2 style="margin-left: 39%; color: #2c8943;">Registrazione avvenuta!<br><%= ub.getNome()%> effettua il login </h2> -->
			<h3 style="color: green;"class="message_succ_fail">Registrazione effettuata con successo!<br>Effettua il login</h3>
<% }%> 


<!-- login fallito -->
<% if (bad != null) { %>
			<!-- <h2 style="margin-left: 39%;">ACCESSO NEGATO <br> Login e password errati</h2>  -->
			<h3 style="color: red;"class="message_succ_fail">ACCESSO NEGATO <br> Login e password errati</h3>	
<% }%> 

<% if (log_for_buy != null && log_for_buy == false ) { %>
			<!-- <h2 style="margin-left: 39%;">ACCESSO NEGATO <br> Login e password errati</h2>  -->
			<h3 style="color: red;"class="message_succ_fail">Effettua login per acquistare</h3>	
<% }%> 

<div class="container" id="container_mod">
 	<h2 id="h2_form_login">Login</h2> 
 	<form method="post" action= "<%=response.encodeURL("Utente_login")%>" name="formLogin" id="myform">
  	
    	<div class="form-group">
      		<label for="email">Username:</label>
      		<input type="text" class="form-control" id="username" placeholder="Inserisci Username" name="username" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="pwd">Password:</label>
      		<input type="password" class="form-control" id="password" placeholder="Inserisci Password" name="password" style="width:70%;">
    	</div>
    
    	<button type="submit" class="btn btn-primary" id="button_login">Login</button> 
 	 </form>
  
  
  <div id="recupero_e_reg">
  	<p style="margin-bottom: 0px;">Password dimenticata?</p>
  	<a  href="#">Recupera Password</a>
  	<br>
  	<p style="margin-top: 50px;">Non sei ancora registrato?</p>
  	<button type="submit" class="btn btn-primary" id="button_login" style="left:0%;">
    <a href="registrazione.jsp" style="color: white;text-decoration: none;">Registrati</a></button> 
  </div>
</div>

</div> <!-- chiusura div TEMPLATE -->

</body>
</html>


<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



<!-- 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 -->