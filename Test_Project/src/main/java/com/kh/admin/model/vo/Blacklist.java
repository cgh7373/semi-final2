package com.kh.admin.model.vo;

import java.sql.Date;

public class Blacklist {

	private String memId;
    private String nickname;
    private String reason;
    private int count;
    private String reportId;
    private Date blockDate;
    
    public Blacklist() {}

	public Blacklist(String memId, String nickname, String reason, int count, String reportId, Date blockDate) {
		super();
		this.memId = memId;
		this.nickname = nickname;
		this.reason = reason;
		this.count = count;
		this.reportId = reportId;
		this.blockDate = blockDate;
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

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

	public Date getBlockDate() {
		return blockDate;
	}

	public void setBlockDate(Date blockDate) {
		this.blockDate = blockDate;
	}

	@Override
	public String toString() {
		return "Blacklist [memId=" + memId + ", nickname=" + nickname + ", reason=" + reason + ", count=" + count
				+ ", reportId=" + reportId + ", blockDate=" + blockDate + "]";
	}


    
    
	
}
