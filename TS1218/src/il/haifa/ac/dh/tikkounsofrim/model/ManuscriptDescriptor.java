package il.haifa.ac.dh.tikkounsofrim.model;

public class ManuscriptDescriptor {
	
	
	private String shortDescription;
	private String descriptionLink;
	private double leafletFactor;
	private ManuscriptData mdata;
	private SegmentationProvider sdata; 
	private TranscriptionProvider tdata;
	public ManuscriptDescriptor(ManuscriptData mdata, SegmentationProvider sdata, TranscriptionProvider tdata, double leafletFactor, String shortDescription,
			String descriptionLink) {
		super();
		
		this.mdata = mdata;
		this.leafletFactor = leafletFactor;
		this.shortDescription = shortDescription;
		this.descriptionLink = descriptionLink;
		this.sdata = sdata;
		this.tdata = tdata;
	}
	public ManuscriptDescriptor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getTotalPageNumber() {
		
		return mdata.getNumberOfPages();
	}
	public int getTotalLineNumbers(int pageNumber) {
		int lines = mdata.getNumberOfLines(pageNumber); 
		return lines;
		
	}
public String getShortDescription() {
		return shortDescription;
		
	}
public String getDescriptionLink() {
	
	return descriptionLink;
	
}

public double getLeafletFactor() {
	return leafletFactor;
}
public SegData getSegmentationData(int pageNumber, int activeLine) {
	
	return sdata.getSegmentationData(pageNumber, activeLine);
}

public TranscribedString getTranscribedLine( int pageNumber, int lineNumber, int tagLevel) {
	return tdata.getTranscribedLine( pageNumber, lineNumber, tagLevel);
	
}
}
