package com.kh.chat.model.vo;

public class Friend {
	
	private int senderNo;
	private int receiverNo;
	private String requestStatus;
	private String friendLevel;
	private int fMemNo;
	private String nickName;
	private String profilePic;
	
	public Friend() {}

	public Friend(int senderNo, int receiverNo, String requestStatus, String friendLevel, int fMemNo, String nickName,
			String profilePic) {
		super();
		this.senderNo = senderNo;
		this.receiverNo = receiverNo;
		this.requestStatus = requestStatus;
		this.friendLevel = friendLevel;
		this.fMemNo = fMemNo;
		this.nickName = nickName;
		this.profilePic = profilePic;
	}

	public Friend(int senderNo, int receiverNo, int fMemNo, String nickName, String profilePic) {
		super();
		this.senderNo = senderNo;
		this.receiverNo = receiverNo;
		this.fMemNo = fMemNo;
		this.nickName = nickName;
		this.profilePic = profilePic;
	}
	
	public Friend(int fMemNo, String nickName, String profilePic) {
		super();
		this.fMemNo = fMemNo;
		this.nickName = nickName;
		this.profilePic = profilePic;
	}

	public int getSenderNo() {
		return senderNo;
	}

	public void setSenderNo(int senderNo) {
		this.senderNo = senderNo;
	}

	public int getReceiverNo() {
		return receiverNo;
	}

	public void setReceiverNo(int receiverNo) {
		this.receiverNo = receiverNo;
	}

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}

	public String getFriendLevel() {
		return friendLevel;
	}

	public void setFriendLevel(String friendLevel) {
		this.friendLevel = friendLevel;
	}

	public int getfMemNo() {
		return fMemNo;
	}

	public void setfMemNo(int fMemNo) {
		this.fMemNo = fMemNo;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	@Override
	public String toString() {
		return "Friend [senderNo=" + senderNo + ", receiverNo=" + receiverNo + ", requestStatus=" + requestStatus
				+ ", friendLevel=" + friendLevel + ", fMemNo=" + fMemNo + ", nickName=" + nickName + ", profilePic="
				+ profilePic + "]";
	}

}
