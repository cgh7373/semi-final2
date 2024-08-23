package com.kh.chat.model.vo;

import java.sql.Date;

public class Chat {
	
	private int chatId; // 채팅방번호
	private String fromNickname; // 로그인한 사람의 회원번호
	private String toNickname; // 상대방의 회원번호
	private String chatContent;
	private String chatTime;
	
	public Chat() {}

	public Chat(int chatId, String fromNickname, String toNickname, String chatContent, String chatTime) {
		super();
		this.chatId = chatId;
		this.fromNickname = fromNickname;
		this.toNickname = toNickname;
		this.chatContent = chatContent;
		this.chatTime = chatTime;
	}

	public int getChatId() {
		return chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public String getFromNickname() {
		return fromNickname;
	}

	public void setFromNickname(String fromNickname) {
		this.fromNickname = fromNickname;
	}

	public String getToNickname() {
		return toNickname;
	}

	public void setToNickname(String toNickname) {
		this.toNickname = toNickname;
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
		return "chat [chatId=" + chatId + ", fromNickname=" + fromNickname + ", toNickname=" + toNickname
				+ ", chatContent=" + chatContent + ", chatTime=" + chatTime + "]";
	}
	
}
