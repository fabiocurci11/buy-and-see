<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<meta charset="ISO-8859-1">
<title>Aggiungi Film</title> 
</head>
<body>

<%@include  file="indexTEMPLATE2.jsp" %> 		

 <LINK rel="stylesheet" href="info_film.css" type="text/css">
 
 
 
<% String idfilm = request.getParameter("idfilm"); System.out.println("####idfilm: "+idfilm);%> 
<% UtenteBean ub = null; %> 
<% ub = (UtenteBean)session.getAttribute("utenteBean"); %> 
<% if(ub != null){System.out.println("username: "+ub.getUsername());}%> 


<h1 id="h1_page">AGGIUNGI FILM</h1>
<LINK rel="stylesheet" href="login.css" type="text/css">	
<div class="container" id="container_mod">
 	<h2 id="h2_form_login">Aggiungi Film</h2> 
 	
 	 <form method="post" action="<%=response.encodeURL("Aggiungi_film")%>"  name="formAdd" onsubmit="return validateFormAdd()" id="myform" >
  	
    	<div class="form-group">
      		<label for="email">Titolo:</label>
      		<input type="text" class="form-control" id="nome" placeholder="Inserisci nome" name="titolo" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
    		<label for="email">Immagine:</label><br>
      		<input type="file" name="immagine">
    	</div>
    	
    	<div class="form-group">
      		<label for="email">Anno uscita:</label>
      		<input type="text" class="form-control"  placeholder="Inserisci Anno uscita" name="annoUscita" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="pwd">Durata:</label>
      		<input type="text" class="form-control"  placeholder="Inserisci Durata" name="durata" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="pwd">Genere:</label>
      		<input type="text" class="form-control"  placeholder="Inserisci Genere" name="genere" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="pwd">Lingua:</label>
      		<input type="text" class="form-control"  placeholder="Inserisci codice di Lingua" name="lingua" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="pwd">Descrizione:</label>
      		<input type="text" class="form-control" placeholder="Inserisci Descrizione" name="descrizione" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="pwd">Trailer:</label>
      		<input type="text" class="form-control"  placeholder="Inserisci Trailer" name="trailer" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="pwd">Prezzo:</label>
      		<input type="text" class="form-control"  placeholder="Inserisci Prezzo" name="prezzo" style="width:70%;">
    	</div>
    	
    	<div class="form-group">
      		<label for="email">File:</label><br>
      		<input type="file" name="file">
      		<!--  
      		<div class="custom-file" class="form-group" style="width: 87%;">
			    <input type="file" class="custom-file-input" id="inputGroupFile01" name="file"><br>
			    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
 			 </div>
 			 -->
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

function validateFormAdd() {
	alert("in validation");
    var form = document.forms["formAdd"];
    var titolo=formAdd.nome;
    var immagine=formAdd.immagine;
    var annoUscita=formAdd.annoUscita;
    var durata=formAdd.durata;
    var genere=formAdd.genere;
    var lingua=formAdd.lingua;
    var descrizione=formAdd.descrizione;
    var trailer=formAdd.trailer;
    var prezzo=formAdd.prezzo;
    var file=formAdd.file;
    
	
    if(!validateTitoloAdd(titolo))
        return false;
    if(!validateImmagineAdd(immagine))
        return false;
    if(!validateAnnoUscitaAdd(annoUscita))
        return false;
    if(!validateDurataAdd(durata))
        return false;
	if(!validateGenereAdd(genere))
        return false;
	if(!validateLinguaAdd(lingua))
        return false;
	if(!validateDescrizioneAdd(descrizione))
        return false;
	if(!validateTrailerAdd(trailer))
        return false;
	if(!validatePrezzoAdd(prezzo))
        return false;
	if(!validateFileAdd(file))
        return false;
}

function validateTitoloAdd(titolo){
	//alert("validiamo: " + nome);
	var letters = /^[a-zA-Z0-9]{1,45}$/; //qualsiasi lettera dell'alfabeto di lunghezza minimo 3 max 20 caratteri
	if(titolo.value.match(letters)){
		//alert("nome ok");
		titolo.style.border = "2px solid green";
		return true;
	}
	
	else{
		alert("nome sbagliato");
		titolo.focus();
		titolo.style.border = "2px solid #f50000";
		return false;
	}
}

function validateImmagineAdd(immagine){
	alert("img:: "+immagine.value);
	String img_v = immagine.value;
	var letters = /^[a-zA-Z0-9/.]{1,45}$/; //qualsiasi lettera dell'alfabeto di lunghezza minimo 3 max 20 caratteri
	if(img_v.match(letters)){
		//alert("cognome ok");
		immagine.style.border = "2px solid green";
		return true;
	}
	
	else{
		alert("immagine sbagliato");
		immagine.focus();
		immagine.style.border = "2px solid #f50000";
		return false;
	}
}

function validateAnnoUscitaAdd(annoUscita){
	//alert("validiamo: " + usr);
	var letters = /^[0-9]{2,4}$/; //può contenere[qualsiasi lettera dell'alfabeto, cifre da 0 a 9, un punto e un tratto basso] di lunghezza minimo 4 max 10 caratteri
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

function validateDurataAdd(durata){
	//alert("validiamo: " + email);
	//var letters = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w+)+$/;
	var letters = /^[0-9,.]{1,7}$/;   
	
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

function validateGenereAdd(genere){
	//alert("validiamo: " + psw);
	var letters = /^[a-zA-z]{1,45}$/; //può contenere (tutto tranne spazi), lunghezza minimo 5 max 15 caratteri
	if(codice.value.match(letters)){
		//alert("psw ok");
		codice.style.borderColor = "green";
		return true;
	}
	
	else{
		//alert("La password deve essere da 5 a 15 caratteri e senza spazi");
		codice.focus();
		codice.style.border = "2px solid #f50000";
		return false;
	}
}

function validateLinguaAdd(lingua){
	//alert("validiamo: " + psw);
	var letters = /^[a-zA-z]{1,45}$/; //può contenere (tutto tranne spazi), lunghezza minimo 5 max 15 caratteri
	if(codice.value.match(letters)){
		//alert("psw ok");
		codice.style.borderColor = "green";
		return true;
	}
	
	else{
		//alert("La password deve essere da 5 a 15 caratteri e senza spazi");
		codice.focus();
		codice.style.border = "2px solid #f50000";
		return false;
	}
}

function validateDescrizioneAdd(descrizione){
	//alert("validiamo: " + psw);
	var letters = /^.{1,255}$/; //può contenere (tutto tranne spazi), lunghezza minimo 5 max 15 caratteri
	if(codice.value.match(letters)){
		//alert("psw ok");
		codice.style.borderColor = "green";
		return true;
	}
	
	else{
		//alert("La password deve essere da 5 a 15 caratteri e senza spazi");
		codice.focus();
		codice.style.border = "2px solid #f50000";
		return false;
	}
}

function validateTrailerAdd(trailer){
	//alert("validiamo: " + psw);
	var letters = /^[a-zA-Z]{0,5}$/;//può contenere (tutto tranne spazi), lunghezza minimo 5 max 15 caratteri
	if(trailer.value.match(letters)){
		//alert("psw ok");
		trailer.style.borderColor = "green";
		return true;
	}
	
	else{
		//alert("La password deve essere da 5 a 15 caratteri e senza spazi");
		trailer.focus();
		trailer.style.border = "2px solid #f50000";
		return false;
	}
}

function validatePrezzoAdd(prezzo){
	//alert("validiamo: " + psw);
	var letters = /^[0-9.,]{1,6}$/; //può contenere (tutto tranne spazi), lunghezza minimo 5 max 15 caratteri
	if(codice.value.match(letters)){
		//alert("psw ok");
		codice.style.borderColor = "green";
		return true;
	}
	
	else{
		//alert("La password deve essere da 5 a 15 caratteri e senza spazi");
		codice.focus();
		codice.style.border = "2px solid #f50000";
		return false;
	}
}

function validateFileAdd(file){
	//alert("validiamo: " + psw);
	var letters = /^[a-zA-Z0-9/.]{1,100}$/; //può contenere (tutto tranne spazi), lunghezza minimo 5 max 15 caratteri
	if(codice.value.match(letters)){
		//alert("psw ok");
		codice.style.borderColor = "green";
		return true;
	}
	
	else{
		//alert("La password deve essere da 5 a 15 caratteri e senza spazi");
		codice.focus();
		codice.style.border = "2px solid #f50000";
		return false;
	}
}



</script>