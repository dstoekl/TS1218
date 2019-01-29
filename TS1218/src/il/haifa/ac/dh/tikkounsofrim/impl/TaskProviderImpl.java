
package il.haifa.ac.dh.tikkounsofrim.impl;


import il.haifa.ac.dh.tikkounsofrim.model.ManuscriptPlace;
import il.haifa.ac.dh.tikkounsofrim.model.ManuscriptProvider;
import il.haifa.ac.dh.tikkounsofrim.model.TaskProvider;
import il.haifa.ac.dh.tikkounsofrim.model.TikunUser;
import il.haifa.ac.dh.tikkounsofrim.model.UserDBase;

public class TaskProviderImpl implements TaskProvider {
  private static final int SEEN_LIMIT = 10;
private static final int CORRECT_LIMIT = 5;
ManuscriptProvider mprov= null;
  UserDBase userDB = null;
	protected TaskProviderImpl(ManuscriptProvider mprov, UserDBase userDB) {
	super();
	this.mprov = mprov;
	this.userDB = userDB;
}



	@Override
	public Task getTask(TikunUser user) {
		
		ManuscriptPlace seed = new ManuscriptPlace("Geneva 146", 7, 13);
		seed = getNextFree(seed);
		return getTask(user,seed);
	}
	


	private ManuscriptPlace getNextFree(ManuscriptPlace seed) {
		// TODO Auto-generated method stub
		boolean free = checkIfFree(seed);
		while(!free) {
			seed = seed.getNext(mprov.getManuscriptDescription(seed.manuscriptId).getTotalPageNumber(), 
					            mprov.getManuscriptDescription(seed.manuscriptId).getTotalLineNumbers(seed.page));
			free = checkIfFree(seed);
		}
		return seed;
	}

	private boolean checkIfFree(ManuscriptPlace seed) {
		// TODO Auto-generated method stub
		if (userDB.getTotalTimesLineSeen(seed) <= SEEN_LIMIT && userDB.getTotalTimesLineCorrected(seed) <= CORRECT_LIMIT) {
			return true;
		}
		return false;
	}



	@Override
	public Task getTask(TikunUser user, ManuscriptPlace firstPlace) {
		
		return new Task(user,firstPlace,null,null);
	}

	@Override
	public Task getNextTask(Task task) {
		int  currentLineNumber = task.getLineNumber();
		int currentPage = task.getPageNumber();
		currentLineNumber++;
		if (currentLineNumber <= mprov.getManuscriptDescription(task.getmId()).getTotalLineNumbers(currentPage)) {
			return task.setLineNumber(currentLineNumber);
		} else 	if(currentPage < mprov.getManuscriptDescription(task.getmId()).getTotalPageNumber()) {
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
		
		ManuscriptPlace place = lookup(book, chapter);
		return new Task(user, place,null,null);
	}



	private ManuscriptPlace lookup(int book, int chapter) {
		// TODO Auto-generated method stub
		ManuscriptPlace seed = new ManuscriptPlace("Geneva 146", 7, 13);
		return seed;
	}


}
