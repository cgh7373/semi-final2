package com.kh.admin.model.vo;

public class Notice {

	private String title;
	private String content;
	private String savePath;
	private String writer;
	
	public Notice () {}

	public Notice(String title, String content, String savePath, String writer) {
		super();
		this.title = title;
		this.content = content;
		this.savePath = savePath;
		this.writer = writer;
	}

	
	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	@Override
	public String toString() {
		return "Notice [title=" + title + ", content=" + content + ", savePath=" + savePath + "]";
	}
	
	
}
