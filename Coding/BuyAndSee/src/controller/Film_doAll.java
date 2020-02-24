package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FilmBean;
import model.FilmDAO; 

@WebServlet("/Film_doAll")
public class Film_doAll extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		FilmDAO fd = new FilmDAO();
		ArrayList<FilmBean> f = fd.doRetrieveAll();
		
		int i=0;
		FilmBean temp=new FilmBean();
		out.append("[");
		int size= f.size();
		
		for(i=0; i<size;i++){
			temp=f.get(i);		
			out.append("{");
		
			out.append(" \"idfilm\":\""+ temp.getId() +"\",");
			out.append(" \"titolo\":\""+ temp.getTitolo() +"\",");
			out.append(" \"immagine\":\""+ temp.getImmagine() +"\",");
			out.append(" \"Anno_uscita\":\""+ temp.getAnno_uscita() +"\",");
			out.append(" \"durata\":\""+ temp.getDurata() +"\",");
			out.append(" \"genere\":\""+ temp.getGenere() +"\",");
			out.append(" \"lingua\":\""+ temp.getLingua() +"\",");
			out.append(" \"descrizione\":\""+ temp.getDescrizione() +"\",");
			out.append(" \"trailer\":\""+ temp.getTrailer()+"\",");
			out.append(" \"prezzo\":\""+ temp.getPrezzo() +"\",");
			out.append(" \"file\":\""+ temp.getFile() +"\"");
			
			
			if(i != size-1)
				out.append("},\n");
			else out.append("}");
		}

		
		out.append("]");

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
