package com.kh.chat.model.vo;

import java.sql.Date;
import java.util.Objects;

public class Message {
	
	 private int messageNo; // 메세지 번호
	 private String messageContent; // 메세지 내용
	 private String readFl; // 읽음 여부 표시
	 private Date sendTime; // 보낸 시간
	 private int senderNo; // 보낸사람
	 private int chattingNo;// 채팅 번호 == 본인 번호로 하고싶음 따흑?
	
	 public Message() {}

	public Message(int messageNo, String messageContent, String readFl, Date sendTime, int senderNo, int chattingNo) {
		super();
		this.messageNo = messageNo;
		this.messageContent = messageContent;
		this.readFl = readFl;
		this.sendTime = sendTime;
		this.senderNo = senderNo;
		this.chattingNo = chattingNo;
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public String getReadFl() {
		return readFl;
	}

	public void setReadFl(String readFl) {
		this.readFl = readFl;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public int getSenderNo() {
		return senderNo;
	}

	public void setSenderNo(int senderNo) {
		this.senderNo = senderNo;
	}

	public int getChattingNo() {
		return chattingNo;
	}

	public void setChattingNo(int chattingNo) {
		this.chattingNo = chattingNo;
	}

	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", messageContent=" + messageContent + ", readFl=" + readFl
				+ ", sendTime=" + sendTime + ", senderNo=" + senderNo + ", chattingNo=" + chattingNo + "]";
	}

}
