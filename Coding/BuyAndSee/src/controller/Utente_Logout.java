package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Utente_Logout")
public class Utente_Logout extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("INIZIO LOGOUT");
				// per fare in modo che un cookie venga cancellato dal browser
				// bisogna ri-crearlo con valore "", dargli MaxAge pari a 0 e rinviarglielo.
					Cookie usr = new Cookie("username", "");
			        usr.setMaxAge(0);
			        response.addCookie(usr);
			        
			        Cookie psw = new Cookie("password", "");
			        psw.setMaxAge(0);
			        response.addCookie(psw);
			        
			        request.getSession().invalidate();
			        
			        // reinvio anche il form di login
			        System.out.println("Fine LOGOUT");
			        response.sendRedirect("login.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}



