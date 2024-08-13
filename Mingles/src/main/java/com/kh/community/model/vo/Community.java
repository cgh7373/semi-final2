package com.kh.community.model.vo;

public class Community {
	
	private int postNum;
	private int homeId;
	private String postTitle;
	private String postContent;
	private String tagging;
	private String postScope;
	private String regdate;
	private String postUpdate;
	private String postBlock;
	private String postStatus;
	private int postCount;
	
	public Community() {}

	public Community(int postNum, int homeId, String postTitle, String postContent, String tagging, String postScope,
			String regdate, String postUpdate, String postBlock, String postStatus, int postCount) {
		super();
		this.postNum = postNum;
		this.homeId = homeId;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.tagging = tagging;
		this.postScope = postScope;
		this.regdate = regdate;
		this.postUpdate = postUpdate;
		this.postBlock = postBlock;
		this.postStatus = postStatus;
		this.postCount = postCount;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public int getHomeId() {
		return homeId;
	}

	public void setHomeId(int homeId) {
		this.homeId = homeId;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getTagging() {
		return tagging;
	}

	public void setTagging(String tagging) {
		this.tagging = tagging;
	}

	public String getPostScope() {
		return postScope;
	}

	public void setPostScope(String postScope) {
		this.postScope = postScope;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getPostUpdate() {
		return postUpdate;
	}

	public void setPostUpdate(String postUpdate) {
		this.postUpdate = postUpdate;
	}

	public String getPostBlock() {
		return postBlock;
	}

	public void setPostBlock(String postBlock) {
		this.postBlock = postBlock;
	}

	public String getPostStatus() {
		return postStatus;
	}

	public void setPostStatus(String postStatus) {
		this.postStatus = postStatus;
	}

	public int getPostCount() {
		return postCount;
	}

	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}

	@Override
	public String toString() {
		return "Community [postNum=" + postNum + ", homeId=" + homeId + ", postTitle=" + postTitle + ", postContent="
				+ postContent + ", tagging=" + tagging + ", postScope=" + postScope + ", regdate=" + regdate
				+ ", postUpdate=" + postUpdate + ", postBlock=" + postBlock + ", postStatus=" + postStatus
				+ ", postCount=" + postCount + "]";
	}
}
