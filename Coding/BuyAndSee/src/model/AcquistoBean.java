package model;

public class AcquistoBean {

	private int id;
	private String username;
	
	
	public AcquistoBean() {
		
	}
	
	public AcquistoBean(int idfilm, String usr) {
		this.id = idfilm;
		this.username = usr;
	}
	
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
	
}
