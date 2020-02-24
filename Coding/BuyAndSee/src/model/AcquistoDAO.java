package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AcquistoDAO {

	
	public synchronized int addItem(String idusr, int idfilm){
		 
		 Connection conn = null;
		 PreparedStatement ps = null;
		 try {
			//int id_film = ab.getId();	
			//String id_usr = ab.getUsername();
			 
			//ps= conn.prepareStatement("SELECT into buysee.acquisto (idutente, idfilm) VALUES(?,?)");
			 
			conn = DriverManagerConnectionPool.getConnection();
			ps= conn.prepareStatement("INSERT into buysee.acquisto (idutente, idfilm) VALUES(?,?)");
			ps.setString(1, idusr);
			ps.setInt(2, idfilm);
		
			System.out.println(ps.toString());
			
			ps.executeUpdate();
			conn.commit();
			return 1;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				DriverManagerConnectionPool.releaseConnection(conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return -1;
	 }
	
	
	
	
	
	

	public synchronized ArrayList<FilmBean> doRetrieveAllUserPurchased(String username) {
			 
			 Connection conn = null;
			 PreparedStatement ps = null;
			 try {
				 
				ArrayList<FilmBean> arr=new ArrayList<FilmBean>();
				FilmBean f;
					
				conn = DriverManagerConnectionPool.getConnection();
				ps= 
				   conn.prepareStatement("SELECT * FROM buysee.acquisto INNER JOIN film ON acquisto.idfilm = film.idfilm WHERE acquisto.idutente= ?");
				ps.setString(1, username);
				
				System.out.println(ps.toString());
				
				ResultSet res = ps.executeQuery();
				
				// Prendi il risultato
				while(res.next())
				{
					f= new FilmBean();
					System.out.println("RISULTATO QUERY");
					
					f.setId(res.getInt("idfilm"));
					f.setTitolo(res.getString("titolo")); 
					f.setImmagine(res.getString("immagine"));
					f.setAnno_uscita(res.getInt("annoUscita"));
					f.setDurata(res.getDouble("durata"));
					f.setGenere(res.getString("genere"));
					f.setLingua(res.getString("lingua"));
					f.setDescrizione(res.getString("descrizione"));
					f.setTrailer(res.getString("trailer"));
					f.setPrezzo(res.getFloat("prezzo"));
					f.setFile(res.getString("file"));
		
					arr.add(f);
				}
				
				
				return arr;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
					ps.close();
					DriverManagerConnectionPool.releaseConnection(conn);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return null;
		 }
	
	
	
	
	
	
	
	
}
