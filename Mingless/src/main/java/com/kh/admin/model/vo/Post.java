package com.kh.admin.model.vo;


public class Post {
	private int postNum;
	private int postType;
	private String postTitle;
	private String postContent;
	private String postTag;
	private String postScope;
	private String postWriter;
	private int postCount;
	private String postRegdate;
	private String postUpdate;
	private String postStatus;
	private String postBlock;
	private String postAttachment;
	
	public Post () {}

	public Post(int postNum, int postType, String postTitle, String postContent, String postTag, String postScope,
			String postWriter, int postCount, String postRegdate, String postUpdate, String postStatus,
			String postBlock, String postAttachment) {
		super();
		this.postNum = postNum;
		this.postType = postType;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postTag = postTag;
		this.postScope = postScope;
		this.postWriter = postWriter;
		this.postCount = postCount;
		this.postRegdate = postRegdate;
		this.postUpdate = postUpdate;
		this.postStatus = postStatus;
		this.postBlock = postBlock;
		this.postAttachment = postAttachment;
	}
	
	

	public Post(int postNum, int postType, String postTitle, String postContent, String postTag, String postScope,
			String postWriter, int postCount, String postRegdate, String postAttachment, String postBlock) {
		super();
		this.postNum = postNum;
		this.postType = postType;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postTag = postTag;
		this.postScope = postScope;
		this.postWriter = postWriter;
		this.postCount = postCount;
		this.postRegdate = postRegdate;
		this.postAttachment = postAttachment;
		this.postBlock = postBlock;
	}
	
	

	public Post(int postNum, int postType, String postTitle, String postContent, String postTag, String postScope,
			String postWriter, int postCount, String postRegdate, String postStatus, String postBlock,
			String postAttachment) {
		super();
		this.postNum = postNum;
		this.postType = postType;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postTag = postTag;
		this.postScope = postScope;
		this.postWriter = postWriter;
		this.postCount = postCount;
		this.postRegdate = postRegdate;
		this.postStatus = postStatus;
		this.postBlock = postBlock;
		this.postAttachment = postAttachment;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public int getPostType() {
		return postType;
	}

	public void setPostType(int postType) {
		this.postType = postType;
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

	public String getPostTag() {
		return postTag;
	}

	public void setPostTag(String postTag) {
		this.postTag = postTag;
	}

	public String getPostScope() {
		return postScope;
	}

	public void setPostScope(String postScope) {
		this.postScope = postScope;
	}

	public String getPostWriter() {
		return postWriter;
	}

	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}

	public int getPostCount() {
		return postCount;
	}

	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}

	public String getPostRegdate() {
		return postRegdate;
	}

	public void setPostRegdate(String postRegdate) {
		this.postRegdate = postRegdate;
	}

	public String getPostUpdate() {
		return postUpdate;
	}

	public void setPostUpdate(String postUpdate) {
		this.postUpdate = postUpdate;
	}

	public String getPostStatus() {
		return postStatus;
	}

	public void setPostStatus(String postStatus) {
		this.postStatus = postStatus;
	}

	public String getPostBlock() {
		return postBlock;
	}

	public void setPostBlock(String postBlock) {
		this.postBlock = postBlock;
	}

	public String getPostAttachment() {
		return postAttachment;
	}

	public void setPostAttachment(String postAttachment) {
		this.postAttachment = postAttachment;
	}

	@Override
	public String toString() {
		return "Post [postNum=" + postNum + ", postType=" + postType + ", postTitle=" + postTitle + ", postContent="
				+ postContent + ", postTag=" + postTag + ", postScope=" + postScope + ", postWriter=" + postWriter
				+ ", postCount=" + postCount + ", postRegdate=" + postRegdate + ", postUpdate=" + postUpdate
				+ ", postStatus=" + postStatus + ", postBlock=" + postBlock + ", postAttachment=" + postAttachment
				+ "]";
	}
	
	
	
	
}