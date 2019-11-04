package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ItemCatalog;
import logic.WriteCatalog;
import model.Bbs;
import model.Condition;
import model.Item;
import model.Notice;
import model.Writing;

@Controller
public class ReadController {
	@Autowired
	private WriteCatalog writeCatalog;
	
	@Autowired
	private ItemCatalog itemCatalog;
	
	@RequestMapping(value="/read/read.html")
	public ModelAndView readBbs(Integer pageNo) {
		ModelAndView mav = new ModelAndView("home/frame");
		Integer cnt = writeCatalog.getBbsCount();
		if(cnt==null) cnt=0;
		int startRow = 0; int endRow=0;int pageCnt=0;
		int currentPage=0;
		
		if(pageNo==null) currentPage =1;
		else currentPage = pageNo;
		
		if(cnt>0) {
			pageCnt = cnt/5;
			if(cnt % 5>0) pageCnt++;
			startRow = (currentPage-1)*5 +1;
			endRow = currentPage * 5;
			
			if(endRow > cnt) endRow = cnt;
			
		}
		Condition c = new Condition();
		c.setStartRow(startRow); c.setEndRow(endRow);
		List<Bbs> bbsList=writeCatalog.readBbs(c);
		mav.addObject("BBS_LIST", bbsList);
		mav.addObject("COUNT", pageCnt);
		mav.addObject("BODY","bbsListView.jsp");
		return mav;
	}
	@RequestMapping(value="/read/readNotice.html")
	public ModelAndView readNotice(Integer pageNo) {
		ModelAndView mav = new ModelAndView("home/frame");
		Integer cnt = writeCatalog.getNoticeCount();
		if(cnt==null) cnt=0;
		int startRow = 0; int endRow=0;int pageCnt=0;
		int currentPage=0;
		
		if(pageNo==null) currentPage =1;
		else currentPage = pageNo;
		
		if(cnt>0) {
			pageCnt = cnt/5;
			if(cnt % 5>0) pageCnt++;
			startRow = (currentPage-1)*5 +1;
			endRow = currentPage * 5;
			
			if(endRow > cnt) endRow = cnt;
			
		}
		Condition c = new Condition();
		c.setStartRow(startRow); c.setEndRow(endRow);
		List<Notice> noticeList=writeCatalog.readNotice(c);
		mav.addObject("NOTICE_LIST", noticeList);
		mav.addObject("COUNT", pageCnt);
		mav.addObject("BODY","noticeListView.jsp");
		return mav;
	}
	
	@RequestMapping(value="/read/readDetail.html")
	public ModelAndView detail(Integer SEQNO) {
		ModelAndView mav = new ModelAndView("home/frame");
		Bbs bbs = writeCatalog.getBbsDetail(SEQNO);
		mav.addObject("BBS_ITEM", bbs);
		mav.addObject("BODY", "bbsReadView.jsp");
		return mav;
	}

	@RequestMapping(value="/read/readNoticeDetail.html")
	public ModelAndView noticeDetail(Integer SEQNO) {
		ModelAndView mav = new ModelAndView("home/frame");
		Notice notice = writeCatalog.getNoticeDetail(SEQNO);
		mav.addObject("NOTICE_ITEM", notice);
		mav.addObject("BODY", "noticeReadView.jsp");
		return mav;
	}
	@RequestMapping(value="/read/product.html")
	public ModelAndView readItem(Integer pageNo) {
		ModelAndView mav = new ModelAndView("home/frame");
		Integer cnt = itemCatalog.getItemCount();
		if(cnt==null) cnt=0;
		int startRow = 0; int endRow=0;int pageCnt=0;
		int currentPage=0;
		
		if(pageNo==null) currentPage =1;
		else currentPage = pageNo;
		
		if(cnt>0) {
			pageCnt = cnt/5;
			if(cnt % 5>0) pageCnt++;
			startRow = (currentPage-1)*5 +1;
			endRow = currentPage * 5;
			
			if(endRow > cnt) endRow = cnt;
			
		}
		Condition c = new Condition();
		c.setStartRow(startRow); c.setEndRow(endRow);
		List<Item> itemList=itemCatalog.getItems(c);
		mav.addObject("ITEM_LIST", itemList);
		mav.addObject("COUNT", pageCnt);
		mav.addObject("BODY","itemList.jsp");
		return mav;
		
	}
	
	
	@RequestMapping(value="/read/readItem")
	public ModelAndView getItem(String CODE) {
		ModelAndView mav = new ModelAndView("home/frame");
		//DB조회
		
		Item item = itemCatalog.getItem(CODE);
		mav.addObject("ITEM", item);
		mav.addObject("BODY", "itemDetail.jsp");
		return mav;
	
	}
	
	
	@RequestMapping(value="/read/readImage.html")
	public ModelAndView readImage(Integer id) {
		ModelAndView mav = new ModelAndView("home/frame");
		//DB조회
		Writing writing = writeCatalog.getImageWriting(id);
		mav.addObject("writing" ,writing);
		mav.addObject("BODY", "read_image.jsp");
		return mav;
	
	}
	
	
	
	
	
	
	
	
	
}
