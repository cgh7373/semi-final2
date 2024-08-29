package com.kh.admin.model.vo;

public class Chat {


	private int chatId; // 채팅방번호
	private String fromNo; // 로그인한 사람의 회원번호
	private String toNo; // 상대방의 회원번호
	private String toNoprofile; // 상대방의 프로필
	private String chatContent; // 채팅 내용
	private String chatTime; // 보낸 시간


	public Chat () {}


	public Chat(int chatId, String fromNo, String toNo, String toNoprofile, String chatContent, String chatTime) {
		super();
		this.chatId = chatId;
		this.fromNo = fromNo;
		this.toNo = toNo;
		this.toNoprofile = toNoprofile;
		this.chatContent = chatContent;
		this.chatTime = chatTime;
	}


	public int getChatId() {
		return chatId;
	}


	public void setChatId(int chatId) {
		this.chatId = chatId;
	}


	public String getFromNo() {
		return fromNo;
	}


	public void setFromNo(String fromNo) {
		this.fromNo = fromNo;
	}


	public String getToNo() {
		return toNo;
	}


	public void setToNo(String toNo) {
		this.toNo = toNo;
	}


	public String getToNoprofile() {
		return toNoprofile;
	}


	public void setToNoprofile(String toNoprofile) {
		this.toNoprofile = toNoprofile;
	}


	public String getChatContent() {
		return chatContent;
	}


	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}


	public String getChatTime() {
		return chatTime;
	}


	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}


	@Override
	public String toString() {
		return "Chat [chatId=" + chatId + ", fromNo=" + fromNo + ", toNo=" + toNo + ", toNoprofile=" + toNoprofile
				+ ", chatContent=" + chatContent + ", chatTime=" + chatTime + "]";
	}

	
	
}
