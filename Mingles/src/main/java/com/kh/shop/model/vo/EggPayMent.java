package com.kh.shop.model.vo;

import java.sql.Date;

public class EggPayMent {

	private int payNo;
	private int memNo;
	private int price;
	private int point;
	private String payOption;
	private String payDate;
	private String status;
	private String category;
	
	public EggPayMent() {}

	public EggPayMent(int payNo, int memNo, int price, int point, String payOption, String payDate, String status,
			String category) {
		super();
		this.payNo = payNo;
		this.memNo = memNo;
		this.price = price;
		this.point = point;
		this.payOption = payOption;
		this.payDate = payDate;
		this.status = status;
		this.category = category;
	}

	public EggPayMent(int payNo, int memNo, int price, int point, String payOption, String payDate, String category) {
		super();
		this.payNo = payNo;
		this.memNo = memNo;
		this.price = price;
		this.point = point;
		this.payOption = payOption;
		this.payDate = payDate;
		this.category = category;
	}
	
	public EggPayMent(int memNo, int price, int point, String payOption, String category) {
		super();
		this.memNo = memNo;
		this.price = price;
		this.point = point;
		this.payOption = payOption;
		this.category = category;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getPayOption() {
		return payOption;
	}

	public void setPayOption(String payOption) {
		this.payOption = payOption;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "EggPayMent [payNo=" + payNo + ", memNo=" + memNo + ", price=" + price + ", point=" + point
				+ ", payOption=" + payOption + ", payDate=" + payDate + ", status=" + status + ", category=" + category
				+ "]";
	}
	
	
	
	
	
}
