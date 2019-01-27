package il.haifa.ac.dh.tikkounsofrim.impl;

import il.haifa.ac.dh.tikkounsofrim.model.ManuscriptID;
import il.haifa.ac.dh.tikkounsofrim.model.TaskProvider;
import il.haifa.ac.dh.tikkounsofrim.model.TikunUser;

public class TaskProviderImpl implements TaskProvider {

	@Override
	public Task getTask(TikunUser user) {
		// TODO Auto-generated method stub
		return new Task(user,new ManuscriptID("Geneva 146"),7,13,null,null);
	}
	
	@Override
	public Task getTask(TikunUser user, String m, int p, int l) {
		
		return new Task(user,new ManuscriptID(m),p,l,null,null);
	}

	@Override
	public Task getNextTask(Task task, int totalPages, int totalLines) {
		int  currentLineNumber = task.getLineNumber();
		int currentPage = task.getPageNumber();
		currentLineNumber++;
		if (currentLineNumber <= totalLines) { //getManuscriptDescription(task.getmId()).getTotalLineNumbers(currentPage)) {
			return task.setLineNumber(currentLineNumber);
		} else 	if(currentPage < totalPages) { //getManuscriptDescription(task.getmId()).getTotalPageNumber()) {
				currentPage++;
			    currentLineNumber=1;
				return task.setPageNumber(currentPage);
			    }
		
		
		return getTask(task.getUser());
	}

	@Override
	public int getNumberOfLinesTranscribed(Task task) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Task getTask(TikunUser user, int book, int chapter) {
		// TODO Auto-generated method stub
		return new Task(user,new ManuscriptID("Geneva 146"),9,13,null,null);
	}


}
