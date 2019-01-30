package il.haifa.ac.dh.tikkounsofrim.model;

public interface ChapterAssignmentData {

	/**
	 * Get the manuscript name
	 * @return
	 */
	String getName();
	
	ChapterAssignment getChapterAssignment(int chapterNumber);

}