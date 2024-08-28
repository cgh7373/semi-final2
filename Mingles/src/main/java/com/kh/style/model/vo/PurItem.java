package com.kh.style.model.vo;

public class PurItem {
	private int memNo;
	private int pItemNo;
	private int itemNo;
	private String itemCategory;
	private String itemName;
	private String fileName;
	
	public PurItem() {}

	public PurItem(int memNo, int pItemNo, int itemNo, String itemCategory, String itemName, String fileName) {
		super();
		this.memNo = memNo;
		this.pItemNo = pItemNo;
		this.itemNo = itemNo;
		this.itemCategory = itemCategory;
		this.itemName = itemName;
		this.fileName = fileName;
	}
	
	// itemInsertController 가방
	public PurItem(int memNo, int itemNo, String itemCategory, String itemName, String fileName) {
		super();
		this.memNo = memNo;
		this.itemNo = itemNo;
		this.itemCategory = itemCategory;
		this.itemName = itemName;
		this.fileName = fileName;
	}
	
	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getpItemNo() {
		return pItemNo;
	}

	public void setpItemNo(int pItemNo) {
		this.pItemNo = pItemNo;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "PurItem [memNo=" + memNo + ", pItemNo=" + pItemNo + ", itemNo=" + itemNo + ", itemCategory="
				+ itemCategory + ", itemName=" + itemName + ", fileName=" + fileName + "]";
	}
	
	
}
