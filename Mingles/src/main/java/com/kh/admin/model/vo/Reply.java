package com.kh.admin.model.vo;

public class Reply {

	private int reply_no;
	private int replyOwnPost;
	private String replyWriter;
	private String replyContent;
	private String replyScope;
	private String replyCreateDate;
	private String replyStatus;
	
	public Reply () {}

	public Reply(int reply_no, int replyOwnPost, String replyWriter, String replyContent, String replyScope,
			String replyCreateDate, String replyStatus) {
		super();
		this.reply_no = reply_no;
		this.replyOwnPost = replyOwnPost;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.replyScope = replyScope;
		this.replyCreateDate = replyCreateDate;
		this.replyStatus = replyStatus;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public int getReplyOwnPost() {
		return replyOwnPost;
	}

	public void setReplyOwnPost(int replyOwnPost) {
		this.replyOwnPost = replyOwnPost;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
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

	public String getReplyCreateDate() {
		return replyCreateDate;
	}

	public void setReplyCreateDate(String replyCreateDate) {
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
		return "Reply [reply_no=" + reply_no + ", replyOwnPost=" + replyOwnPost + ", replyWriter=" + replyWriter
				+ ", replyContent=" + replyContent + ", replyScope=" + replyScope + ", replyCreateDate="
				+ replyCreateDate + ", replyStatus=" + replyStatus + "]";
	}
	
	
}
