<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- <script src="scriptJQ/jquery.js"></script>  -->
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head> 
<body>
<%@include  file="indexTEMPLATE2.jsp" %> 
<LINK rel="stylesheet" href="login.css" type="text/css">
 
 
<h1 id="h1_page">Registrazione</h1>

<% Integer i= (Integer) request.getAttribute("attr");System.out.println("@@@ i="+i);%>

<% if (i != null && i == -1) { %>
			<h2 style="margin-left: 39%; color: red;">Username già utilizzata!<br>Riprova </h2>
		<% } else if (i != null && i == -2){%> 
			<h2 style="margin-left: 39%; color: red;">Email già utilizzata!<br>Riprova </h2>
		<% } %> 

<div class="container" id="container_mod">
  <h2 id="h2_form_login">Registrazione</h2> 
  <!-- <form action="/action_page.php" id="myform"> -->
  <form method="post" action="Utente_registrazione" name="formReg" onsubmit="return validateFormReg()" id="form_reg" >
  
    <div class="form-group">
   		<label for="name">Nome:</label>
      	<input type="text" class="form-control" id="nome" placeholder="Inserisci Nome" name="nome" style="width:70%;" required/>
    </div>
    
    <div class="form-group">
      	<label for="pwd">Cognome:</label>
      	<input type="text" class="form-control" id="cognome" placeholder="Inserisci Cognome" name="cognome" style="width:70%;" required/>
    </div>
    
    <div class="form-group">
      	<label for="pwd">Username:</label>
      	<input type="text" class="form-control" id="username" placeholder="Inserisci Username" name="username" style="width:70%;" required/>
    </div>
    
    <div class="form-group">
      	<label for="pwd">Email:</label>
      	<input type="text" class="form-control" id="email" placeholder="Inserisci Email" name="email" style="width:70%;" required/>
    </div>
    
    <div class="form-group">
      	<label for="pwd">Password:</label>
      	<input type="password" class="form-control" id="password" placeholder="Inserisci Password" name="password" style="width:70%;" required/>
    </div>
    
    <input type="submit" value="Registrati" class="btn btn-primary" id="button_login"/>
    
  </form>
 
</div>

</div> <!-- chiusura div TEMPLATE -->



<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="scriptJQ/jquery.js"></script>

<script>
function validateFormReg() {
    var form = document.forms["formReg"];
    var nome=formReg.nome;
    var cognome=formReg.cognome;
    var email=formReg.email;
    var username=formReg.username;
    var password=formReg.password;
	
    if(!validateNomeReg(nome))
        return false;
    if(!validateCognomeReg(cognome))
        return false;
    if(!validateUsernameReg(username))
        return false;
    if(!validateEmailReg(email))
        return false;
	if(!validatePasswordReg(password))
        return false;
}

function validateNomeReg(nome){
	//alert("validiamo: " + nome);
	var letters = /^[a-zA-Z]{3,20}$/; //qualsiasi lettera dell'alfabeto di lunghezza minimo 3 max 20 caratteri
	if(nome.value.match(letters)){
		//alert("nome ok");
		nome.style.border = "2px solid green";
		return true;
	}
	
	else{
		//alert("nome sbagliato");
		nome.focus();
		nome.style.border = "2px solid #f50000";
		return false;
	}
}

function validateCognomeReg(cognome){
	//alert("validiamo: "+cognome);
	var letters = /^[a-zA-Z]{3,20}$/; //qualsiasi lettera dell'alfabeto di lunghezza minimo 3 max 20 caratteri
	if(cognome.value.match(letters)){
		//alert("cognome ok");
		cognome.style.border = "2px solid green";
		return true;
	}
	
	else{
		//alert("cognome sbagliato");
		cognome.focus();
		cognome.style.border = "2px solid #f50000";
		return false;
	}
}

function validateUsernameReg(usr){
	//alert("validiamo: " + usr);
	var letters = /^[A-Za-z0-9._]{4,10}$/; //può contenere[qualsiasi lettera dell'alfabeto, cifre da 0 a 9, un punto e un tratto basso] di lunghezza minimo 4 max 10 caratteri
	if(usr.value.match(letters)){
		//alert("usr ok");
		usr.style.border = "2px solid green";
		return true;
	}
	
	else{
		//alert("Username deve contenere da 4 a 10 caratteri alfanumerici o _ o .");
		usr.focus();
		usr.style.border = "2px solid #f50000";
		return false;
	}
}

function validateEmailReg(email){
	//alert("validiamo: " + email);
	//var letters = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w+)+$/;
	var letters = /[^@\s]+@[^\.\s]+\.[a-zA-Z]+$/;  
	
	if(email.value.match(letters)){
		//alert("email ok");
		email.style.border = "2px solid green";
		return true;
	}
	
	else{
		alert("email scorretta");
		//email.focus();
		email.style.border = "2px solid #f50000";
		return false;
	}
}

function validatePasswordReg(psw){
	//alert("validiamo: " + psw);
	var letters = /^(\S){5,15}$/; //può contenere (tutto tranne spazi), lunghezza minimo 5 max 15 caratteri
	if(psw.value.match(letters)){
		//alert("psw ok");
		psw.style.borderColor = "green";
		return true;
	}
	
	else{
		//alert("La password deve essere da 5 a 15 caratteri e senza spazi");
		psw.focus();
		psw.style.border = "2px solid #f50000";
		return false;
	}
}



</script>



</body>
</html>
