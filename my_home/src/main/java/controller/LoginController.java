package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import logic.LoginCatalog;
import model.User;

@Controller
public class LoginController {
	@Autowired
	private LoginCatalog loginCatalog;
	
	@RequestMapping(value="/login/login.html")
	public ModelAndView toLogin() {
		ModelAndView mav = new ModelAndView("home/login");
		mav.addObject(new User());
		return mav;
	}
	
	@RequestMapping(value="/login/frame.html", method=RequestMethod.POST)
	public ModelAndView login(@Valid User user, BindingResult br, HttpSession session) {
		ModelAndView mav = new ModelAndView("home/frame");
		if(br.hasErrors()) {
			mav.addObject("HEADER", "login.jsp");
			
			return mav;
		}
		String password = loginCatalog.getPassword(user.getUser_id());
		if(password == null || !user.getPassword().equals(password)) {
			mav.addObject("BODY", "loginResult.jsp");
		}else {
			session.setAttribute("loginUser", user.getUser_id());
			mav.addObject("BODY","loginResult.jsp");
			
		}
		
		return mav;
	}
}
