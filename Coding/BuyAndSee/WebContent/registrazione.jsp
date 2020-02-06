<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="scriptJQ/jquery.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head> 
<body>
<%@include  file="indexTEMPLATE.jsp" %> 
<LINK rel="stylesheet" href="login.css" type="text/css">
 
 
<h1 id="h1_page">Registrazione</h1>

<% Integer i= (Integer) request.getAttribute("attr");System.out.println("@@@ i="+i);%>

<% if (i != null && i == -1) { %>
			<h2 style="margin-left: 39%; color: red;">Username già utilizzata!<br>Riprova </h2>
		<% } else if (i != null && i == -2){%> 
			<h2 style="margin-left: 39%; color: red;">Email già utilizzata!<br>Riprova </h2>
		<% } %> 

<div class="container">
  <h2 id="h2_form_login">Registrazione</h2> 
  <!-- <form action="/action_page.php" id="myform"> -->
  <form method="post" action="Utente_registrazione" name="formReg" id="myform">
  
    <div class="form-group">
   		<label for="name">Nome:</label>
      	<input type="text" class="form-control" id="nome" placeholder="Inserisci Nome" name="nome" style="width:70%;">
    </div>
    
    <div class="form-group">
      	<label for="pwd">Cognome:</label>
      	<input type="text" class="form-control" id="cognome" placeholder="Inserisci Cognome" name="cognome" style="width:70%;">
    </div>
    
    <div class="form-group">
      	<label for="pwd">Username:</label>
      	<input type="text" class="form-control" id="username" placeholder="Inserisci Username" name="username" style="width:70%;">
    </div>
    
    <div class="form-group">
      	<label for="pwd">Email:</label>
      	<input type="email" class="form-control" id="email" placeholder="Inserisci Email" name="email" style="width:70%;">
    </div>
    
    <div class="form-group">
      	<label for="pwd">Password:</label>
      	<input type="password" class="form-control" id="password" placeholder="Inserisci Password" name="password" style="width:70%;">
    </div>
    
    <button type="submit" class="btn btn-primary" id="button_login">Registrati</button>
  </form>
 
</div>

</div> <!-- chiusura div TEMPLATE -->

</body>
</html>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>