package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReadDao;
import dao.WriteDao;
import model.Bbs;
import model.Condition;
import model.Notice;
@Service
public class WriteCatalogImpl implements WriteCatalog {
	@Autowired
	private WriteDao writeDao;
	@Autowired
	private ReadDao readDao;
	
	public Integer getMaxBbsId() {
	
		return writeDao.getMaxId();
	}

	public void putBbs(Bbs bbs) {
		writeDao.insertBBS(bbs);

	}

	public Integer getBbsCount() {
		// TODO Auto-generated method stub
		return readDao.getBbsCount();
	}

	public Bbs getBbsDetail(Integer id) {
		// TODO Auto-generated method stub
		return readDao.getBbsDetail(id);
	}
	
	public List<Bbs> readBbs(Condition c) {
		// TODO Auto-generated method stub
		return readDao.readBbs(c);
	}
	
	
	
	public Integer getMaxNoticeId() {
		
		return writeDao.getMaxNoticeId();
	}
	
	
	public void putNotice(Notice notice) {
		writeDao.insertNotice(notice);
		
	}
	
	public Integer getNoticeCount() {
		// TODO Auto-generated method stub
		return readDao.getNoticeCount();
	}
	
	public List<Notice> readNotice(Condition c) {
		// TODO Auto-generated method stub
		return readDao.readNotice(c);
	}
	
	public Notice getNoticeDetail(Integer id) {
		return readDao.getNoticeDetail(id);
	}

}
