package com.kh.posts.model.vo;

import java.sql.Date;

public class Reply {

	private int replyNo;
	private int replyOwnPost;
	private int replyWriter;
	private String replyContent;
	private String replyScope;
	private Date replyCreateDate;
	private String replyStatus;
	private String replyDate;
	
	public Reply() {}

	public Reply(int replyNo, int replyOwnPost, int replyWriter, String replyContent, String replyScope,
			Date replyCreateDate, String replyStatus) {
		super();
		this.replyNo = replyNo;
		this.replyOwnPost = replyOwnPost;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.replyScope = replyScope;
		this.replyCreateDate = replyCreateDate;
		this.replyStatus = replyStatus;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	public Reply(int replyNo, int replyOwnPost, int replyWriter, String replyContent, String replyScope,
			Date replyCreateDate, String replyStatus, String replyDate) {
		super();
		this.replyNo = replyNo;
		this.replyOwnPost = replyOwnPost;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.replyScope = replyScope;
		this.replyCreateDate = replyCreateDate;
		this.replyStatus = replyStatus;
		this.replyDate = replyDate;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getReplyOwnPost() {
		return replyOwnPost;
	}

	public void setReplyOwnPost(int replyOwnPost) {
		this.replyOwnPost = replyOwnPost;
	}

	public int getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(int replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyScope() {
		return replyScope;
	}

	public void setReplyScope(String replyScope) {
		this.replyScope = replyScope;
	}

	public Date getReplyCreateDate() {
		return replyCreateDate;
	}

	public void setReplyCreateDate(Date replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyOwnPost=" + replyOwnPost + ", replyWriter=" + replyWriter
				+ ", replyContent=" + replyContent + ", replyScope=" + replyScope + ", replyCreateDate="
				+ replyCreateDate + ", replyStatus=" + replyStatus + "]";
	}
	
	
}
