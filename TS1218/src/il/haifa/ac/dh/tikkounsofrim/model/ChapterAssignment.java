package il.haifa.ac.dh.tikkounsofrim.model;

/**
 * Mapping between chapater (929 indexing) and line in manuscript
 * @author urischor
 *
 */
public class ChapterAssignment {

	ManuscriptPlace start;
	
	ManuscriptPlace end;
	
	int chapter;
		
	public ChapterAssignment(String manuscriptId, int chapter, int startPage, int startLine, int endPage, int endLine) {
		super();
		this.chapter = chapter;
		this.start = new ManuscriptPlace(manuscriptId, startPage, startLine);
		this.end = new ManuscriptPlace(manuscriptId, endPage, endLine);
	}

	/**
	 * @return the chapater
	 */
	public int getChapater() {
		return chapter;
	}

	/**
	 * @return the startPage
	 */
	public int getStartPage() {
		return start.page;
	}

	/**
	 * @return the startLine
	 */
	public int getStartLine() {
		return start.line;
	}

	/**
	 * @return the endPage
	 */
	public int getEndPage() {
		return end.page;
	}

	/**
	 * @return the endLine
	 */
	public int getEndLine() {
		return end.line;
	}
	
}
