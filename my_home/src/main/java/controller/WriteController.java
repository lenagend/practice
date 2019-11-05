package controller;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import logic.WriteCatalog;
import model.Condition;
import model.Writing;

@Controller
public class WriteController {
	@Autowired
	private WriteCatalog writeCatalog;
	
	@RequestMapping(value="/write/writeForm.html")
	public ModelAndView form(HttpSession session) {
		String id = (String)session.getAttribute("loginUser");
		ModelAndView mav = new ModelAndView("home/frame");
		if(id==null) {
			mav.addObject("BODY", "writeFormLogin.jsp");
		}else {
			mav.addObject("BODY", "writeForm.jsp");
			mav.addObject(new Writing());
			
		}
		return mav;
	}
	@RequestMapping(value="/write/write.html",
			method=RequestMethod.POST)
	public ModelAndView write(@Valid Writing writing,
		BindingResult br, HttpSession session,
		Integer parent_id,Integer order_no,
		Integer group_id) {
		if(br.hasErrors()) {
			ModelAndView mav=new ModelAndView(
					"home/frame");
			mav.addObject("BODY","writeForm.jsp");
			return mav;
		}
		MultipartFile multiFile=writing.getImage();
		String fileName=null; String path=null;
		OutputStream os=null;
		if(multiFile != null) {
			fileName=multiFile.getOriginalFilename();
			ServletContext ctx=session.getServletContext();
			path=ctx.getRealPath("/upload/"+fileName);
			System.out.println("업로드경로:"+path);
			try {
				os=new FileOutputStream(path);
				BufferedInputStream bis =
					new BufferedInputStream(
						multiFile.getInputStream());
				byte[] buffer = new byte[8156];
				int read = 0;
				while( (read=bis.read(buffer))>0) {
					os.write(buffer,0,read);
				}
				if(os != null) os.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			writing.setImage_name(fileName);
		}
		Integer maxId=writeCatalog.getMaxWritingId();
		if(maxId == null) maxId = 0;
		
		if(writing.getParent_id() == null) {//원글인경우
			writing.setParent_id(0);
			writing.setOrder_no(0);
			//그룹ID증가
			Integer gId=writeCatalog.selectMaxGroupId();
			if(gId==null) gId=0;
			writing.setGroup_id(gId+1);
		}else {//답글인 경우 
			writing.setParent_id(parent_id);
			writing.setGroup_id(group_id);
			writing.setOrder_no(order_no);
			writeCatalog.updateOrderNoReply(writing);
		}
		writing.setWriting_id(maxId + 1);
		Calendar today=Calendar.getInstance();
		int year=today.get(Calendar.YEAR);
		int month=today.get(Calendar.MONTH) + 1;
		int date=today.get(Calendar.DATE);
		String registerDate=year+"/"+month+"/"+date;
		writing.setRegister_date(registerDate);
		writeCatalog.insertWriting(writing);//DB삽입
		ModelAndView mav=new ModelAndView("home/frame");
		mav.addObject("BODY",
			"writeResult.jsp?SEQNO="+(maxId+1));
		return mav;
	}
	
	@RequestMapping(value="/write/writeList.html")
	public ModelAndView list(Integer SEQNO, Integer PAGE_NUM) {
		if(PAGE_NUM==null) PAGE_NUM = 1;
		ModelAndView mav = new ModelAndView("home/frame");
		if(SEQNO != null) {
			int rownum = writeCatalog.selectReplyPage(SEQNO);
			int page = rownum/5;
			if(rownum % 5 !=0)page++;
			PAGE_NUM = page;
		}
		int currentPage = PAGE_NUM;
		int totalPageCount = 0;
		int startRow = 0; int endRow = 0;
		int count = writeCatalog.selectImageCount();
		if(count>0) {
			totalPageCount = count/5;
			if(count % 5> 0 ) totalPageCount++;
			startRow = (currentPage -1) *5 +1;
			endRow = currentPage * 5;
			if(endRow>count) endRow = count;
		}
		Condition c = new Condition();
		c.setStartRow(startRow); c.setEndRow(endRow);
		List<Writing> writeList = writeCatalog.getWriting(c);
		mav.addObject("LIST",writeList);
		mav.addObject("count",count);
		mav.addObject("startRow",startRow);
		mav.addObject("endRow",endRow);
		mav.addObject("pageCount",totalPageCount);
		mav.addObject("currentPage",currentPage);
		mav.addObject("BODY","image_list.jsp");
		return mav;
		
		
		
		
	}
	
	@RequestMapping(value="/write/delete.html")
	public ModelAndView delete(Integer id) {
		ModelAndView mav = new ModelAndView("home/frame");
		Writing writing = writeCatalog.getImageWriting(id);
		
		mav.addObject(writing);
		mav.addObject("BODY", "delete_form.jsp");
		return mav;
	}
	
	@RequestMapping(value="/write/deleteDo.html")
	public ModelAndView deleteDo(Writing writing) {
		System.out.println("글번호 : "+writing.getWriting_id());
		Writing old = writeCatalog.getImageWriting(writing.getWriting_id());//기존글 검색
		ModelAndView mav = new ModelAndView("home/frame");
		if(writing.getPassword().equals(old.getPassword())) {
			//암호가 일치하는경우
			writeCatalog.deleteWriting(writing.getWriting_id());
			mav.addObject("BODY", "delete_result.jsp");
		}else {
			mav.addObject("BODY", "delete_result.jsp?id="+writing.getWriting_id());
		}
		return mav;
	
	}
	@RequestMapping(value="/write/modify.html")
	public ModelAndView modify(Integer id) {
		ModelAndView mav = new ModelAndView("home/frame");
		Writing writing = writeCatalog.getImageWriting(id);
		mav.addObject(writing);
		mav.addObject("BODY", "update_form.jsp");
		
		
		return mav;
	}
	
	
	
	@RequestMapping(value="/write/updateDo.html")
	public ModelAndView modifyDo(Writing writing, HttpSession session) {
		System.out.println("updateDo까진온다");
		ModelAndView mav = new ModelAndView("home/frame");
		Writing old = writeCatalog.getImageWriting(writing.getWriting_id());
		if(writing.getPassword().equals(old.getPassword())) {
			//암호가 일치하는 경우
			MultipartFile multiFile = writing.getImage();
			String fileName = multiFile.getOriginalFilename();
			if(fileName.equals("")) {//기존 이미지인 경우
				writing.setImage_name(old.getImage_name());
				
				
			}else {//이미지가 변경되는경우
				String path = null; OutputStream os = null;
				ServletContext sc = session.getServletContext();
				path = sc.getRealPath("/upload/"+fileName);
				try {
					os= new FileOutputStream(path);
					BufferedInputStream bis = new BufferedInputStream(multiFile.getInputStream());
					byte[] buffer = new byte[8106];
					
					int read = 0;
					while((read=bis.read(buffer))>0) {
						os.write(buffer,0,read);
					}
					if(os!=null)os.close();
					
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				writing.setImage_name(fileName);//새이름
			}
			//DB에서 update
			writeCatalog.updateWriting(writing);
			
			mav.addObject("BODY", "update_result_ok.jsp?id="+writing.getWriting_id());
			
		}else {
			//일치하지 않는경우
			mav.addObject("BODY", "update_result.jsp?id="+writing.getWriting_id());
		}
		
		return mav;
	}
	
	@RequestMapping(value="/write/writeReplyForm.html")
	public ModelAndView replyForm(Integer id, Integer parent_id, Integer group_id) {
		ModelAndView mav = new ModelAndView("home/frame");
		Writing original = writeCatalog.getImageWriting(id);//원글검색
		original.setContent(null);//답글을 위해 지운다
		original.setWriter_name(null);
		original.setEmail(null);
		mav.addObject("writing", original);
		mav.addObject("title", "RE]"+original.getTitle());
		mav.addObject("BODY","writeForm.jsp?group_id="+
				group_id+"&parent_id="+parent_id);
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
