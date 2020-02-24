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
 	
 	 <form method="post" action="<%=response.encodeURL("Acquisto_film")%>"  name="formAcq" onsubmit="return validateFormAcq()" id="myform" >
  	
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
      		<input type="text" class="form-control" id="numeroCarta" placeholder="Inserisci numero carta" name="numero" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="pwd">Scadenza carta:</label>
      		<input type="text" class="form-control" id="scadenzaCarta" placeholder="Inserisci scadenza carta" name="scadenza" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="pwd">Codice di sicurezza:</label>
      		<input type="password" class="form-control" id="codiceSicurezza" placeholder="Inserisci codice di sicurezza" name="codice" style="width:70%;">
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

<script>
function validateFormAcq() {
    var form = document.forms["formAcq"];
    var nome=formAcq.nome;
    var cognome=formAcq.cognome;
    var numero=formAcq.numero;
    var scadenza=formAcq.scadenza;
    var codice=formAcq.codice;
	
    if(!validateNomeAcq(nome))
        return false;
    if(!validateCognomeAcq(cognome))
        return false;
    if(!validateNumeroAcq(numero))
        return false;
    if(!validateScadenzaAcq(scadenza))
        return false;
	if(!validateCodiceAcq(codice))
        return false;
}

function validateNomeAcq(nome){
	//alert("validiamo: " + nome);
	var letters = /^[a-zA-Z]{3,20}$/; //qualsiasi lettera dell'alfabeto di lunghezza minimo 3 max 20 caratteri
	if(nome.value.match(letters)){
		//alert("nome ok");
		nome.style.border = "2px solid green";
		return true;
	}
	
	else{
		alert("nome sbagliato");
		nome.focus();
		nome.style.border = "2px solid #f50000";
		return false;
	}
}

function validateCognomeAcq(cognome){
	//alert("validiamo: "+cognome);
	var letters = /^[a-zA-Z]{3,20}$/; //qualsiasi lettera dell'alfabeto di lunghezza minimo 3 max 20 caratteri
	if(cognome.value.match(letters)){
		//alert("cognome ok");
		cognome.style.border = "2px solid green";
		return true;
	}
	
	else{
		alert("cognome sbagliato");
		cognome.focus();
		cognome.style.border = "2px solid #f50000";
		return false;
	}
}

function validateScadenzaAcq(scadenza){
	//alert("validiamo: " + usr);
	var letters = /^\d{2}\/\d{2}\/\d{2}$/; //può contenere[qualsiasi lettera dell'alfabeto, cifre da 0 a 9, un punto e un tratto basso] di lunghezza minimo 4 max 10 caratteri
	if(scadenza.value.match(letters)){
		//alert("usr ok");
		scadenza.style.border = "2px solid green";
		return true;
	}
	
	else{
		//alert("Username deve contenere da 4 a 10 caratteri alfanumerici o _ o .");
		alert("data scadenza non corretta");
		scadenza.focus();
		scadenza.style.border = "2px solid #f50000";
		return false;
	}
}

function validateNumeroAcq(numero){
	//alert("validiamo: " + email);
	//var letters = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w+)+$/;
	var letters = /^[0-9]{16}$/;   
	
	if(numero.value.match(letters)){
		//alert("email ok");
		numero.style.border = "2px solid green";
		return true;
	}
	
	else{
		alert("numero carta scorretto");
		//email.focus();
		numero.style.border = "2px solid #f50000";
		return false;
	}
}

function validateCodiceAcq(codice){
	//alert("validiamo: " + psw);
	var letters = /^[0-9]{3,5}$/; //può contenere (tutto tranne spazi), lunghezza minimo 5 max 15 caratteri
	if(codice.value.match(letters)){
		//alert("psw ok");
		codice.style.borderColor = "green";
		return true;
	}
	
	else{
		alert("codice scorretto");
		//alert("La password deve essere da 5 a 15 caratteri e senza spazi");
		codice.focus();
		codice.style.border = "2px solid #f50000";
		return false;
	}
}


</script>