package com.kh.posts.model.vo;

import java.sql.Date;

public class Post {
	
	private int postNum;
	private int postType;
	private String postTitle;
	private String postContent;
	private String postTag;
	private String postScope;
	private int postWriter;
	private int postCount;
	private String postRegdate;
	private Date postUpdate;
	private String postStatus;
	private String postBlock;
	private String postTitleColor;
	private int postTitleSize;
	private String postThumbnail;
	private int replyCount;
	
	public Post() {}

	public Post(int postNum, int postType, String postTitle, String postContent, String postTag, String postScope,
			int postWriter, int postCount, String postRegdate, Date postUpdate, String postStatus, String postBlock) {
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
	}
	
	public Post( String postTitle, String postContent, String postScope, String postThumbnail,int postNum,String postTag) {
		super();
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postScope = postScope;
		this.postThumbnail = postThumbnail;
		this.postNum = postNum;
		this.postTag = postTag;
	}
	
	public Post(int postNum, String postScope, String postTitle, int postCount, String postRegdate) {
		super();
		this.postNum = postNum;
		this.postTitle = postTitle;
		this.postScope = postScope;
		this.postCount = postCount;
		this.postRegdate = postRegdate;
	}
	
	public Post(String postContent) {
		super();
		this.postContent = postContent;
	}

	public int getPostTitleSize() {
		return postTitleSize;
	}

	public void setPostTitleSize(int postTitleSize) {
		this.postTitleSize = postTitleSize;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
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

	public int getPostWriter() {
		return postWriter;
	}

	public void setPostWriter(int postWriter) {
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

	public Date getPostUpdate() {
		return postUpdate;
	}

	public void setPostUpdate(Date postUpdate) {
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

	public String getPostTitleColor() {
		return postTitleColor;
	}

	public void setPostTitleColor(String postTitleColor) {
		this.postTitleColor = postTitleColor;
	}

	public String getPostThumbnail() {
		return postThumbnail;
	}

	public void setPostThumbnail(String postThumbnail) {
		this.postThumbnail = postThumbnail;
	}

	@Override
	public String toString() {
		return "Post [postNum=" + postNum + ", postType=" + postType + ", postTitle=" + postTitle + ", postContent="
				+ postContent + ", postTag=" + postTag + ", postScope=" + postScope + ", postWriter=" + postWriter
				+ ", postCount=" + postCount + ", postRegdate=" + postRegdate + ", postUpdate=" + postUpdate
				+ ", postStatus=" + postStatus + ", postBlock=" + postBlock + ", postTitleColor=" + postTitleColor
				+ ", postThumbnail=" + postThumbnail + "]";
	}
	
	

}
