package il.haifa.ac.dh.tikkounsofrim.model;

/**
 * Mapping between chapater (929 indexing) and line in manuscript
 * @author urischor
 *
 */
public class ChapterAssignment {

	int chapter;
	
	int startPage;
	
	int startLine;
	
	int endPage;
	
	int endLine;
	
	public ChapterAssignment(int chapter, int startPage, int startLine, int endPage, int endLine) {
		super();
		this.chapter = chapter;
		this.startPage = startPage;
		this.startLine = startLine;
		this.endPage = endPage;
		this.endLine = endLine;
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
		return startPage;
	}

	/**
	 * @return the startLine
	 */
	public int getStartLine() {
		return startLine;
	}

	/**
	 * @return the endPage
	 */
	public int getEndPage() {
		return endPage;
	}

	/**
	 * @return the endLine
	 */
	public int getEndLine() {
		return endLine;
	}
	
}
