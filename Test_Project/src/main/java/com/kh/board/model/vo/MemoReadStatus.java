package com.kh.board.model.vo;

public class MemoReadStatus {

	private int readNo;
	private int ownerNo;
	private int readYear;
	private int readMonth;
	private String readDate;
	private String readStatus;
	
	public MemoReadStatus() {}

	public MemoReadStatus(int readNo, int ownerNo, int readYear, int readMonth, String readDate, String readStatus) {
		super();
		this.readNo = readNo;
		this.ownerNo = ownerNo;
		this.readYear = readYear;
		this.readMonth = readMonth;
		this.readDate = readDate;
		this.readStatus = readStatus;
	}

	public int getReadNo() {
		return readNo;
	}

	public void setReadNo(int readNo) {
		this.readNo = readNo;
	}

	public int getOwnerNo() {
		return ownerNo;
	}

	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}

	public int getReadYear() {
		return readYear;
	}

	public void setReadYear(int readYear) {
		this.readYear = readYear;
	}

	public int getReadMonth() {
		return readMonth;
	}

	public void setReadMonth(int readMonth) {
		this.readMonth = readMonth;
	}

	public String getReadDate() {
		return readDate;
	}

	public void setReadDate(String readDate) {
		this.readDate = readDate;
	}

	public String getReadStatus() {
		return readStatus;
	}

	public void setReadStatus(String readStatus) {
		this.readStatus = readStatus;
	}

	@Override
	public String toString() {
		return "MemoReadStatus [readNo=" + readNo + ", ownerNo=" + ownerNo + ", readYear=" + readYear + ", readMonth="
				+ readMonth + ", readDate=" + readDate + ", readStatus=" + readStatus + "]";
	}

	
	
	
}
