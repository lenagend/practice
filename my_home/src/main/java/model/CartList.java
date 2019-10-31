package model;

import java.util.ArrayList;

public class CartList {
	private ArrayList<String> codeList =
			new ArrayList<String>();//상품코드
	private ArrayList<String> titleList=
			new ArrayList<String>();//상품이름
	private ArrayList<Integer> priceList=
			new ArrayList<Integer>();//상품가격	
	private ArrayList<Integer> numList=
			new ArrayList<Integer>();//상품갯수

	
	public Integer getTotalAmount() {//총액
		Integer total = 0;
		for(int i=0; i<codeList.size(); i++) {
			total = total +(priceList.get(i)*numList.get(i));
		}
		return total;
		
	}
	
	public int getSize() {//장바구니의 총 상품 코드 갯수
		return codeList.size();
	}
	
	public void setCodeList(int index, String code) {
		this.codeList.add(index, code);
	}
	public void setTitleList(int index, String name) {
		this.titleList.add(index, name);
	}
	public void setPriceList(int index, Integer price) {
		this.priceList.add(index, price);
	}
	public void setNumList(int index, Integer num) {
		this.numList.add(index, num);
	}

	public String[] getCodeList() {
		return codeList.toArray(new String[codeList.size()]);
	}

	public String[] getTitleList() {
		return titleList.toArray(new String[titleList.size()]);
	}

	public Integer[] getPriceList() {
		return priceList.toArray(new Integer[priceList.size()]);
	}

	public Integer[] getNumList() {
		return numList.toArray(new Integer[numList.size()]);
	}
		
	
			
}	
