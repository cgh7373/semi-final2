package com.kh.shop.model.vo;

public class Shop {

	 private int shopNo;
	 private int shopCategory;
	 private String shopPic;
	 private String shopTitle;
	 private String shopDes;
	 private String shopDate;
	 private int memNo;
	 private String memId;
	 private String nickname;
	
	 public Shop () {};

	public Shop(int shopNo, int shopCategory, String shopPic, String shopTitle, String shopDes, String shopDate,
			int memNo, String memId, String nickname) {
		super();
		this.shopNo = shopNo;
		this.shopCategory = shopCategory;
		this.shopPic = shopPic;
		this.shopTitle = shopTitle;
		this.shopDes = shopDes;
		this.shopDate = shopDate;
		this.memNo = memNo;
		this.memId = memId;
		this.nickname = nickname;
	}

	public int getShopNo() {
		return shopNo;
	}

	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}

	public int getShopCategory() {
		return shopCategory;
	}

	public void setShopCategory(int shopCategory) {
		this.shopCategory = shopCategory;
	}

	public String getShopPic() {
		return shopPic;
	}

	public void setShopPic(String shopPic) {
		this.shopPic = shopPic;
	}

	public String getShopTitle() {
		return shopTitle;
	}

	public void setShopTitle(String shopTitle) {
		this.shopTitle = shopTitle;
	}

	public String getShopDes() {
		return shopDes;
	}

	public void setShopDes(String shopDes) {
		this.shopDes = shopDes;
	}

	public String getShopDate() {
		return shopDate;
	}

	public void setShopDate(String shopDate) {
		this.shopDate = shopDate;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "Shop [shopNo=" + shopNo + ", shopCategory=" + shopCategory + ", shopPic=" + shopPic + ", shopTitle="
				+ shopTitle + ", shopDes=" + shopDes + ", shopDate=" + shopDate + ", memNo=" + memNo + ", memId="
				+ memId + ", nickname=" + nickname + "]";
	};
	 
	
}
