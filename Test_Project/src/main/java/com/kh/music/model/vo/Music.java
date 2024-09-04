package com.kh.music.model.vo;

public class Music {

	private int memNo;
	private int musicNo;
	private String musicTitle;
	private String musicSinger;
	private String musicThumbnail;
	private String musicFilepath;
	
	public Music() {}

	public Music(int memNo, int musicNo, String musicTitle, String musicSinger, String musicThumbnail,
			String musicFilepath) {
		super();
		this.memNo = memNo;
		this.musicNo = musicNo;
		this.musicTitle = musicTitle;
		this.musicSinger = musicSinger;
		this.musicThumbnail = musicThumbnail;
		this.musicFilepath = musicFilepath;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getMusicNo() {
		return musicNo;
	}

	public void setMusicNo(int musicNo) {
		this.musicNo = musicNo;
	}

	public String getMusicTitle() {
		return musicTitle;
	}

	public void setMusicTitle(String musicTitle) {
		this.musicTitle = musicTitle;
	}

	public String getMusicSinger() {
		return musicSinger;
	}

	public void setMusicSinger(String musicSinger) {
		this.musicSinger = musicSinger;
	}

	public String getMusicThumbnail() {
		return musicThumbnail;
	}

	public void setMusicThumbnail(String musicThumbnail) {
		this.musicThumbnail = musicThumbnail;
	}

	public String getMusicFilepath() {
		return musicFilepath;
	}

	public void setMusicFilepath(String musicFilepath) {
		this.musicFilepath = musicFilepath;
	}

	@Override
	public String toString() {
		return "Music [memNo=" + memNo + ", musicNo=" + musicNo + ", musicTitle=" + musicTitle + ", musicSinger="
				+ musicSinger + ", musicThumbnail=" + musicThumbnail + ", musicFilepath=" + musicFilepath + "]";
	};

	
}
