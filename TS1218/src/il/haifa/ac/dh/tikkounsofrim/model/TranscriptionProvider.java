package il.haifa.ac.dh.tikkounsofrim.model;

public interface TranscriptionProvider {
	TranscribedString getTranscribedLine( int pageNumber, int lineNumber, int tagLevel);

}
