package com.kh.board.model.vo;

import java.sql.Date;

public class Memo {

	private int memoNo;
	private int memoOwner;
	private int memoWriter;
	private String memoContent;
	private String memoDate;
	private String memoScope;
	private String profilePic;
	private Date memoCreateDate;
	private String memoStatus;
	private String nickname;
	
	
	public Memo() {}

	public Memo(int memoNo, int memoWriter, String memoContent, String memoScope, String profilePic, String memoStatus,
			String nickname) {
		super();
		this.memoNo = memoNo;
		this.memoWriter = memoWriter;
		this.memoContent = memoContent;
		this.memoScope = memoScope;
		this.profilePic = profilePic;
		this.memoStatus = memoStatus;
		this.nickname = nickname;
	}

	public Memo(int memoNo, int memoWriter, String memoContent, String memoDate, String memoScope, Date memoCreateDate,
			String memoStatus) {
		super();
		this.memoNo = memoNo;
		this.memoWriter = memoWriter;
		this.memoContent = memoContent;
		this.memoDate = memoDate;
		this.memoScope = memoScope;
		this.memoCreateDate = memoCreateDate;
		this.memoStatus = memoStatus;
	}

	public Memo(int memoNo, int memoWriter, String memoContent, String memoDate, String memoStatus) {
		super();
		this.memoNo = memoNo;
		this.memoWriter = memoWriter;
		this.memoContent = memoContent;
		this.memoDate = memoDate;
		this.memoStatus = memoStatus;
	}

	
	public Memo(int memoNo, int memoOwner, int memoWriter, String memoContent, String memoDate, String memoScope,
			String profilePic, Date memoCreateDate, String memoStatus, String nickname) {
		super();
		this.memoNo = memoNo;
		this.memoOwner = memoOwner;
		this.memoWriter = memoWriter;
		this.memoContent = memoContent;
		this.memoDate = memoDate;
		this.memoScope = memoScope;
		this.profilePic = profilePic;
		this.memoCreateDate = memoCreateDate;
		this.memoStatus = memoStatus;
		this.nickname = nickname;
	}

	public int getMemoOwner() {
		return memoOwner;
	}

	public void setMemoOwner(int memoOwner) {
		this.memoOwner = memoOwner;
	}

	public String getMemoScope() {
		return memoScope;
	}

	public void setMemoScope(String memoScope) {
		this.memoScope = memoScope;
	}

	public Date getMemoCreateDate() {
		return memoCreateDate;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setMemoCreateDate(Date memoCreateDate) {
		this.memoCreateDate = memoCreateDate;
	}

	public int getMemoNo() {
		return memoNo;
	}

	public void setMemoNo(int memoNo) {
		this.memoNo = memoNo;
	}

	public int getMemoWriter() {
		return memoWriter;
	}

	public void setMemoWriter(int memoWriter) {
		this.memoWriter = memoWriter;
	}

	public String getMemoContent() {
		return memoContent;
	}

	public void setMemoContent(String memoContent) {
		this.memoContent = memoContent;
	}

	public String getMemoDate() {
		return memoDate;
	}

	public void setMemoDate(String memoDate) {
		this.memoDate = memoDate;
	}

	public String getMemoStatus() {
		return memoStatus;
	}

	public void setMemoStatus(String memoStatus) {
		this.memoStatus = memoStatus;
	}

	@Override
	public String toString() {
		return "Memo [memoNo=" + memoNo + ", memoOwner=" + memoOwner + ", memoWriter=" + memoWriter + ", memoContent="
				+ memoContent + ", memoDate=" + memoDate + ", memoScope=" + memoScope + ", profilePic=" + profilePic
				+ ", memoCreateDate=" + memoCreateDate + ", memoStatus=" + memoStatus + ", nickname=" + nickname + "]";
	}


	
	
	
}
