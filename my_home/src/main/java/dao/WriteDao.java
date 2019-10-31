package dao;

import model.Bbs;
import model.Notice;

public interface WriteDao {
	Integer getMaxId();
	void insertBBS(Bbs bbs);
	
	Integer getMaxNoticeId();
	void insertNotice(Notice notice);
}
