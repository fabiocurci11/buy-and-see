package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FilmDAO;


/**
 * Servlet implementation class Aggiungi_film
 */
@WebServlet("/Aggiungi_film")
public class Aggiungi_film extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String titolo = request.getParameter("titolo");	
		System.out.println("t:" + titolo);
		String immagine = request.getParameter("immagine");	
		System.out.println("i:" + immagine);
		String annoUscita = request.getParameter("annoUscita");	//int
		System.out.println("au:" + annoUscita);
		String durata = request.getParameter("durata");	//double
		System.out.println("d:" + durata);
		String genere = request.getParameter("genere");	
		System.out.println("g:" + genere);
		String lingua = request.getParameter("lingua"); 
		System.out.println("l:" + lingua);
		String descrizione = request.getParameter("descrizione");	
		System.out.println("d:" + descrizione);
		String trailer = request.getParameter("trailer");	//boolean
		System.out.println("t:" + trailer);
		String prezzo = request.getParameter("prezzo");	//float
		System.out.println("p:" + prezzo);
		String file = request.getParameter("file");	
		System.out.println("f:" + file);
		
		Integer annoUscita_p = null;
		Double durata_p = null; 
		Float prezzo_p=null;
		 
		if(annoUscita != "") annoUscita_p = Integer.parseInt(annoUscita);
		if(durata != "") durata_p = Double.parseDouble(durata);
		if(prezzo != "") prezzo_p = Float.parseFloat(prezzo);
		
		String img_path = "img_db/";
		img_path += immagine;
		
		System.out.println("img_db:" + img_path);
		
		String file_path = "film/";
		file_path += file;
		
		System.out.println("file_db:" + file_path);
		
		System.out.println("execute method dao");	
		FilmDAO fd = new FilmDAO();
		fd.doSave(titolo, img_path, annoUscita_p, durata_p , genere , lingua , descrizione, trailer,  prezzo_p, file_path);

		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
		requestDispatcher.forward(request, response);
		
		
		
	}

}
