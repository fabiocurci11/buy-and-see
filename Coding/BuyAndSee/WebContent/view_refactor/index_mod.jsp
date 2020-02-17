<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!--<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />-->
<!--<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="index_mod.css" type="text/css">

</head>
<body>

<%
	Boolean log=false;
	log = (Boolean)session.getAttribute("login");
	System.out.println("log attribute:" + log);
%>

    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
          <a href="#" class="navbar-brand font-weight-bold">Home</a>
          <button type="button" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbars" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler">
                    <span class="navbar-toggler-icon"></span>
                </button>
      
      
          <div id="navbarContent" class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
              <!-- Level one dropdown -->
              <li class="nav-item dropdown">
                <a id="dropdownMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Sfoglia Catalogo</a>
                <ul aria-labelledby="dropdownMenu1" class="dropdown-menu border-0 shadow">
                  <li><a href="#" class="dropdown-item">Per Anno</a></li>
                  <li><a href="#" class="dropdown-item">Per tutti i Film</a></li>
                  <li><a href="#" class="dropdown-item">Per Sezione novità</a></li>
      
                  <li class="dropdown-divider"></li>
                  <!-- Level two dropdown-->
                  <li class="dropdown-submenu">
                    <a id="dropdownMenu2" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-item dropdown-toggle">Per Genere</a>
                    <ul aria-labelledby="dropdownMenu2" class="dropdown-menu border-0 shadow">

                      <li><a tabindex="-1" href="#" class="dropdown-item">Horror</a></li>
                      <li><a tabindex="-1" href="#" class="dropdown-item">Comico</a></li>
                      <li><a href="#" class="dropdown-item">Thriller</a></li>
                      <li><a href="#" class="dropdown-item">level 2</a></li>
                    </ul>
                  </li>
                  <!-- End Level two -->
                </ul>
              </li>
              <!-- End Level one -->

              <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>

            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="#">Login</a>
              </li>
            </ul>
          </ul>
      

          </div>
        </div>
      </nav>



	
	<div class="container-fluid p-3 my-3 text-white">
		<h1 id="h1_page">HOME</h1>
		<div id="dislay_all_film">
			
	  		 
		</div>
		
		
	 </div>
	  
	 
	  
	</div> <!-- chiusura div TEMPLATE -->







<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


</body> 
</html>

<script>
/*
$(document).ready(function(){
	document.getElementById("collapseExample").setAttribute("hidden", true);
	  $("#sh").click(function(){
		  document.getElementById("collapseExample").setAttribute("hidden", true);
		  $("collapseExample").show();
		  
	  });
	});
*/

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



//codice dinamico



$(document).ready(function(){
    //alert("ciao");
    $.get("Film_doAll", function(data,status){
    	//alert("Data: " + data + "\nStatus: " + status);
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
			input_prezzo.after(button);
			 
			//h2.innerHTML = "Card Image";
			//p.innerHTML = "Image at the top";
			
			var temp_img = "<img class='card-img-top' src='" + data[j].immagine + "' alt='Card image'>";
			div_img.innerHTML = temp_img;
			h4.innerHTML = "John Doe";
			p_anno.innerHTML = "Anno: " + data[j].anno + "<br>";
			p_genere.innerHTML = "Genere: " + data[j].genere + "<br>";
			p_durata.innerHTML = "Durata: " + data[j].anno + "<br>";
			p_prezzo.innerHTML = "Prezzo: " + data[j].prezzo + "<br>";
			button.innerHTML = "Vai al film";
				
		
		}
		//if(count_column == size_json){break;}
	}
}

</script>