package model;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CartDao;


@Service
public class Cart {
	@Autowired
	private CartDao cartDao;
	
	public void modifyItem(String code, Integer num, String id) {
		for (int cnt = 0; cnt < codeList.size(); cnt++) {
			if (codeList.get(cnt).equals(code)) {
				numList.set(cnt, num);		
				updateCart(code, num, id);
				
				return;
				
			}
		}

	}

	public void deleteItem(String code, String id) {
		for(int cnt = 0; cnt<codeList.size(); cnt++) {
			if(codeList.get(cnt).equals(code)) {
				codeList.remove(code);
			
		
				CartItem item = new CartItem();
				item.setId(id); item.setCode(code);
				cartDao.deleteCart(item);
				return;
			}
			
		}
	}
	
	private String id;

	public void setCodeList(int index, String code) {
		codeList.add(index,code);
	}
	public void setNumList(int index, Integer num) {
		numList.add(index, num);
	}
	
	private LinkedList<String> codeList =
			new LinkedList<String>();
	private LinkedList<Integer> numList =
			new LinkedList<Integer>();
	public void addCart(String code , int num, String id) {
		
		
		for(int i = 0; i<codeList.size(); i++) {
			
			if(codeList.get(i).equals(code)) {
				numList.set(i, numList.get(i)+num);
		
				updateCart(code, numList.get(i), id);
				
				return;
			}
		}
			codeList.add(code); numList.add(num);
	
			
			insertCart(code, num, id);

	}
	private void updateCart(String code, int num,String id) {
		
		CartItem item = new CartItem();
		
		item.setCode(code); item.setNum(num);
		item.setId(id);
		cartDao.updateCart(item);
		
	}
	
	private void insertCart(String code, int num, String id) {
	
		Integer seqno =cartDao.selectMaxCart();
		if(seqno==null) seqno=1;
		else seqno= seqno+1;
		CartItem item = new CartItem();
		item.setSeqno(seqno);
		item.setCode(code);
		item.setNum(num);
		item.setId(id);
		cartDao.insertCart(item);
	}
	
	public List<CartItem> getCart(String id){
		return this.cartDao.selectCart(id);
	}
	
}
