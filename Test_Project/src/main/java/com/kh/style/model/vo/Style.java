package com.kh.style.model.vo;

public class Style {

	private int memNo;
	private String hair;
	private String face;
	private String top;
	private String bottom;
	private String shoes;
    private String wall;
    private String floor;
    private String theme;

	public Style () {} // 기본생성자

	public Style(int memNo, String hair, String face, String top, String bottom, String shoes, String wall,
			String floor, String theme) {
		super();
		this.memNo = memNo;
		this.hair = hair;
		this.face = face;
		this.top = top;
		this.bottom = bottom;
		this.shoes = shoes;
		this.wall = wall;
		this.floor = floor;
		this.theme = theme;
	}

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

	public String getWall() {
		return wall;
	}

	public void setWall(String wall) {
		this.wall = wall;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	@Override
	public String toString() {
		return "Style [memNo=" + memNo + ", hair=" + hair + ", face=" + face + ", top=" + top + ", bottom=" + bottom
				+ ", shoes=" + shoes + ", wall=" + wall + ", floor=" + floor + ", theme=" + theme + "]";
	}

	
	
	
}
