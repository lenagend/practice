package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReadDao;
import dao.WriteDao;
import model.Bbs;
import model.Condition;
import model.Notice;
import model.Writing;
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

	public Integer getMaxWritingId() {
		// TODO Auto-generated method stub
		return writeDao.getMaxWritingId();
	}

	public void insertWriting(Writing writing) {
		// TODO Auto-generated method stub
		writeDao.insertWriting(writing);
	}

	public List<Writing> getWriting(Condition c) {
		// TODO Auto-generated method stub
		return writeDao.getWriting(c);
	}
	
	
	public Integer selectMaxGroupId() {
		// TODO Auto-generated method stub
		return writeDao.selectMaxGroupId();
	}
	public void updateOrderNoReply(Writing writing) {
		writeDao.updateOrderNoReply(writing);
		
	}
	
	public Integer selectImageCount() {
		// TODO Auto-generated method stub
		return readDao.selectImageCount();
	}
	public Integer selectReplyPage(Integer seqno) {
		
		return readDao.selectReplyPage(seqno);
	}

	public Writing getImageWriting(Integer id) {
		// TODO Auto-generated method stub
		return writeDao.getImageWriting(id);
	}
	
	public void deleteWriting(Integer id) {
		writeDao.deleteWriting(id);
	}
	public void updateWriting(Writing writing) {
		writeDao.updateWriting(writing);
		
	}
}
