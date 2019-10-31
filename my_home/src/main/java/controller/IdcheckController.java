package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.LoginCatalog;

@Controller
public class IdcheckController {

	@Autowired
	private LoginCatalog loginCatalog;
	
	@RequestMapping(value="/idcheck/idcheck.html")
	public ModelAndView idcheck(String ID) {
		ModelAndView mav = new ModelAndView("home/idCheck");
		Integer cnt = loginCatalog.getIdCount(ID);
		if(cnt>0) mav.addObject("DUP", "YES");
		else mav.addObject("DUP", "NO");
		mav.addObject("ID", ID);
		return mav;
	}
}
