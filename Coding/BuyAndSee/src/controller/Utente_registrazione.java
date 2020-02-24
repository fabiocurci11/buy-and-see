package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UtenteBean;
import model.UtenteDAO;


@WebServlet("/Utente_registrazione")
public class Utente_registrazione extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("username");	
		System.out.println("u:" + username);
		String password = request.getParameter("password");	
		System.out.println("p:" + password);
		String nome = request.getParameter("nome");	
		System.out.println("n:" + nome);
		String cognome = request.getParameter("cognome");	
		System.out.println("p:" + cognome);
		String email = request.getParameter("email");
		System.out.println("e:" + email);
		
		if(validateNome(nome) != true) response.sendRedirect("registrazione.jsp");				
		if(validateCognome(cognome) != true) response.sendRedirect("registrazione.jsp");		
		if(validateEmail(email) != true) response.sendRedirect("registrazione.jsp");				
		if(validateUsername(username) != true) response.sendRedirect("registrazione.jsp");			
		if(validatePassword(password) != true) response.sendRedirect("registrazione.jsp");	
		
		
		UtenteDAO ud = new UtenteDAO();
		int reg = ud.Registration(username, password, nome, cognome, email);
		
		System.out.println("eddaje mi so registrato" );
		
		if(reg == -1) {
			System.out.println("username già utilizzato");
			Integer results = -1;
			request.setAttribute("attr",results);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("registrazione.jsp");
			requestDispatcher.forward(request, response);
		}
		else if(reg == -2) {
			
			System.out.println("email già utilizzata");
			Integer results = -2;
			request.setAttribute("attr",results);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("registrazione.jsp");
			requestDispatcher.forward(request, response);
		}
		else if(reg == 1){
			System.out.println("Registrazione OK");
			UtenteBean ub = new UtenteBean();
			ub.setNome(nome);
			ub.setCognome(cognome);
			request.setAttribute("utenteBean", ub);
			request.setAttribute("reg_ok", true);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
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
	
	private boolean validateEmail(String Email) {
		Pattern p = Pattern.compile("/[^@\\s]+@[^\\.\\s]+\\.[a-zA-Z]+$/");
		if(p.matcher(Email) != null){
			return true;
			
		}
		
		else{
			return false;
		}
	}
	
	private boolean validateUsername(String Username) {
		Pattern p = Pattern.compile("/^[A-Za-z0-9._]{4,10}$/");
		if(p.matcher(Username) != null){
			return true;
		}
		
		else{
			return false;
		}
	}
	
	private boolean validatePassword(String Password){
		Pattern p = Pattern.compile("/^(\\S){5,15}$/");
		if(p.matcher(Password) != null){
			return true;
		}
		else{
			return false;
		}
	}
	
	

}
