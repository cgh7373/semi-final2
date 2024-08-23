package com.kh.chat.model.vo;

public class Chatting {
	
	private int chattingNo; // 채팅방번호
	private String chCreateDate; // 채팅방 생성일
	private int openMember; // 로그인한사람의 회원번호
	private int participant; // 친구의 회원번호
	
	public Chatting () {}

	public Chatting(int chattingNo, String chCreateDate, int openMember, int participant) {
		super();
		this.chattingNo = chattingNo;
		this.chCreateDate = chCreateDate;
		this.openMember = openMember;
		this.participant = participant;
	}

	public int getChattingNo() {
		return chattingNo;
	}

	public void setChattingNo(int chattingNo) {
		this.chattingNo = chattingNo;
	}

	public String getChCreateDate() {
		return chCreateDate;
	}

	public void setChCreateDate(String chCreateDate) {
		this.chCreateDate = chCreateDate;
	}

	public int getOpenMember() {
		return openMember;
	}

	public void setOpenMember(int openMember) {
		this.openMember = openMember;
	}

	public int getParticipant() {
		return participant;
	}

	public void setParticipant(int participant) {
		this.participant = participant;
	}

	@Override
	public String toString() {
		return "Chatting [chattingNo=" + chattingNo + ", chCreateDate=" + chCreateDate + ", openMember=" + openMember
				+ ", participant=" + participant + "]";
	}

}
