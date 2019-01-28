package il.haifa.ac.dh.tikkounsofrim.model;

public class ManuscriptPlace {
	public ManuscriptID manuscriptId;
	public int page;
	public int line;

	public ManuscriptPlace(String manuscriptId, int page, int line) {
		this.manuscriptId = new ManuscriptID(manuscriptId);
		this.page = page;
		this.line = line;
	}

	public ManuscriptPlace getNext(int totalLines, int totalPages) {
		// TODO Auto-generated method stub
		int  currentLineNumber = this.line;
		int currentPage = this.page;
		currentLineNumber++;
		if (currentLineNumber <= totalLines) { //getManuscriptDescription(task.getmId()).getTotalLineNumbers(currentPage)) {
			this.line = currentLineNumber;
			return this;
					
		} else 	if(currentPage < totalPages) { //getManuscriptDescription(task.getmId()).getTotalPageNumber()) {
				currentPage++;
			    currentLineNumber=1;
			    this.page = currentPage;
				return this;
		}
		return null;
	}
}