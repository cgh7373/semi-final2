package com.kh.chat.model.vo;

public class Friend {
	
	private int senderNo;
	private int receiverNo;
	private String requestStatus;
	private String friendLevel;
	private String nickName;
	private String profilePic;
	
	public Friend() {}

	public Friend(int senderNo, int receiverNo, String requestStatus, String friendLevel, String nickName,
			String profilePic) {
		super();
		this.senderNo = senderNo;
		this.receiverNo = receiverNo;
		this.requestStatus = requestStatus;
		this.friendLevel = friendLevel;
		this.nickName = nickName;
		this.profilePic = profilePic;
	}
	
	public Friend(int senderNo, int receiverNo, String nickName, String profilePic) {
		super();
		this.senderNo = senderNo;
		this.receiverNo = receiverNo;
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
				+ ", friendLevel=" + friendLevel + ", nickName=" + nickName + ", profilePic=" + profilePic + "]";
	}

	

}
