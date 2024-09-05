package com.kh.common.model.vo;

import java.util.ArrayList;

import com.kh.item.model.vo.Item;

public class ItemListResponse {
	// JSON으로 jsp에 응답 시 ArrayList<Item>과 PageInfo를 같이 담아서 보내기 위해 만든 클래스입니당
	// ArrayList<Item>만 넣었지만 다른거 넣어도 괜찮을 것 같습니다
	
	private PageInfo pi;
	private ArrayList<Item> list;
	
	public ItemListResponse () {};

	public ItemListResponse(PageInfo pi, ArrayList<Item> list) {
		super();
		this.pi = pi;
		this.list = list;
	}

	public PageInfo getPi() {
		return pi;
	}

	public void setPi(PageInfo pi) {
		this.pi = pi;
	}

	public ArrayList<Item> getList() {
		return list;
	}

	public void setList(ArrayList<Item> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "ItemListResponse [pi=" + pi + ", list=" + list + "]";
	};
	
}
