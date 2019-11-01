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

import dao.LoginDao;
import model.Cart;
import model.CartItem;
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
	
	@RequestMapping(value="/cart/login.html", method=RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("home/cartLogin");
		mav.addObject("RESULT", "nocart");
		mav.addObject(new User());
		return mav;
	}
	
	
	@RequestMapping(value="/cart/login.html", method=RequestMethod.POST)
	public ModelAndView cartLogin(@Valid User user, BindingResult br, HttpSession session) {
		if(br.hasErrors()) {
			ModelAndView mav = new ModelAndView("home/cartLogin");
			return mav;
		}
		ModelAndView mav = new ModelAndView("home/loginResult");
		String password = loginDao.getPassword(user.getUser_id());
		if( !user.getPassword().equals(password)) {
			mav.addObject("cartLogin","YES"); return mav;
		}else {
			mav.addObject("cartLogin", "SUCCESS");
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
		}
		return mav;
	}
	
	@RequestMapping(value="/cart/show.html")
	public ModelAndView show(HttpSession session) {
		ModelAndView mav = new ModelAndView("home/frame");
		String id = (String)session.getAttribute("loginUser");
		if(id == null)return mav;
		List<CartItem> cartList = cart.getCart(id);
		int totalAmount = 0;
		if(cartList.size()>0) {
			Iterator it = cartList.iterator();
			while(it.hasNext()) {
				CartItem ci = (CartItem)it.next();
				int total = ci.getPrice()*ci.getNum();
				totalAmount = totalAmount+total;
				
			}
			mav.addObject("SIZE","YES");
		}else {//장바구니에 상품이 없는경우
			mav.addObject("SIZE","NO");
			
		}
		mav.addObject("totalAmount",totalAmount);
		mav.addObject("BODY", "cartListView.jsp");
		mav.addObject("CART_LIST", cartList);
		return mav;
	}
	
	@RequestMapping(value="/cart/modify.html")
	public ModelAndView modify(String CODE, Integer NUMBER, String BTN,
			HttpSession session) {
	
		String id = (String)session.getAttribute("loginUser");
		if(BTN.equals("수정")) {
			cart.modifyItem(CODE, NUMBER, id);
			
		}else if(BTN.equals("삭제")) {
			cart.deleteItem(CODE, id);
			
		}
	
		return new ModelAndView("redirect:/cart/show.html");
		
	}
	
	
}






