package il.haifa.ac.dh.tikkounsofrim.model;

public class TranscribedString {
	String content;
	ConfidenceLevels cfls;
	ConfidenceLevel cfl;
	AnnotationLevel al;
	String version;
	public String getString() {
		return content;
	}
	public TranscribedString(String content, ConfidenceLevels cfls, String version) {
		super();
		this.content = content;
		this.cfls = cfls;
		this.version = version;
	}
	ConfidenceLevels getConfidenceLevels() {
		return null;
	}
	ConfidenceLevel getLineConfidenceLevel() {
		return null;
	}

}
