package il.haifa.ac.dh.tikkounsofrim.model;

public interface TaskProvider {
	
	Task getTask(TikunUser user);
	Task getNextTask(Task task, int totalPages, int totalLines);
	int getNumberOfLinesTranscribed(Task task);
	 Task getTask(TikunUser user, String m, int p, int l);
	 Task getTask(TikunUser user, int book, int chapter);
	
	class Task {
		
		public Task(TikunUser user, ManuscriptID mId, int startPageNumber, int startLineNumber, TaskType tType, TaskLevel tLevel) {
			super();
			this.mId = mId;
			this.startPageNumber = startPageNumber;
			this.pageNumber = startPageNumber;
			
			
			this.startLineNumber = startLineNumber;
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
		
		
	}




	

	

}
