package model;

public class FilmBean {
 
	private int id;
	private String titolo;
	private String immagine;
	private int anno_uscita;
	private double durata;
	private String genere;
	private String lingua;
	private String descrizione;
	private boolean trailer;
	private float prezzo;
	private String file;
	

	public FilmBean() {
		
	}
	
	public FilmBean(String title) {
		this.titolo = title;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getTitolo() {
		return titolo;
	}


	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}


	public String getImmagine() {
		return immagine;
	}


	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}


	public int getAnno_uscita() {
		return anno_uscita;
	}


	public void setAnno_uscita(int anno_uscita) {
		this.anno_uscita = anno_uscita;
	}


	public double getDurata() {
		return durata;
	}


	public void setDurata(double durata) {
		this.durata = durata;
	}


	public String getGenere() {
		return genere;
	}


	public void setGenere(String genere) {
		this.genere = genere;
	}


	public String getLingua() {
		return lingua;
	}


	public void setLingua(String lingua) {
		this.lingua = lingua;
	}


	
	public String getDescrizione() {
		return descrizione;
	}


	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	
	
	public boolean isTrailer() {
		return trailer;
	}


	public void setTrailer(boolean trailer) {
		this.trailer = trailer;
	}


	public float getPrezzo() {
		return prezzo;
	}


	public void setPrezzo(float prezzo) {
		this.prezzo = prezzo;
	}
	
	

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

}
