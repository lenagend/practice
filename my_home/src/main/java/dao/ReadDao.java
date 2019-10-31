package dao;

import java.util.List;

import model.Bbs;
import model.Condition;
import model.Notice;

public interface ReadDao {
	List<Bbs> readBbs(Condition c);
	Integer getBbsCount();
	Bbs getBbsDetail(Integer id);
	
	List<Notice> readNotice(Condition c);
	Integer getNoticeCount();
	Notice getNoticeDetail(Integer id);
}
