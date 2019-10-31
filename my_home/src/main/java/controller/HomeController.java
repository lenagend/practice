package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import logic.WriteCatalog;
import model.Bbs;
import model.Notice;
import model.User;

@Controller
public class HomeController {

	@Autowired
	private WriteCatalog writeCatalog;
	
	@RequestMapping(value="/home/intro.html",method=RequestMethod.GET)
	public ModelAndView intro(String BODY) {
		ModelAndView mav = new ModelAndView("home/frame");
		mav.addObject("BODY",BODY);
		return mav;
	}
	
	
	
	
	@RequestMapping(value="/home/userEntry.html",method=RequestMethod.GET)
	public ModelAndView userEntry() {
		ModelAndView mav = new ModelAndView("home/frame");
		mav.addObject(new User());
		mav.addObject("BODY", "userEntry.jsp");
		return mav;
	}
	
	@RequestMapping(value="/home/bbsTemplate.html", method=RequestMethod.GET)
	public ModelAndView bbsTemp() {
		ModelAndView mav = new ModelAndView("home/frame");
		mav.addObject(new Bbs());
		mav.addObject("BODY", "bbs_input.jsp");
		return mav;
	}
	
	@RequestMapping(value="/home/noticeTemplate.html", method=RequestMethod.GET)
	public ModelAndView noticeTemp() {
		ModelAndView mav = new ModelAndView("home/frame");
		mav.addObject(new Notice());
		mav.addObject("BODY", "notice_input.jsp");
		return mav;
	}
	
	@RequestMapping(value="/home/write.html", method=RequestMethod.POST)
	public ModelAndView putBbs(@Valid Bbs bbs, BindingResult br, HttpSession session) {
		if(br.hasErrors()) {
			
			ModelAndView mav = new ModelAndView("home/frame");
			mav.addObject("BODY", "bbs_input.jsp");
		
			return mav;
			
		}
		String id=(String)session.getAttribute("loginUser");
		ModelAndView mav = new ModelAndView("home/frame");
		if(id ==null) {//로그인 하지 않은경우
			mav.addObject("RESULT", "nobody");
			mav.addObject(new User());
			mav.addObject("BODY", "nologin.jsp");
			return mav;
		}else {
						
			bbs.setId(id);
			writeCatalog.putBbs(bbs);
			return new ModelAndView("redirect:/read/read.html");
		}
	
	}
	
	
	@RequestMapping(value="/home/noticeWrite.html", method=RequestMethod.POST)
	public ModelAndView putNotice(@Valid Notice notice, BindingResult br, HttpSession session) {
		if(br.hasErrors()) {
			
			ModelAndView mav = new ModelAndView("home/frame");
			mav.addObject("BODY", "notice_input.jsp");
		
			return mav;
			
		}
		String id=(String)session.getAttribute("loginUser");
		ModelAndView mav = new ModelAndView("home/frame");
		if(id ==null) {//로그인 하지 않은경우
			mav.addObject("RESULT", "nobody");
			mav.addObject(new User());
			mav.addObject("BODY", "nologin.jsp");
			return mav;
		}else {
						
			notice.setId(id);
			writeCatalog.putNotice(notice);
			return new ModelAndView("redirect:/read/readNotice.html");
		}
	
	}
	
	
}


















