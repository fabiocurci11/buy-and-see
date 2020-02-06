package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import model.UtenteBean;
import model.UtenteDAO;

@WebServlet("/Utente_login")
public class Utente_login extends HttpServlet {
	
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//UtenteDAO u = new UtenteDAO();
		//u.doRetrieveByKey("arkadius", "pass"); 
		System.out.println("in servleer");
		//recupero username e password
		HttpSession session=request.getSession();
		UtenteBean userB = getUsrPsw(request);
		
		if (userB == null)  {System.out.println("ub = null");response.sendRedirect("login.jsp");}	//se username e password non presenti, mai registrato
		
		else {
			try{
				System.out.println("in try");
				UtenteDAO ubd = new UtenteDAO();
				UtenteBean ub = ubd.doRetrieveByKey(userB.getUsername() ,userB.getPassword());
				if (ub==null) {    // login e/o password non presenti nel DB, quindi sbagliati-> chiamo login form  con messaggio errore
					request.setAttribute("denied", true);
					session.setAttribute("login", false);
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
					requestDispatcher.forward(request, response);
				}
				else {
					// l'utente è ammesso al sito: inserisco login e password nei cookies e do risposta di login eseguito correttamente
					
					Cookie usr_cookie = new Cookie("username", ub.getUsername());
					Cookie psw_cookie = new Cookie("password", ub.getPassword());
					response.addCookie(usr_cookie);
					response.addCookie(psw_cookie);
					
					session.setAttribute("login", true);
					session.setAttribute("utenteBean", ub);
					
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
					requestDispatcher.forward(request, response);
					System.out.println("disp");
				}
			}
			
			catch(Exception e){ 
				request.setAttribute("exception", e);
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("exception.jsp");
				requestDispatcher.forward(request, response);
			}
		}
	}
	
	
	private UtenteBean getUsrPsw(HttpServletRequest request) {
		//recupero username e password da cookie o da parametri
		UtenteBean ub = null;
		String usr = null, psw = null;

		Cookie[] cook = request.getCookies();   // tramite cookie
		if (cook != null) { System.out.println("recupero tramite cookie");
			for(int i=0;i<cook.length;i++) {
				if (cook[i].getName().equals("uername"))  usr = cook[i].getValue();
				if (cook[i].getName().equals("password"))  psw = cook[i].getValue();	
			}
		} 	
		if (usr == null || psw == null){		// se recupero tramite cookie fallisce, allora tramite parametri	
			System.out.println("recupero tramite parametri");
			String temp_usr; 
			String temp_psw;   
			temp_usr = request.getParameter("username");
			
			if (temp_usr!= null) {
				usr = temp_usr;
				
				temp_psw = request.getParameter("password");   
				if (temp_psw!= null) {
					psw = temp_psw;
					
				}
			}
		}
		
		if (usr != null && psw != null)    // se recupero ha avuto successo riempio bean
			 ub = new UtenteBean(usr, psw);
			System.out.println("recupero OK, riempio bean");
		return ub;
	}

}
