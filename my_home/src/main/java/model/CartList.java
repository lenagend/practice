package model;

import java.util.ArrayList;

public class CartList {
	private ArrayList<String> codeList =
			new ArrayList<String>();//��ǰ�ڵ�
	private ArrayList<String> titleList=
			new ArrayList<String>();//��ǰ�̸�
	private ArrayList<Integer> priceList=
			new ArrayList<Integer>();//��ǰ����	
	private ArrayList<Integer> numList=
			new ArrayList<Integer>();//��ǰ����

	
	public Integer getTotalAmount() {//�Ѿ�
		Integer total = 0;
		for(int i=0; i<codeList.size(); i++) {
			total = total +(priceList.get(i)*numList.get(i));
		}
		return total;
		
	}
	
	public int getSize() {//��ٱ����� �� ��ǰ �ڵ� ����
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
