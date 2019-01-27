package il.haifa.ac.dh.tikkounsofrim.transcribe;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import il.haifa.ac.dh.tikkounsofrim.impl.ManuscriptProviderImpl;

import il.haifa.ac.dh.tikkounsofrim.model.ImageData;
import il.haifa.ac.dh.tikkounsofrim.model.ManuscriptDescriptor;
import il.haifa.ac.dh.tikkounsofrim.model.ManuscriptPlace;
import il.haifa.ac.dh.tikkounsofrim.model.ManuscriptProvider;
import il.haifa.ac.dh.tikkounsofrim.model.TaskProvider;
import il.haifa.ac.dh.tikkounsofrim.model.TaskProvider.Task;
import il.haifa.ac.dh.tikkounsofrim.model.TikunUser;
import il.haifa.ac.dh.tikkounsofrim.model.TranscribedString;
import il.haifa.ac.dh.tikkounsofrim.model.UserDBase;



@WebServlet(urlPatterns = {"/TranscribeServlet"})
public class TranscribeServlet extends HttpServlet {
	static ManuscriptProviderImpl fi = new ManuscriptProviderImpl();
	static TaskProvider taskProvider;
	static ManuscriptProvider manuscriptProvider =fi ;
//	static TranscriptionProvider transcriptionProvider =fi;
	
	static TikunUser  user = new TikunUser("Alan");
	long start = 0;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
//	private TodoService todoService = new TodoService();

	//java -Dcantaloupe.config=C:cantaloupe.properties.sample -Xmx2g -jar cantaloupe-4.0.2.war
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		Task task =  (Task) request.getSession().getAttribute("task");
		if(task==null) {
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(
					request, response);
			return;
		}
		setupTranscription(request, task);
		start = System.currentTimeMillis();
		request.getSession().setAttribute("starttime",start);
		request.getRequestDispatcher("/WEB-INF/views/transcribe.jsp").forward(
				request, response);
	}


private void setupTranscription(HttpServletRequest request, Task task) {
	int lineNumber = task.getLineNumber();
	int pageNumber = task.getPageNumber();
	//image
	ImageData imageData= manuscriptProvider.getManuscriptLine(task.getmId(),pageNumber,lineNumber,0,0,0);
	
	// manuscript description 
	ManuscriptDescriptor manuscriptDesc =  manuscriptProvider.getManuscriptDescription(task.getmId());
	
	//transcription
	TranscribedString transcription = manuscriptProvider.getTranscribedLine(task.getmId(), pageNumber, lineNumber, 0);
	
	request.getSession().setAttribute("manuscriptName",task.getmId().getName());
	String manuscriptShortDesc =  manuscriptDesc.getShortDescription();
	request.getSession().setAttribute("manuscriptShortDesc",manuscriptShortDesc);
	System.out.println("Manuscript ShortDesc="+manuscriptShortDesc);
	String manuscriptDescLink =  manuscriptDesc.getDescriptionLink();
	request.getSession().setAttribute("manuscriptDescLink",manuscriptDescLink);
	request.getSession().setAttribute("manuscriptPage",pageNumber);
	request.getSession().setAttribute("manuscriptLine",lineNumber);
	request.getSession().setAttribute("manuscriptTotalPages",manuscriptDesc.getTotalPageNumber());
	request.getSession().setAttribute("manuscriptTotalLines",manuscriptDesc.getTotalLineNumbers(task.getPageNumber()));
	request.getSession().setAttribute("transcribedlineimgsrc",imageData.getTranscribedLineImgSrc());
	
	request.getSession().setAttribute("pageimgsrc",imageData.getPageImgSrc());
	
	request.getSession().setAttribute("boundingbox",imageData.getBoundingBox().toString());
	double leafletFactor = manuscriptDesc.getLeafletFactor();
	int ytop = (int) (imageData.getBoundingBox().y/leafletFactor);
	int ybottom = (int) ((imageData.getBoundingBox().y+imageData.getBoundingBox().height)/leafletFactor);
	int xleft = (int) (imageData.getBoundingBox().x/leafletFactor);
	int xright = (int) ((imageData.getBoundingBox().x+imageData.getBoundingBox().width)/leafletFactor);
	request.getSession().setAttribute("ytop",0-ytop);
	request.getSession().setAttribute("ybottom",0-ybottom);
	request.getSession().setAttribute("xleft",xleft);
	request.getSession().setAttribute("xright",xright);
	
	request.getSession().setAttribute("transcribedline",transcription.getString());
	request.getSession().setAttribute("transcribedlength",(transcription.getString().length()+1));
	System.out.println("transcribesdLength="+(transcription.getString().length()+1));
	System.out.println("Original Bounding box+"+imageData.getBoundingBox().toString());
	System.out.println("Leaflet coordinates ytop, ybottom, xleft, xright=("+ytop+","+ybottom+","+xleft+","+xright+")");
}
	
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String transcribed = request.getParameter("transcribed");
		int status = determineStatus(request);
		int pageNumber= (int) request.getSession().getAttribute("manuscriptPage");
		int lineNumber= (int) request.getSession().getAttribute("manuscriptLine");
	//	TikunUser user= (TikunUser) request.getSession().getAttribute("user");
		UserDBase userDB = (UserDBase) request.getSession().getAttribute("userDB");
		Task task = (Task) request.getSession().getAttribute("task");
		String version = (String) request.getSession().getAttribute("version");
		if (version == null) {
			version = "";
			
		}
		ManuscriptDescriptor manuscriptDesc =  manuscriptProvider.getManuscriptDescription(task.getmId());
		ManuscriptPlace place = new ManuscriptPlace(task.getmId().getName(), pageNumber, lineNumber);
		String automaticTranscription = (String) request.getSession().getAttribute("transcribedline");
		if (automaticTranscription == null) {
			automaticTranscription = "";
			
		}
		if (transcribed == null) {
			transcribed = "";
			
		}
		start = (long) request.getSession().getAttribute("starttime");
		userDB.addTranscription(user.getId(), System.currentTimeMillis(), place, version, automaticTranscription, transcribed, status,start);
		System.out.println("!!!!CrowdSoureData: user-"+user.getId()+" status="+status+",page-"+pageNumber+",line-"+lineNumber+",transcribed-"+transcribed
				+"originalTranscribed:"+ automaticTranscription);

		
	    taskProvider = (TaskProvider) request.getSession().getAttribute("taskProvider");
		taskProvider.getNextTask(task, manuscriptDesc.getTotalPageNumber(), manuscriptDesc.getTotalLineNumbers(task.getPageNumber()));
		request.getSession().setAttribute("task",task);
		setupTranscription(request, task);
		start = System.currentTimeMillis();
		request.getSession().setAttribute("starttime",start);
		request.getRequestDispatcher("/WEB-INF/views/transcribe.jsp").forward(
				request, response);

		
	}


	private int determineStatus(HttpServletRequest request) {
		//TODO
		int retVal = 0;
		String status = request.getParameter("status");
		if (status == null) {
			return retVal;
			
		}
		switch (status) {
		case "AC":
			retVal = 3;
			break;
		case "NE":
			retVal = 2;
			break;
		case "PC":
			retVal = 1;
			break;	
		case "Skip":
			retVal = 0;
			break;
		default:
			break;
		}
		System.out.println("TTT status -"+status+":"+retVal);
	
		return retVal;
	}
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		
	}
}