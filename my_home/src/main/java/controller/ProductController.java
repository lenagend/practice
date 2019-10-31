package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ItemCatalog;
import model.Item;
import model.User;

@Controller
public class ProductController {
	@Autowired
	private ItemCatalog itemCatalog;
	
	@RequestMapping(value="/product/open.html")
	public ModelAndView open() {
		ModelAndView mav = new ModelAndView("home/frame");
		mav.addObject(new Item());
		mav.addObject("BODY", "itemInput.jsp");
		return mav;
	
	}
	@RequestMapping(value="/product/entry.html")
	public ModelAndView entry(@Valid Item item, BindingResult br, HttpSession session) {
		ModelAndView mav = new ModelAndView("home/frame");
		if(br.hasErrors()) {
			mav.addObject("BODY", "itemInput.jsp");
			return mav;
		}
		String id = (String)session.getAttribute("loginUser");
		if(id == null) {
			mav.addObject("BODY", "nologin.jsp");
			mav.addObject("RESULT", "product_nobody");
			mav.addObject(new User());
			return mav;
		}else {
			itemCatalog.putItem(item);
			return new ModelAndView("redirect:/read/product.html");
		}
	}
}
