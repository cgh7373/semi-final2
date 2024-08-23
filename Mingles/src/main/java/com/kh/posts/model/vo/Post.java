package com.kh.posts.model.vo;

public class Post 
{
	 private int postNum;
	 private int postType;
	 private String postTitle;
	 private String postContent;
	 private String postTag;
	 private String postScope;
	 private String postWriter;
	 private int count;
	 private String postRegdate; 
	 private String postUpdate;
	 private char postStatus;
	 private char postBlock;
	 
	 public Post() {}

	public Post(int postNum, int postType, String postTitle, String postContent, String postTag, String postScope,
			String postWriter, int count, String postRegdate, String postUpdate, char postStatus, char postBlock) {
		super();
		this.postNum = postNum;
		this.postType = postType;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postTag = postTag;
		this.postScope = postScope;
		this.postWriter = postWriter;
		this.count = count;
		this.postRegdate = postRegdate;
		this.postUpdate = postUpdate;
		this.postStatus = postStatus;
		this.postBlock = postBlock;
	}
	


	public Post(int postNum, String postTitle, String postTag, int count, String postRegdate) {
		super();
		this.postNum = postNum;
		this.postTitle = postTitle;
		this.postTag = postTag;
		this.count = count;
		this.postRegdate = postRegdate;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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

	public char getPostStatus() {
		return postStatus;
	}

	public void setPostStatus(char postStatus) {
		this.postStatus = postStatus;
	}

	public char getPostBlock() {
		return postBlock;
	}

	public void setPostBlock(char postBlock) {
		this.postBlock = postBlock;
	}

	@Override
	public String toString() {
		return "Post [postNum=" + postNum + ", postType=" + postType + ", postTitle=" + postTitle + ", postContent="
				+ postContent + ", postTag=" + postTag + ", postScope=" + postScope + ", postWriter=" + postWriter
				+ ", count=" + count + ", postRegdate=" + postRegdate + ", postUpdate=" + postUpdate + ", postStatus="
				+ postStatus + ", postBlock=" + postBlock + "]";
	}
	 
}
