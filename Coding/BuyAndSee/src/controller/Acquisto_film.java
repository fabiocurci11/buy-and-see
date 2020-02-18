package controller;

import java.io.IOException;

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
		
		else{
			Integer id_f = null;
			if (idfilm != null) id_f = Integer.parseInt(idfilm);
			AcquistoDAO ad = new AcquistoDAO();
			res = ad.addItem(username, id_f);
		}
		
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

}
