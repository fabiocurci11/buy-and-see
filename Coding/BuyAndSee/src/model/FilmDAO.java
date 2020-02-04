package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FilmDAO {

	
	public synchronized FilmBean doRetrieveByKey(int id) {
		System.out.println("iniiizo");
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
				f.setTrailer(res.getBoolean("trailer"));
				f.setPrezzo(res.getFloat("prezzo"));
	
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
}
