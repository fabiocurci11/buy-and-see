package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AcquistoDAO {

	
	public synchronized int addItem(String idusr, int idfilm){
		 
		 Connection conn = null;
		 PreparedStatement ps = null;
		 try {
			//int id_film = ab.getId();	
			//String id_usr = ab.getUsername();
			 
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
	
}
