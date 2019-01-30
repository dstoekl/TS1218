package il.haifa.ac.dh.tikkounsofrim.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import il.haifa.ac.dh.tikkounsofrim.impl.TSVUtils.DoParse;
import il.haifa.ac.dh.tikkounsofrim.model.*;

/**
 * Read a table of biblical chapter (922 numbering) to page/lines mapping. the
 * table is read from a TSV file.
 * 
 * @author urischor
 *
 */
public class ChapterAssignmentDataImpl {

	public final static String TSV_GENEVA_FILENAME = "Geneva_146_929.tsv.txt";

	private List<ChapterAssignment> chapterLines = new ArrayList<ChapterAssignment>();

	private String name;

	static ChapterAssignmentDataImpl loadData(String tsvFile) {
		ChapterAssignmentDataImpl mData = new ChapterAssignmentDataImpl();

		TSVUtils.readIn(FilePathUtils.getFilePath() + File.separatorChar + tsvFile, new DoParse() {

			@Override
			public void doIt(String[] item) {
				// 0                        1                  2                 3                 4               5
				// actual_929_ch_assignment 929_chapter_number Genave_Page_begin Geneva_line_begin Geneva_Page_end Geneva_line_end
				int chapter = Integer.parseInt(item[1]);
				int startPage = Integer.parseInt(item[2]);
				int startLine = Integer.parseInt(item[3]);
				int endPage = Integer.parseInt(item[4]);
				int endLine = Integer.parseInt(item[5]);
				ChapterAssignment assingment = new ChapterAssignment(chapter, startPage, startLine, endPage, endLine);
				mData.chapterLines.add(assingment);
			}
		});
		mData.name = tsvFile;
		return mData;
	}
	
	public String getName() {
		return name;
	}
	
	public int getNumberOfChapters() {
		return chapterLines.size();
	}
	
	public ChapterAssignment getChapterAssignment(int chapterNumber) {
		try {
			return chapterLines.get(chapterNumber);
		}
		catch (IndexOutOfBoundsException e) {
			return null;
		}
	}
}
