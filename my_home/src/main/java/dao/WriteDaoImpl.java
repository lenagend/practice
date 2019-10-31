package dao;

import java.util.Calendar;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Bbs;
import model.Notice;
@Repository
public class WriteDaoImpl implements WriteDao {

	@Autowired
	private SqlSession session;
	
	public Integer getMaxId() {
		
		return session.selectOne("mapper.myMapper.getMaxBbsId");
	}

	public void insertBBS(Bbs bbs) {
		Integer seqno = this.getMaxId();
		if(seqno ==null) seqno = 0;
		bbs.setSeqno(seqno+1);
		Calendar today = Calendar.getInstance();
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH)+1;
		int date = today.get(Calendar.DATE);
		String bbsDate = year+"/"+month+"/"+date;
		bbs.setBbs_date(bbsDate);
		session.insert("mapper.myMapper.putBbs",bbs);

	}
	
	public Integer getMaxNoticeId() {
		return session.selectOne("mapper.myMapper.getMaxNoticeId");
	}
	
	public void insertNotice(Notice notice) {
		Integer seqno = this.getMaxNoticeId();
		if(seqno ==null) seqno = 0;
		notice.setSeqno(seqno+1);
		Calendar today = Calendar.getInstance();
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH)+1;
		int date = today.get(Calendar.DATE);
		String noticeDate = year+"/"+month+"/"+date;
		notice.setNotice_date(noticeDate);
		session.insert("mapper.myMapper.putNotice",notice);

		
	}
	

}
