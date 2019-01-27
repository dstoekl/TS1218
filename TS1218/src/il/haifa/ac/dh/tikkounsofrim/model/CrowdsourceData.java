package il.haifa.ac.dh.tikkounsofrim.model;

import java.util.Date;

public interface CrowdsourceData {
	Boolean  saveLine(TikunUser user, ManuscriptID mId, int pNumber, int Lnumber, 
					  TranscribedString transcribedString,
					  TranscribeStatus tStatus,
					  String comment,
					  String systemNotes,
					  Date timestamp
					  
			         );

}
