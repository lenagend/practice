package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.LoginDao;
import model.Cart;
import model.User;

@Controller
public class CartController {
	@Autowired
	private Cart cart;
	@Autowired
	private LoginDao loginDao;
	@RequestMapping(value="/cart/addCart.html")
	public ModelAndView addCart(String CODE, HttpSession session) {
		String id = (String)session.getAttribute("loginUser");
		if(id==null) {
			ModelAndView mav = new ModelAndView("redirect:/cart/login.html");
			mav.addObject("RESULT","nologin");
			return mav;
		}
		Cart cart =(Cart)session.getAttribute("CART");
		if(cart ==null) cart= this.cart;
		cart.addCart(CODE, 1,id);
		session.setAttribute("CART", cart);
		ModelAndView mav = new ModelAndView("home/addCartResult");
		mav.addObject("ITEM_NUM", 1);
		return mav;
	}
	
	@RequestMapping(value="/cart/login.html")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("home/cartLogin");
		mav.addObject("RESULT", "nocart");
		mav.addObject(new User());
		return mav;
	}
	
	
	
	
}
