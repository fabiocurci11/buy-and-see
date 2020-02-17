<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<meta charset="ISO-8859-1">
<title>Info Film</title>
</head>
<body>

<%@include  file="indexTEMPLATE2.jsp" %> 		

 <LINK rel="stylesheet" href="info_film.css" type="text/css">
 
<% String idfilm = request.getParameter("idfilm"); System.out.println("@@@@idfilm: "+idfilm);%> 
<% String title = request.getParameter("titolo"); System.out.println("@@@@film_bean_titolo: "+title);%> 
<% String immagine = request.getParameter("immagine"); System.out.println("@@@@immagine: "+immagine);%> 
<% String annoUscita = request.getParameter("annoUscita"); System.out.println("@@@@annoUscita: "+annoUscita);%> 
<% String durata = request.getParameter("durata"); System.out.println("@@@@durata: "+durata);%> 
<% String genere = request.getParameter("genere"); System.out.println("@@@@genere: "+genere);%> 
<% String lingua = request.getParameter("lingua"); System.out.println("@@@@lingua: "+lingua);%> 
<% String descrizione = request.getParameter("descrizione"); System.out.println("@@@@descrizione: "+descrizione);%> 
<% String trailer = request.getParameter("trailer"); System.out.println("@@@@trailer: "+trailer);%>
<% String prezzo = request.getParameter("prezzo"); System.out.println("@@@@prezzo: "+prezzo);%>  

<h1 id="h1_page">INFO FILM</h1>

<div id="div_info_film">
	
	<div class="container">
		<div class="card text-primary" style="margin-bottom: 20px">
			<div>
				<img class="card-img-top" src="<%=immagine%>" alt="Card image">
			</div>
			<div class="card-body">
				<h4 class="card-title"><%=title%></h4>
				<!-- <p class="p_info_film">Descrizione:18 Regali, film diretto da Francesco Amato, è la storia di Elisa (Vittoria Puccini), che a 40 anni ha perso la vita a causa di un male incurabile, lasciando il marito e la figlioletta di solo un anno. Sapendo di non avere speranze di vita, la donna prima della sua dipartita, pensa a come restare vicino alla piccola dopo la sua morte. È così che ogni anno nel giorno del suo compleanno Anna (Benedetta Porcaroli) riceve un regalo da suo padre Alessio (Edoardo Leo) per conto della madre, fino alla maggiore età. Con questi diciotto regali Elisa dimostra a sua figlia che, nonostante un fato avverso, lei c'è e che le è accanto. undefined<br></p>
				
				
				<form method="post" action="info_film.jsp">
					<input class="input_hidden" type="hidden" name="titolo" value="drammatico">
					<input class="input_hidden" type="hidden" name="immagine" value="img_db/18_regali.jpg">
					<input class="input_hidden" type="hidden" name="annoUscita" value="undefined">
					<input class="input_hidden" type="hidden" name="durata" value="1.15">
					<input class="input_hidden" type="hidden" name="genere" value="drammatico">
					<input class="input_hidden" type="hidden" name="lingua" value="italiana">
					<input class="input_hidden" type="hidden" name="descrizione" value="descrizione del film">
					<input class="input_hidden" type="hidden" name="trailer" value="false">
					<input class="input_hidden" type="hidden" name="prezzo" value="50.0">
					 <button class="btn btn-primary" type="submit" style="margin-left: 45px;">Vai al film</button>
				</form>
				 -->
			</div>
		</div>
	
	</div>

	<div id="div_descr">
		<h4 class="card-title">Descrizione</h4>
		<p>18 Regali, film diretto da Francesco Amato, è la storia di Elisa (Vittoria Puccini), che a 40 anni ha perso la vita a causa di un male incurabile, lasciando il marito e la figlioletta di solo un anno. Sapendo di non avere speranze di vita, la donna prima della sua dipartita, pensa a come restare vicino alla piccola dopo la sua morte. È così che ogni anno nel giorno del suo compleanno Anna (Benedetta Porcaroli) riceve un regalo da suo padre Alessio (Edoardo Leo) per conto della madre, fino alla maggiore età. Con questi diciotto regali Elisa dimostra a sua figlia che, nonostante un fato avverso, lei c'è e che le è accanto.</p>
	</div>
	
	
	
	<div id="div_trailer_acquista">
		
		<input class="input_hidden" type="hidden" name="titolo" value="drammatico">
		<button type="submit" class="btn btn-primary btn-lg">Visiona Trailer</button>
		
		<form method="post" action="<%=response.encodeURL("acquista.jsp")%>" id="form_acquista">
			<!-- <input class="input_hidden" type="hidden" name="titolo" value="drammatico">  -->
			<input class="input_hidden" type="hidden" name="idfilm" value="<%=idfilm%>">
			<button type="submit" class="btn btn-primary btn-lg" style="float: right;">Acquista</button>
		</form>
	</div>
	
	
</div>	
	
	

</div> <!-- chiusura div TEMPLATE -->
</body>
</html>