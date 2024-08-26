package com.kh.chat.model.vo;

import java.sql.Date;

public class Chat {
	
	private int chatId; // 채팅방번호
	private int fromNo; // 로그인한 사람의 회원번호
	private int toNo; // 상대방의 회원번호
	private String chatContent; // 채팅 내용
	private String chatTime; // 보낸 시간
	
	public Chat() {}

	public Chat(int chatId, int fromNo, int toNo, String chatContent, String chatTime) {
		super();
		this.chatId = chatId;
		this.fromNo = fromNo;
		this.toNo = toNo;
		this.chatContent = chatContent;
		this.chatTime = chatTime;
	}

	public Chat(int chatId, String chatContent) {
		super();
		this.chatId = chatId;
		this.chatContent = chatContent;
	}

	public int getChatId() {
		return chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public int getFromNo() {
		return fromNo;
	}

	public void setFromNo(int fromNo) {
		this.fromNo = fromNo;
	}

	public int getToNo() {
		return toNo;
	}

	public void setToNo(int toNo) {
		this.toNo = toNo;
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
		return "Chat [chatId=" + chatId + ", fromNo=" + fromNo + ", toNo=" + toNo + ", chatContent=" + chatContent
				+ ", chatTime=" + chatTime + "]";
	}
	
}
