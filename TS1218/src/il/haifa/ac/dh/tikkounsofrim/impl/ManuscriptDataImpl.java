package il.haifa.ac.dh.tikkounsofrim.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import il.haifa.ac.dh.tikkounsofrim.impl.TSVUtils.DoParse;
import il.haifa.ac.dh.tikkounsofrim.model.BoundingBox;
import il.haifa.ac.dh.tikkounsofrim.model.ManuscriptData;
import il.haifa.ac.dh.tikkounsofrim.model.SegData;
import il.haifa.ac.dh.tikkounsofrim.model.SegmentationProvider;
import il.haifa.ac.dh.tikkounsofrim.model.TranscribedString;
import il.haifa.ac.dh.tikkounsofrim.model.TranscriptionProvider;

public class ManuscriptDataImpl implements ManuscriptData, SegmentationProvider, TranscriptionProvider  {
	
	
	
	public final static String tvsGeneva = "Geneva_146";
	
	
	private static int currentPage=0;
	private static int currentLine=0;
	private static List<LineData> currentPageLineData = new ArrayList<LineData>();
	
	String name;
    int numberOfPages=0;
	List <Integer> pageLengths = new ArrayList<Integer>();
	List <List <LineData>> manuscriptLineData = new ArrayList<List<LineData>>();
	
	
	
	static ManuscriptDataImpl loadData(String tvsFile){
		ManuscriptDataImpl mData = new ManuscriptDataImpl();
	
		TSVUtils.readIn(FilePathUtils.getFilePath()+File.separatorChar+tvsFile+".txt", new DoParse() {
			
			@Override
			public void doIt(String[] item) {
				// TODO Auto-generated method stub
// 0	1			    2           3               4               5                6   7      8        9               10
//page	line4Filename	top_on_page	bottom_on_page	left_on_page	right_on_page	AT	GT01	GT02	enriched_y_n	color_img_file_name
				int page = Integer.parseInt(item[0]);
				if(page != currentPage) {
					mData.pageLengths.add(currentPage, currentLine-1);
					mData.manuscriptLineData.add(currentPage, currentPageLineData);
					mData.numberOfPages=page;
					//new Page
					currentPage=page;
					
					
					currentPageLineData = new ArrayList<LineData>();
					currentPageLineData.add(null);
					currentLine=1;
					
				}
				if(page == 8) {
					System.out.println("T8="+item[6]+"-"+item[10]);
				}
				int line = Integer.parseInt(item[1]);
				if (line != currentLine) {
					System.err.println("!!!Failed sanity check at page="+currentPage+" line="+line+" expecting line="+currentLine);
				}
				int top = Integer.parseInt(item[2]);
				int bottom = Integer.parseInt(item[3]);
				int left = Integer.parseInt(item[4]);
				int right = Integer.parseInt(item[5]);
				int height = bottom - top;
				int width = right -left;
				BoundingBox bbox = new BoundingBox(left, top, width, height);
				String transcription = item[7];
				if(transcription == null || transcription.length()==0) {
					transcription = item[6];
				}
				if(currentLine==13) {
					System.out.println("load page="+page+" Transcription line="+currentLine+" ="+transcription);
				}
				String imgName = item[10];
				SegData lineSegData = new SegData(page, line, bbox,  imgName);
				TranscribedString ts = new TranscribedString(transcription, null, "version");
				LineData lineData = new LineData(ts,lineSegData);
				currentPageLineData.add(line, lineData);
				currentLine++;
			}
		});
		mData.pageLengths.add(currentPage, currentLine-2);
		mData.manuscriptLineData.add(currentPage, currentPageLineData);
		mData.name = tvsFile;
		return mData;
	}
	/* (non-Javadoc)
	 * @see il.haifa.ac.dh.tikkounsofrim.impl.ManuscriptData#getTranscribedData(int, int)
	 */
	@Override
	public SegData getSegmentationData(int page, int lineNumber) {
		SegData sd = (manuscriptLineData.get(page)).get(lineNumber).getSegData();
		return sd;
		
	}
	@Override
	public int getNumberOfPages() {
		
		return numberOfPages;
	}
	@Override
	public int getNumberOfLines(int pageNumber) {
		// TODO Auto-generated method stub
		return manuscriptLineData.get(pageNumber).size()-1; //Don't count array position 0
	}
	@Override
	public TranscribedString getTranscribedLine(int pageNumber, int lineNumber, int tagLevel) {
		// TODO Auto-generated method stub
		return (manuscriptLineData.get(pageNumber)).get(lineNumber).getTranscribedString();
	}

}
class LineData {
	
	private TranscribedString tstring;
	private SegData sd;
	
	public LineData(TranscribedString ts, SegData lineSegData) {
		tstring = ts;
		sd = lineSegData;
	}
	public TranscribedString getTranscribedString() {
		return tstring;
	}

	public SegData getSegData() {
		return sd;
	}

}
