<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="scriptJQ/jquery.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<LINK rel="stylesheet" href="index.css" type="text/css">

</head>
<body>

<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">

	<div class="collapse navbar-collapse" id="navbarSupportedContent" >
    	<ul class="navbar-nav mr-auto">
      		<li class="nav-item">
        		<a class="nav-link" href="#">Home</a>
      		</li>
      		
      		<li class="nav-item dropdown" id="sh2">
        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Sfoglia Catalogo	</a>
	        	<div class="dropdown-menu bg-dark" aria-labelledby="navbarDropdownMenuLink" id="sh3">
	          		<a class="dropdown-item text-white" href="#">Per Anno</a>
	          		<a class="dropdown-item text-white" href="#">Per Tutti i Film</a>
	          		<a class="dropdown-item text-white" href="#">Per Sezione Novità</a>
	          		
	          		<a class="dropdown-item text-white btn" >Per Genere</a>
	          	
	          		<div id="collapseExample" >
  						<a class="dropdown-item text-white" href="#">Horro</a>
	          			<a class="dropdown-item text-white" href="#">Comico</a>
	          		</div>
	          		
	
				</div>
     		 </li>
     		
    	</ul>
    	
    </div>
    	
    	<form class="form-inline my-2 my-lg-0">
      		<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    	</form>
    	
    	<ul class="navbar-nav">
      		<li class="nav-item">
        		<a class="nav-link" href="login.jsp">Login</a>
      		</li>
      	</ul>   	
  	
</nav>   


<div class="container-fluid p-3 my-3 text-white">
	<h1 id="h1_page">HOME</h1>
	<div id="dislay_all_film">
		<!-- 
		<div class="row">
		    <div class="col-3">
				<div class="container">
			  			<h2>Card Image</h2>
						<p>Image at the top (card-img-top):</p>
						<div class="card text-primary">
			    			<img class="card-img-top" src="img/film1.jpg" alt="Card image">
				    		<div class="card-body">
						      	<h4 class="card-title">John Doe</h4>
						      	<p class="card-text-black">Some example text some example text. John Doe is an architect and engineer</p>
						      	<a href="#" class="btn btn-primary">See Profile</a>
				    		</div> 
			  			</div>
				</div>
			</div>
		
			<div class="col-3"></div>
			<div class="col-3">.col-sm-3</div>
    		<div class="col-3">.col-sm-3</div> 

		</div> 
		 
	  	<div class="row">
  			<div class="col-3"> <div class="container">
				  			<h2>Card Image</h2>
							<p>Image at the top (card-img-top):</p>
							<div class="card text-primary">
				    			<img class="card-img-top" src="img/film1.jpg" alt="Card image">
					    		<div class="card-body">
							      	<h4 class="card-title">John Doe</h4>
							      	<p class="card-text-black">Some example text some example text. John Doe is an architect and engineer</p>
							      	<a href="#" class="btn btn-primary">See Profile</a>
					    		</div> 
				  			</div>
					</div></div>
  			<div class="col-3">.col-sm-3</div>
  			<div class="col-3">.col-sm-3</div>
  			<div class="col-3">.col-sm-3</div>
  		</div>
  		 -->
  		 
	</div>
	
	
 </div>
  
 
  
</div> <!-- chiusura div TEMPLATE -->


</body> 
</html>


<script>

$(document).ready(function(){
    alert("ciao");
    $.get("Film_doAll", function(data,status){
    	alert("Data: " + data + "\nStatus: " + status);
    	myFunc(data);
    });
});


function myFunc(jsonData){
	var data=JSON.parse(jsonData);
	alert("post parse");
 	var size_json = Object.keys(data).length; //lunghezza array json
  	var count = 0;
 	var j = 0;
 	var j2 = 0;
  	size_json=6; 
  	console.log(size_json);
	for(i=0; i<size_json-j2; i++){
		
		var div_all_film=document.getElementById("dislay_all_film");
		var row_grid = document.createElement("div"); //creo div_scarpa con class=scarpa
		row_grid.setAttribute('class', 'row');
		alert("in row");
		
		for(j=0; j<=(size_json-j)+1; j++){
			
			var col_grid = document.createElement("div"); 
			col_grid.setAttribute('class', 'col-3');
			
			var div_container = document.createElement("div"); //creo div_img con class=img
			div_container.setAttribute('class', 'container');
			
			var h2 = document.createElement("h2"); //creo elemento p
			
			var p = document.createElement("p");
			
			var div_card = document.createElement("div"); 
			div_card.setAttribute('class', 'card text-primary');
			
			var temp_img = document.createElement("img");
			temp_img.setAttribute('class', 'card-img-top');
			temp_img.setAttribute('src', 'img/film1.jpg');
			temp_img.setAttribute('alt', 'Card image');
			
			var div_card_body = document.createElement("div"); 
			div_card_body.setAttribute('class', 'card-body');
			
			var h4 = document.createElement("h4");
			h4.setAttribute('class', 'card-title');
			
			var p_card_text = document.createElement("p");
			p_card_text.setAttribute('class', 'card-text-black');
			
			var a = document.createElement("a");
			a.setAttribute('href', '#');
			a.setAttribute('class', 'btn btn-primary');
			
			div_all_film.appendChild(row_grid);
			row_grid.appendChild(col_grid);
			col_grid.appendChild(div_container) ;
			div_container.appendChild(h2);
			h2.after(p);
			p.after(div_card);
			div_card.appendChild(temp_img);
			temp_img.after(div_card_body);
			div_card_body.appendChild(h4);
			h4.after(p_card_text);
			p_card_text.after(a);
			
			h2.innerHTML = "Card Image";
			p.innerHTML = "Image at the top";
			h4.innerHTML = "John Doe";
			p_card_text.innerHTML = "Some example text some example p_card_text";
			a.innerHTML = "See profile";
			alert(count);
			count++;
			j2=j+j2+1;
			alert(j2);
		}
		
	}
}

</script>

<!--  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>