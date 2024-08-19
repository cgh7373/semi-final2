package com.kh.style.model.vo;

public class Style {

	private int memNo;
	private String hair;
	private String face;
	private String top;
	private String bottom;
	private String shoes;
	
	public Style () {} // 기본생성자

	// 매개변수 생성자 
	public Style(int memNo, String hair, String face, String top, String bottom, String shoes) {
		super();
		this.memNo = memNo;
		this.hair = hair;
		this.face = face;
		this.top = top;
		this.bottom = bottom;
		this.shoes = shoes;
	}

	// getter-setter
	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getHair() {
		return hair;
	}

	public void setHair(String hair) {
		this.hair = hair;
	}

	public String getFace() {
		return face;
	}

	public void setFace(String face) {
		this.face = face;
	}

	public String getTop() {
		return top;
	}

	public void setTop(String top) {
		this.top = top;
	}

	public String getBottom() {
		return bottom;
	}

	public void setBottom(String bottom) {
		this.bottom = bottom;
	}

	public String getShoes() {
		return shoes;
	}

	public void setShoes(String shoes) {
		this.shoes = shoes;
	}

	@Override
	public String toString() {
		return "Style [memNo=" + memNo + ", hair=" + hair + ", face=" + face + ", top=" + top + ", bottom=" + bottom
				+ ", shoes=" + shoes + "]";
	}; 
	
	
	
}
