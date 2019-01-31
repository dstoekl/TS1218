package il.haifa.ac.dh.tikkounsofrim.model;

public interface TaskProvider {
	
	Task getTask(TikunUser user);
	Task getNextTask(Task task);
	int getNumberOfLinesTranscribed(Task task);
	Task getTask(TikunUser user, ManuscriptPlace firstPlace);
	 
	 /**
	  * Get initial task per user, bible book and chapter within book
	 * @param user
	 * @param book
	 * @param chapter
	 * @return
	 */
	Task getTask(TikunUser user, int book, int chapter);

	/**
	  * Get initial task per user, and bible chapter (929 numbering, starting with 1)
	 * @param user
	 * @param ntnChapter
	 * @return
	 */
	Task getTask(TikunUser user, int ntnChapter);
	
	class Task {
		
		public Task(TikunUser user, ManuscriptPlace place, TaskType tType, TaskLevel tLevel) {
			super();
			this.mId = place.manuscriptId;
			this.startPageNumber = place.page;
			this.pageNumber = startPageNumber;
			
			
			this.startLineNumber = place.line;
			this.lineNumber = startLineNumber; 
			
			this.tType = tType;
			this.tLevel = tLevel;
			this.user = user;
		}
		
		private ManuscriptID mId=null;
		private int startPageNumber=-1;
		private int pageNumber = -1;
		private int startLineNumber=-1;
		private int lineNumber = -1;
	
		private TaskType tType = null;
		private TaskLevel tLevel= null;
		private TikunUser user;
		
		public ManuscriptID getmId() {
			return mId;
		}
		public int getPageNumber() {
			return pageNumber;
		}
		public int getLineNumber() {
			return lineNumber;
		}
		public TaskType getType() {
			return tType;
		}
		public TaskLevel getLevel() {
			return tLevel;
		}
		
		public Task setLineNumber(int currentLineNumber) {
			this.lineNumber = currentLineNumber;
			return this;
		}
		public Task setPageNumber(int currentPage) {
			this.pageNumber = currentPage;
			this.lineNumber = 1;
			return this;
			
		}
		public TikunUser getUser() {
			
			return user;
		}
		
		public int getNumberofLinesDone() {
			return lineNumber - startLineNumber;
		}
		public int getNumberofPagesDone() {
			return pageNumber - startPageNumber;
		}
		public ManuscriptPlace getPlace() {
			return new ManuscriptPlace(mId.getName(), pageNumber, lineNumber);
		}
		
		
	}

	




	

	

}
