package il.haifa.ac.dh.tikkounsofrim.model;

public class ManuscriptPlace {
	public String manuscriptId;
	public int page;
	public int line;

	public ManuscriptPlace(String manuscriptId, int page, int line) {
		this.manuscriptId = manuscriptId;
		this.page = page;
		this.line = line;
	}
}