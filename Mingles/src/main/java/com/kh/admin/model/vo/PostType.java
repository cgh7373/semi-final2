package com.kh.admin.model.vo;

public class PostType {

	private int postTypeNo;
	private String postTypeName;
	
	public PostType () {}

	public PostType(int postTypeNo, String postTypeName) {
		super();
		this.postTypeNo = postTypeNo;
		this.postTypeName = postTypeName;
	}

	public int getPostTypeNo() {
		return postTypeNo;
	}

	public void setPostTypeNo(int postTypeNo) {
		this.postTypeNo = postTypeNo;
	}

	public String getPostTypeName() {
		return postTypeName;
	}

	public void setPostTypeName(String postTypeName) {
		this.postTypeName = postTypeName;
	}

	@Override
	public String toString() {
		return "PostType [postTypeNo=" + postTypeNo + ", postTypeName=" + postTypeName + "]";
	}
	
	
	
}
