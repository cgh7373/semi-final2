package com.kh.member.model.vo;

public class Member {

	private int memNo;
	private String memId;
	private String memPwd;
	private String nickname;
	private String birthdate;
	private String phone;
	private String email;
	private String gender;
	private String enrollDate; 
	private String modifyDate;
	private String status;
	private int egg;
	private String zodiac;
	
	public Member() {}

	public Member(int memNo, String memId, String memPwd, String nickname, String birthdate, String phone, String email,
			String gender, String enrollDate, String modifyDate, String status) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.nickname = nickname;
		this.birthdate = birthdate;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public Member(String memId, String memPwd, String nickname, String birthdate, String phone, String email,
			String gender) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.nickname = nickname;
		this.birthdate = birthdate;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
	}

	public Member(int memNo, String memId, String memPwd, String nickname, String birthdate, String phone, String email,
			String gender, String enrollDate, String modifyDate, String status, String zodiac) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.nickname = nickname;
		this.birthdate = birthdate;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.zodiac = zodiac;
	}
	

	public Member(int memNo, String memId, String memPwd, String nickname, String birthdate, String phone, String email,
			String gender, String enrollDate, String modifyDate, String status, int egg, String zodiac) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.nickname = nickname;
		this.birthdate = birthdate;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.egg = egg;
		this.zodiac = zodiac;
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

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public String getZodiac() {
		return zodiac;
	}

	public void setZodiac(String zodiac) {
		this.zodiac = zodiac;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	

	public int getEgg() {
		return egg;
	}

	public void setEgg(int egg) {
		this.egg = egg;
	}

	@Override
	// 별자리는 아직 안넣음
	public String toString() {
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", nickname=" + nickname
				+ ", birthdate=" + birthdate + ", phone=" + phone + ", email=" + email + ", gender=" + gender
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	
	
}
