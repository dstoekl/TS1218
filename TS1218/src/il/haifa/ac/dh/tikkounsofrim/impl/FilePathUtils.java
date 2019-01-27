package il.haifa.ac.dh.tikkounsofrim.impl;

public class FilePathUtils {
static String contextPath;
	static public  String getFilePath() {
	//	return contextPath;
		
		String userDir = System.getProperty("user.dir");
		System.out.println("user.dir= "+userDir);
		if(userDir.indexOf("omcat")!=-1){
			
			userDir = userDir+"/webapps/TS1218/WEB-INF/data";
	
		} else {
			userDir = "C:\\Users\\user\\git\\TS1218\\TS1218\\WebContent\\WEB-INF\\data";
		}
		
		return userDir;
		
		
	}

	public static void setFilePath(String contextPath2) {
		contextPath = contextPath2.substring(1)+"/";
		
		
	}

}
