package dao;

import java.util.List;

import model.Bbs;
import model.Condition;
import model.Notice;
import model.Writing;

public interface WriteDao {
	//게시판 
	Integer getMaxId();
	void insertBBS(Bbs bbs);
	
	//공지사항
	Integer getMaxNoticeId();
	void insertNotice(Notice notice);
	
	
	//이미지게시판	
	Integer getMaxWritingId();
	void insertWriting(Writing writing);	
	List<Writing> getWriting(Condition c);
	
	Integer selectMaxGroupId();
	void updateOrderNoReply(Writing writing);
	
	Writing getImageWriting(Integer id);
	void deleteWriting(Integer id);
	
	void updateWriting(Writing writing);
}
