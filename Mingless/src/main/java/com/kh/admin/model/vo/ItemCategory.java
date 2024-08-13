package com.kh.admin.model.vo;

public class ItemCategory {
	
	private String categoryNo;
	private String categoryName;
	
	public ItemCategory() {}

	public ItemCategory(String categoryNo, String categoryName) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "ItemCategory [categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}

	
	
}
