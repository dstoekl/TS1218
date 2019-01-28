
package il.haifa.ac.dh.tikkounsofrim.impl;

import il.haifa.ac.dh.tikkounsofrim.model.ManuscriptID;
import il.haifa.ac.dh.tikkounsofrim.model.ManuscriptPlace;
import il.haifa.ac.dh.tikkounsofrim.model.TaskProvider;
import il.haifa.ac.dh.tikkounsofrim.model.TikunUser;

public class TaskProviderImpl implements TaskProvider {

	@Override
	public Task getTask(TikunUser user) {
		// TODO Auto-generated method stub
		ManuscriptPlace seed = new ManuscriptPlace("Geneva 146", 7, 13);
		seed = getNextFree(seed);
		return getTask(user,seed);
	}
	


	private ManuscriptPlace getNextFree(ManuscriptPlace seed) {
		// TODO Auto-generated method stub
		boolean free = checkIfFree(seed);
		while(!free) {
			seed = seed.getNext(0, 0);
			free = checkIfFree(seed);
		}
		return seed;
	}

	@Override
	public Task getTask(TikunUser user, ManuscriptPlace firstPlace) {
		
		return new Task(user,firstPlace,null,null);
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
