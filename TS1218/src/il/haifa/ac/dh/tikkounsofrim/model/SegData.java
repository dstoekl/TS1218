package il.haifa.ac.dh.tikkounsofrim.model;

public class SegData {
	public int getPage() {
		return page;
	}
	public int getLine() {
		return line;
	}
	public BoundingBox getBbox() {
		return bbox;
	}
//	public String getTranscription() {
//		return transcription;
//	}
	public String getImgName() {
		return imgName;
	}
	public SegData(int page, int line, BoundingBox bbox, String imgName) {
		super();
		this.page = page;
		this.line = line;
		this.bbox = bbox;
		
		this.imgName = imgName;
	}
	int page;
	int line;
	BoundingBox bbox;
	
	String imgName;

}
