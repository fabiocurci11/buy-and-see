<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head> 
<body>
<%@include  file="indexTEMPLATE.html" %> 
<LINK rel="stylesheet" href="login.css" type="text/css">		
 
<h1 id="h1_page">LOGIN</h1>

<div class="container">
  <h2 id="h2_form_login">Login</h2> 
  <form action="/action_page.php" id="myform">
    <div class="form-group">
      <label for="email">Username:</label>
      <input type="username" class="form-control" id="username" placeholder="Inserisci Username" name="username" style="width:70%;">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Inserisci Password" name="pswd" style="width:70%;">
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


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>