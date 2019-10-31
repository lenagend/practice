package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import logic.LoginCatalog;
import model.User;

@Controller
public class EntryController {
	@Autowired
	private LoginCatalog loginCatalog;
	
	@RequestMapping(value="/entry/entry.html" ,method=RequestMethod.POST)
	public ModelAndView entry(User user, HttpSession session) {
		loginCatalog.entryUser(user);
		
		session.setAttribute("loginUser", user.getUser_id());
		
		
		
		return new ModelAndView("redirect:/entry/home.html");
	}
	@RequestMapping(value="/entry/home.html")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home/frame");
		mav.addObject("BODY", "loginResult.jsp");
		return mav;
	}
}
