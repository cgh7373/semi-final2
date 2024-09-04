package com.kh.admin.model.vo;

public class Tag {

	private String value;
	private String key;
	
	public Tag() {}

	public Tag(String value, String key) {
		super();
		this.value = value;
		this.key = key;
	}
	

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	@Override
	public String toString() {
		return "Tag [value=" + value + ", key=" + key + "]";
	}
	
	
	
}
