package controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AcquistoDAO;
import model.UtenteDAO;

@WebServlet("/Acquisto_film")
public class Acquisto_film extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nome = request.getParameter("nome");	
		System.out.println("u:" + nome);
		String cognome = request.getParameter("cognome");	
		System.out.println("p:" + cognome);
		String numero = request.getParameter("numero");	
		System.out.println("n:" + numero);
		String scadenza = request.getParameter("scadenza");	
		System.out.println("p:" + scadenza);
		String codice = request.getParameter("codice");
		System.out.println("e:" + codice);
		
		if(validateNome(nome) != true) response.sendRedirect("acquista.jsp");				
		if(validateCognome(cognome) != true) response.sendRedirect("acquista.jsp");		
		if(validateNumero(numero) != true) response.sendRedirect("acquista.jsp");
		if(validateScadenza(scadenza) != true) response.sendRedirect("acquista.jsp");				
		if(validateCodice(codice) != true) response.sendRedirect("acquista.jsp");	
		
		
		String username = request.getParameter("username");	
		System.out.println("u:" + username);
		String idfilm = request.getParameter("idfilm");	
		System.out.println("if:" + idfilm);
		
		int res = 0;
		
		if (username == null) {
			System.out.println("usr:"+ username);
			Boolean log_for_buy = false;
			request.setAttribute("log_for_buy",log_for_buy);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
			requestDispatcher.forward(request, response);
		}
		
		//else{
		Integer id_f = null;
		if (idfilm != null) id_f = Integer.parseInt(idfilm);
		AcquistoDAO ad = new AcquistoDAO();
		res = ad.addItem(username, id_f);
		
		
		if(res == 1) {
			System.out.println("tutto ok inserimento");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("film_acquistati.jsp");
			requestDispatcher.forward(request, response);	
		}
		
		if(res == -1) {
			System.out.println("inserimento fallito o film già acquistato");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
			requestDispatcher.forward(request, response);
		}
	}
	
	
	private boolean validateNome(String Nome){
		Pattern p = Pattern.compile("/^[a-zA-Z]{3,20}$/");
		if(p.matcher(Nome) != null){
			return true;
		}
		
		else{
			return false;
		}
	}
	
	private boolean validateCognome(String Cognome){
		Pattern p = Pattern.compile("/^[a-zA-Z]{3,20}$/");
		if(p.matcher(Cognome) != null){
			return true;
		}
		
		else{
			return false;
		}
	}
	
	private boolean validateNumero(String Numero) {
		Pattern p = Pattern.compile("/^[0-9]{0,16}$/");
		if(p.matcher(Numero) != null){
			return true;
			
		}
		
		else{
			return false;
		}
	}
	
	private boolean validateScadenza(String Scadenza) {
		Pattern p = Pattern.compile("/^\\d{2}\\/\\d{2}\\/\\d{2}$/"); 
		if(p.matcher(Scadenza) != null){
			return true;
		}
		
		else{
			return false;
		}
	}
	
	private boolean validateCodice(String Codice){
		Pattern p = Pattern.compile("/^[0-9]{3,5}$/");
		if(p.matcher(Codice) != null){
			return true;
		}
		else{
			return false;
		}
	}

}
