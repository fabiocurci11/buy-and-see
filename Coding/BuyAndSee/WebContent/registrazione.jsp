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
 
<h1 id="h1_page">Registrazione</h1>

<div class="container">
  <h2 id="h2_form_login">Registrazione</h2> 
  <form action="/action_page.php" id="myform">
    <div class="form-group">
      <label for="name">Nome:</label>
      <input type="name" class="form-control" id="username" placeholder="Inserisci Nome" name="username" style="width:70%;">
    </div>
    <div class="form-group">
      <label for="pwd">Cognome:</label>
      <input type="name" class="form-control" id="pwd" placeholder="Inserisci Cognome" name="pswd" style="width:70%;">
    </div>
    
    <div class="form-group">
      <label for="pwd">Username:</label>
      <input type="username" class="form-control" id="pwd" placeholder="Inserisci Username" name="pswd" style="width:70%;">
    </div>
    
    <div class="form-group">
      <label for="pwd">Email:</label>
      <input type="email" class="form-control" id="pwd" placeholder="Inserisci Email" name="pswd" style="width:70%;">
    </div>
    
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Inserisci Password" name="pswd" style="width:70%;">
    </div>
    
    <button type="submit" class="btn btn-primary" id="button_login">Registrati</button>
  </form>
 
</div>

</div> <!-- chiusura div TEMPLATE -->

</body>
</html>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>