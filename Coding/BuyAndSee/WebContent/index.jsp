<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap CSS 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="index.css" type="text/css">
 -->

</head>
<body>

<%@include  file="indexTEMPLATE2.jsp" %> 

<%
	String tipo_usr = "";
	String gc = "gc";
	UtenteBean ub = null;
	ub = (UtenteBean)session.getAttribute("utenteBean");
	
	if(ub != null){tipo_usr =  ub.getTipo();}
	if(tipo_usr != null){System.out.println("USR_TIPO: " + tipo_usr);}
	
	if(tipo_usr.equals(gc)){ System.out.println("NELL IF DEL TIPO: " + tipo_usr);}
	else{System.out.println("false ");}
%> 


	<h1 id="h1_page">HOME</h1>
	
 	<%%> 

	
	<div id="dislay_all_film">
				
		  		 
	</div>
		
		
	
	  
	 
	  
</div> <!-- chiusura div TEMPLATE -->



</body> 
</html>

<script>
/*
$('.dropdown-submenu > a').on("click", function(e) {
    var submenu = $(this);
    $('.dropdown-submenu .dropdown-menu').removeClass('show');
    submenu.next('.dropdown-menu').addClass('show');
    e.stopPropagation();
});

$('.dropdown').on("hidden.bs.dropdown", function() {
    // hide any open menus when parent closes
    $('.dropdown-menu.show').removeClass('show');
});

*/

//codice dinamico



$(document).ready(function(){
    //alert("ciao");
    $.get("Film_doAll", function(data,status){
    	alert("Data: " + data + "\nStatus: " + status);
    	myFunc(data);
    });
});


function myFunc(jsonData){
	
	var data=JSON.parse(jsonData);
	//alert("post parse");
 	var size_json = Object.keys(data).length; //lunghezza array json
  	var count_column = 0;
 	var j = 0;
 	var j2 = 0;
  	//size_json = 11; 
  	//alert("size: " + size_json);
	for(i=0; i<size_json; i++){
		
		var div_all_film=document.getElementById("dislay_all_film");
		var row_grid = document.createElement("div"); //creo div_scarpa con class=scarpa
		row_grid.setAttribute('class', 'row');
		//alert("in row");
		
		for(j=0; j<=3; j++){
			//alert("" + data[j].titolo);
			
			//alert("tit: " + f.getTitolo());
			//alert("count_column: " + count_column);
			if(count_column == size_json){return;}
			count_column++;
			var col_grid = document.createElement("div"); 
			col_grid.setAttribute('class', 'col-3');
			
			var div_container = document.createElement("div"); //creo div_img con class=img
			div_container.setAttribute('class', 'container');
			
			
			var h2 = document.createElement("h2"); //creo elemento p
			
			var p = document.createElement("p");
			
			var div_card = document.createElement("div"); 
			div_card.setAttribute('class', 'card text-primary');
			div_card.setAttribute('style', 'margin-bottom: 20px');
			
			
			var div_img = document.createElement("div")
			
			var div_card_body = document.createElement("div"); 
			div_card_body.setAttribute('class', 'card-body');
			
			var h4 = document.createElement("h4");
			h4.setAttribute('class', 'card-title');
			
			var p_anno = document.createElement("p");
			p_anno.setAttribute('class', 'p_info_film');
			var p_genere = document.createElement("p");
			p_genere.setAttribute('class', 'p_info_film');
			var p_durata = document.createElement("p");
			p_durata.setAttribute('class', 'p_info_film');
			var p_prezzo = document.createElement("p");
			p_prezzo.setAttribute('class', 'p_info_film');
			//p_card_text.setAttribute('class', 'card-text-black');
			
			<%! FilmBean f = new FilmBean("titobo"); //System.out.println("###f: "+f.getTitolo());%>
			
			//<form method="post" action="Utente_registrazione" name="formReg" id="myform">
			var form = document.createElement("form");
			form.setAttribute('method', 'post');
			form.setAttribute('action', 'info_film.jsp');
			
			var input_idfilm = document.createElement("input");
			input_idfilm.setAttribute('class', 'input_hidden');
			input_idfilm.setAttribute('type', 'hidden');
			input_idfilm.setAttribute('name', 'idfilm');
			input_idfilm.setAttribute('value', ''+data[j].idfilm);
			
			var input_titolo = document.createElement("input");
			input_titolo.setAttribute('class', 'input_hidden');
			input_titolo.setAttribute('type', 'hidden');
			input_titolo.setAttribute('name', 'titolo');
			input_titolo.setAttribute('value', ''+data[j].titolo);
			
			var input_immagine = document.createElement("input");
			input_immagine.setAttribute('class', 'input_hidden');
			input_immagine.setAttribute('type', 'hidden');
			input_immagine.setAttribute('name', 'immagine');
			input_immagine.setAttribute('value', ''+data[j].immagine);
			
			var input_annoUscita = document.createElement("input");
			input_annoUscita.setAttribute('class', 'input_hidden');
			input_annoUscita.setAttribute('type', 'hidden');
			input_annoUscita.setAttribute('name', 'annoUscita');
			input_annoUscita.setAttribute('value', ''+data[j].annoUscita);
			
			var input_durata = document.createElement("input");
			input_durata.setAttribute('class', 'input_hidden');
			input_durata.setAttribute('type', 'hidden');
			input_durata.setAttribute('name', 'durata');
			input_durata.setAttribute('value', ''+data[j].durata);
			
			var input_genere = document.createElement("input");
			input_genere.setAttribute('class', 'input_hidden');
			input_genere.setAttribute('type', 'hidden');
			input_genere.setAttribute('name', 'genere');
			input_genere.setAttribute('value', ''+data[j].genere);
			
			var input_lingua = document.createElement("input");
			input_lingua.setAttribute('class', 'input_hidden');
			input_lingua.setAttribute('type', 'hidden');
			input_lingua.setAttribute('name', 'lingua');
			input_lingua.setAttribute('value', ''+data[j].lingua);
			
			var input_descrizione = document.createElement("input");
			input_descrizione.setAttribute('class', 'input_hidden');
			input_descrizione.setAttribute('type', 'hidden');
			input_descrizione.setAttribute('name', 'descrizione');
			input_descrizione.setAttribute('value', ''+data[j].descrizione);
			
			var input_trailer = document.createElement("input");
			input_trailer.setAttribute('class', 'input_hidden');
			input_trailer.setAttribute('type', 'hidden');
			input_trailer.setAttribute('name', 'trailer');
			input_trailer.setAttribute('value', ''+data[j].trailer);
			
			var input_prezzo = document.createElement("input");
			input_prezzo.setAttribute('class', 'input_hidden');
			input_prezzo.setAttribute('type', 'hidden');
			input_prezzo.setAttribute('name', 'prezzo');
			input_prezzo.setAttribute('value', ''+data[j].prezzo);
			
			var input_file = document.createElement("input");
			input_file.setAttribute('class', 'input_hidden');
			input_file.setAttribute('type', 'hidden');
			input_file.setAttribute('name', 'file');
			input_file.setAttribute('value', ''+data[j].file);
			
			
			var button = document.createElement("button");
			//a.setAttribute('href', 'info_film.jsp');
			//a.setAttribute('href', 'info_film.jsp?film_bean='+data[j].titolo);
			button.setAttribute('class', 'btn btn-primary');
			button.setAttribute('type', 'submit');
			button.setAttribute('style', 'margin-left: 45px;');
			
			
			
					
			div_all_film.appendChild(row_grid);
			row_grid.appendChild(col_grid);
			col_grid.appendChild(div_container) ; 
			div_container.appendChild(h2);
			h2.after(p);
			p.after(div_card);
			div_card.appendChild(div_img);
			div_img.after(div_card_body);
			div_card_body.appendChild(h4);
			h4.after(p_anno);
			p_anno.after(p_genere);
			p_genere.after(p_durata);
			p_durata.after(p_prezzo);
			p_prezzo.after(form);
			
			form.appendChild(input_idfilm);
			input_idfilm.after(input_titolo);
			input_titolo.after(input_immagine);
			input_immagine.after(input_annoUscita);
			input_annoUscita.after(input_durata);
			input_durata.after(input_genere); 
			input_genere.after(input_lingua);
			input_lingua.after(input_descrizione);
			input_descrizione.after(input_trailer);
			input_trailer.after(input_prezzo);
			input_prezzo.after(input_file);
			input_file.after(button);
			 
			//h2.innerHTML = "Card Image";
			//p.innerHTML = "Image at the top";
			
			var temp_img = "<img class='card-img-top' src='" + data[j].immagine + "' alt='Card image'>";
			div_img.innerHTML = temp_img;
			h4.innerHTML = ""+data[j].titolo;
			p_anno.innerHTML = "Anno: " + data[j].Anno_uscita + "<br>";
			p_genere.innerHTML = "Genere: " + data[j].genere + "<br>";
			p_durata.innerHTML = "Durata: " + data[j].durata + "<br>";
			p_prezzo.innerHTML = "Prezzo: " + data[j].prezzo + "<br>";
			button.innerHTML = "Vai al film";
				
		
		}
		//if(count_column == size_json){break;}
	}
}

</script>

<!-- Optional JavaScript -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
