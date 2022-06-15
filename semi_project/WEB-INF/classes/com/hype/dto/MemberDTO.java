package com.hype.dto;

public class MemberDTO {

	private String user_id;
	private String user_password;
	private String user_name;
	private String user_date;
	private String user_postCode;
	private String user_roadAddr;
	private String user_detailAddr;
	private String user_phone;
	private String user_email;
	private String user_blacklist;
	
	public MemberDTO() {}

	public MemberDTO(String user_id, String user_password, String user_name, String user_date, String user_postCode,
			String user_roadAddr, String user_detailAddr, String user_phone, String user_email, String user_blacklist) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_date = user_date;
		this.user_postCode = user_postCode;
		this.user_roadAddr = user_roadAddr;
		this.user_detailAddr = user_detailAddr;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_blacklist = user_blacklist;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_date() {
		return user_date;
	}

	public void setUser_date(String user_date) {
		this.user_date = user_date;
	}
	public String getUser_postCode() {
		return user_postCode;
	}
	public void setUser_postCode(String user_postCode) {
		this.user_postCode = user_postCode;
	}

	public String getUser_roadAddr() {
		return user_roadAddr;
	}

	public void setUser_roadAddr(String user_roadAddr) {
		this.user_roadAddr = user_roadAddr;
	}

	public String getUser_detailAddr() {
		return user_detailAddr;
	}

	public void setUser_detailAddr(String user_detailAddr) {
		this.user_detailAddr = user_detailAddr;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_blacklist() {
		return user_blacklist;
	}

	public void setUser_blacklist(String user_blacklist) {
		this.user_blacklist = user_blacklist;
	}
	@Override
	public String toString() {
		return user_id + " : " + user_password + " : " + user_name
				+ " : " + user_date + " : " + user_postCode + " : " + user_roadAddr
				+ " : " + user_detailAddr + " : " + user_phone + " : " + user_email+ " : " + user_blacklist;
	}
	
	
}
