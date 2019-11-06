package controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import logic.LoginCatalog;
import model.Cart;
import model.CartItem;
import model.User;

@Controller
public class LoginController {
	@Autowired
	private LoginCatalog loginCatalog;
	@Autowired
	private Cart cart;
	
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
			
			//DB에서 카트 정보를 불러온다
			List<CartItem> cartList = cart.getCart(user.getUser_id());
			if(cartList != null) {
				Iterator it = cartList.iterator();
				int i = 0;
				while(it.hasNext()) {
					CartItem ci =(CartItem)it.next();
					this.cart.setCodeList(i, ci.getCode());
					this.cart.setNumList(i, ci.getNum());
					i++;
				}
				session.setAttribute("CART", this.cart);
				
			}
			
			//DB에서 카트정보를 불러온다
			mav.addObject("imageLogin","SUCCESS");
			mav.addObject("BODY","loginResult.jsp");
			
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="/login/imageLogin.html")
	public ModelAndView imageLogin(
			@Valid  User user,
			BindingResult br, HttpSession session) {
		ModelAndView mav = new ModelAndView("home/login");
		if(br.hasErrors()) {
			return mav;
		}
		String password =loginCatalog.getPassword(
				user.getUser_id());
		if(password == null || 
			!user.getPassword().equals(password)) {
			mav.addObject("MSG1","YES");
			mav.setViewName("home/loginResult");
		}else {
			session.setAttribute("loginUser",
					user.getUser_id());
			//DB에서 카트 정보를 불러온다.시작
			List<CartItem> cartList=cart.getCart(
					user.getUser_id());
			if(cartList != null) {
				Iterator it=cartList.iterator();
				int i=0;
				while(it.hasNext()) {
					CartItem ci=(CartItem)it.next();
					this.cart.setCodeList(i, ci.getCode());
					this.cart.setNumList(i, ci.getNum());
					i++;
				}
				session.setAttribute("CART", this.cart);
			}
			//DB에서 카트 정보를 불러온다. 종료
			mav.addObject("imageLogin","SUCCESS");
			mav.setViewName("home/loginResult");
		}
		return mav;
	}
	
	
	
	
	
	
	
	
	
}
