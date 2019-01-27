package il.haifa.ac.dh.tikkounsofrim.model;


public interface ManuscriptProvider {
//	ManuscriptID getManuscriptID(/*???**/);
	ManuscriptDescriptor getManuscriptDescription(ManuscriptID id);
	//PageDescriptor getManuscriptPageDescription(ManuscriptID id, int pageNumber); 
	//ImageResult getManuscriptPage(ManuscriptID id, int pageNumber, int imageNumber);
	ImageData getManuscriptLine(ManuscriptID id, int pageNumber, int activeLine, int imageNumber, int fromLine, int toLine );
	TranscribedString getTranscribedLine(ManuscriptID id, int pageNumber, int lineNumber, int tagLevel);
//	SegData getSegmentationData(ManuscriptID id, int pageNumber, int activeLine);
	

	
	

}
