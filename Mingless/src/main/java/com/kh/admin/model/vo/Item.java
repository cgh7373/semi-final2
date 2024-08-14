package com.kh.admin.model.vo;

import java.sql.Date;

public class Item {
	private int itemNo;
	private String itemCategory;
	private String itemName;
	private int price;
	private String itemExplan;
	private Date itemEnrollDate;
	private Date itemUpdate;
	private String itemStatus;
	private String saveFile;
	
	public Item () {}

	public Item(int itemNo, String itemCategory, String itemName, int price, String itemExplan, Date itemEnrollDate,
			Date itemUpdate, String itemStatus, String saveFile) {
		super();
		this.itemNo = itemNo;
		this.itemCategory = itemCategory;
		this.itemName = itemName;
		this.price = price;
		this.itemExplan = itemExplan;
		this.itemEnrollDate = itemEnrollDate;
		this.itemUpdate = itemUpdate;
		this.itemStatus = itemStatus;
		this.saveFile = saveFile;
	}
	
	

	public Item(int itemNo, String itemCategory, String itemName, int price, String itemExplan, Date itemEnrollDate,
			String itemStatus, String saveFile) {
		super();
		this.itemNo = itemNo;
		this.itemCategory = itemCategory;
		this.itemName = itemName;
		this.price = price;
		this.itemExplan = itemExplan;
		this.itemEnrollDate = itemEnrollDate;
		this.itemStatus = itemStatus;
		this.saveFile = saveFile;
	}
	
	public String getSaveFile() {
		return saveFile;
	}
	
	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getItemCategory() {
		return itemCategory;
	}

	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getItemExplan() {
		return itemExplan;
	}

	public void setItemExplan(String itemExplan) {
		this.itemExplan = itemExplan;
	}

	public Date getItemEnrollDate() {
		return itemEnrollDate;
	}

	public void setItemEnrollDate(Date itemEnrollDate) {
		this.itemEnrollDate = itemEnrollDate;
	}

	public Date getItemUpdate() {
		return itemUpdate;
	}

	public void setItemUpdate(Date itemUpdate) {
		this.itemUpdate = itemUpdate;
	}

	public String getItemStatus() {
		return itemStatus;
	}

	public void setItemStatus(String itemStatus) {
		this.itemStatus = itemStatus;
	}

	@Override
	public String toString() {
		return "Item [itemNo=" + itemNo + ", itemCategory=" + itemCategory + ", itemName=" + itemName + ", price="
				+ price + ", itemExplan=" + itemExplan + ", itemEnrollDate=" + itemEnrollDate + ", itemUpdate="
				+ itemUpdate + ", itemStatus=" + itemStatus + ", saveFile=" + saveFile + "]";
	}

	
	
}
