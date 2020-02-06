package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UtenteDAO {

	
	public synchronized UtenteBean doRetrieveByKey(String username, String password){
		 
		 Connection conn = null;
		 PreparedStatement ps = null;
		 try {
			 System.out.println("usr:"+username+"   "+password);
			UtenteBean ub = new UtenteBean(username, password); 
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
				ub.setNome(res.getString("nome"));
				ub.setCognome(res.getString("cognome"));
				
				return ub;
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
	
	
	
	public synchronized Integer Registration(String username, String password, String nome, String cognome, String email){
		 
		 Connection conn = null;
		 PreparedStatement ps = null;
		 try {
			UtenteBean ub = new UtenteBean(); 
			conn = DriverManagerConnectionPool.getConnection();
			ps = conn.prepareStatement("SELECT count(username) FROM buysee.utente WHERE username=?");
			ps.setString(1, username);
			 
			System.out.println(ps.toString());
			ResultSet res=ps.executeQuery();

			// Prendi il risultato
			
			int numberOfRows;
			System.out.println("prima di res");		
			if(res.next())
			{
				//se c'è già username
				numberOfRows = res.getInt(1);
		        System.out.println("numberOfRows= " + numberOfRows);
		        if(numberOfRows == 1) {System.out.println("username già presente nel DB");return -1;}
			
			}
			
			ps = conn.prepareStatement("SELECT count(email) FROM buysee.utente WHERE email=?");
			ps.setString(1, email);
			
			System.out.println(ps.toString());
			res=ps.executeQuery();

			System.out.println("prima di res");		
			if(res.next())
			{
				//se c'è già email
				numberOfRows = res.getInt(1);
		        System.out.println("numberOfRowsEmail= " + numberOfRows);
		        if(numberOfRows == 1) {System.out.println("email già presente nel DB"); return -2;}
			
			}
			
			//se è un nuovo utente, effettua registrazione
			ps= conn.prepareStatement("INSERT into buysee.utente (username, password, nome, cognome, email ) VALUES(?,?,?,?,?)");
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, nome);
			ps.setString(4, cognome);
			ps.setString(5, email);
		
			System.out.println(ps.toString());
			
			ps.executeUpdate();
			conn.commit();
			System.out.println("registazione avvenuta");
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
		return -3;
		
	 }
	
	
}
