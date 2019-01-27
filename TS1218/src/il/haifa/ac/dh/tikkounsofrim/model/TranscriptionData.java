package il.haifa.ac.dh.tikkounsofrim.model;

public interface TranscriptionData {

	SegData getTranscribedData(int page, int lineNumber);

	int getNumberOfPages();

	int getNumberOfLines(int pageNumber);

}