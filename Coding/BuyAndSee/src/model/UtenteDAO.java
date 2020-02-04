package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UtenteDAO {

	
	public synchronized UtenteDAO doRetrieveByKey(String username, String password){
		 
		 Connection conn = null;
		 PreparedStatement ps = null;
		 try {
			 System.out.println("usr:"+username+"   "+password);
			//UtenteBean ub = new UtenteBean(username, password); 
			conn = DriverManagerConnectionPool.getConnection(); 
			ps = conn.
					prepareStatement("SELECT * FROM buysee.utente WHERE username = BINARY ? AND password = BINARY ?");
			
			ps.setString(1, username);
			ps.setString(2, password);
			
			ResultSet res = ps.executeQuery();
			System.out.println(ps.toString());
			// 4. Prendi il risultato
			if(res.next())
			{
				System.out.println("NOME: "+res.getString("nome"));
				System.out.println("COGNOME: "+res.getString("cognome"));
				//ub.setNome(res.getString("nome"));
				//ub.setCognome(res.getString("cognome"));
				
				//return ub;
			}
			
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
