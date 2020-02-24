package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FilmDAO {

	
	public synchronized FilmBean doRetrieveByKey(int id) {
		System.out.println("inizo");
		Connection conn=null;
		PreparedStatement ps=null;
		System.out.println("pre try");
		try {
			System.out.println("1");
			FilmBean f = new FilmBean();
			System.out.println("2");
			conn= DriverManagerConnectionPool.getConnection();
			System.out.println("3");
			ps= conn.prepareStatement("SELECT * FROM buysee.film WHERE idfilm = ?");
			ps.setInt(1, id);
			
			System.out.println("prima della query");
			ResultSet res=ps.executeQuery();
			System.out.println("dopo la query");
			// Prendi il risultato
			if(res.next())
			{
				f.setId(res.getInt("idfilm"));
				f.setTitolo(res.getString("titolo")); 
				f.setImmagine(res.getString("immagine"));
				f.setAnno_uscita(res.getInt("prezzo"));
				f.setDurata(res.getDouble("durata"));
				f.setGenere(res.getString("genere"));
				f.setLingua(res.getString("lingua"));
				f.setDescrizione(res.getString("descrizione"));
				f.setTrailer(res.getString("trailer"));
				f.setPrezzo(res.getFloat("prezzo"));
				f.setFile(res.getString("file"));
	
				return f;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				ps.close();
				DriverManagerConnectionPool.releaseConnection(conn);
			} catch(SQLException e){
				e.printStackTrace();
			}
			
		}
		return null;
	}
	
	
	
	
	public synchronized ArrayList<FilmBean> doRetrieveAll() {
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			ArrayList<FilmBean> arr=new ArrayList<FilmBean>();
			FilmBean f;
			
			conn= DriverManagerConnectionPool.getConnection();
			ps= conn.prepareStatement("SELECT * FROM buysee.film");			
			
			System.out.println(ps.toString());
			ResultSet res=ps.executeQuery();
			System.out.println("dopo query");

			// Prendi il risultato
			Integer id_temp = null;
						
			while(res.next())
			{
				f= new FilmBean();
				System.out.println("RISULTATO QUERY");
				//sb.setId(res.getInt("id"));
				id_temp=res.getInt("idfilm");
				f.setId(id_temp);
				System.out.println("### ID "+ id_temp);
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
			e.printStackTrace();
		}finally {
			try {
				ps.close();
				DriverManagerConnectionPool.releaseConnection(conn);
			} catch(SQLException e){
				e.printStackTrace();
			}
			
		}
		return null;
	}
	
	
	
	public synchronized void doSave(String titolo, String immagine, Integer annoUscita, Double durata, String genere, String lingua, String descrizione, String trailer, Float prezzo, String file) {
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			FilmBean sb= new FilmBean();
			conn= DriverManagerConnectionPool.getConnection();
			ps= conn.prepareStatement("INSERT into buysee.film "
									+ "(titolo, immagine, annoUscita, durata, genere, lingua, descrizione, trailer, prezzo, file) VALUES"
									+ "(?,?,?,?,?,?,?,?,?,?)"
									);
				
			
			if(titolo != null)
				ps.setString(1, titolo);
			else ps.setNull(1, java.sql.Types.VARCHAR);
			
			
			if(immagine != null)
				ps.setString(2, immagine);
			else ps.setNull(2, java.sql.Types.VARCHAR);
			
			
			if(annoUscita != null)
				ps.setInt(3, annoUscita);
			else ps.setNull(3, java.sql.Types.INTEGER);

			
			if(durata != null)
				ps.setDouble(4, durata);
			else ps.setNull(4, java.sql.Types.DOUBLE);
			
			
			if(genere != null)
				ps.setString(5, genere);
			else ps.setNull(5, java.sql.Types.VARCHAR);
			
			
			if(lingua != null)
				ps.setString(6, lingua);
			else ps.setNull(6, java.sql.Types.VARCHAR);
			
			
			if(descrizione != null)
				ps.setString(7, descrizione);
			else ps.setNull(7, java.sql.Types.VARCHAR);
			
			
			if(trailer != null) 
				ps.setString(8, trailer);
			else ps.setNull(8, java.sql.Types.VARCHAR); 

			
			if(prezzo != null) {
				ps.setFloat(9, prezzo);}
			else ps.setNull(9, java.sql.Types.FLOAT);
			
			if(file != null) {
				ps.setString(10, file);}
			else ps.setNull(10, java.sql.Types.VARCHAR);
			
			
			System.out.println(ps.toString());
			
			ps.executeUpdate();
			conn.commit();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		}finally {
			try {
				ps.close();
				DriverManagerConnectionPool.releaseConnection(conn);
			} catch(SQLException e){
				e.printStackTrace();
			}
			
		}
		//return null;
		
	}
	
	
	
}
