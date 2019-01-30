package il.haifa.ac.dh.tikkounsofrim.impl;

import java.io.File;

import javax.servlet.ServletConfig;

public class FilePathUtils {
	static String contextPath;
	
	public static String getFilePath() {
		return contextPath + File.separator + "WEB-INF" + File.separator + "data";
	}

	public static void setFilePath(ServletConfig config) {
		contextPath = config.getServletContext().getRealPath("/");
	}

}
