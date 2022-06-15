package com.hype.dto;

public class DeliveryDTO {
	private int seq_deli;
	private String user_id;
	private String deli_name;
	private String deli_place;
	private String deli_phone;
	private String deli_address;
	private String deli_postCode;
	
	public DeliveryDTO(){}

	public DeliveryDTO(int seq_deli, String user_id, String deli_name, String deli_place, String deli_phone,
			String deli_address, String deli_postCode) {
		super();
		this.seq_deli = seq_deli;
		this.user_id = user_id;
		this.deli_name = deli_name;
		this.deli_place = deli_place;
		this.deli_phone = deli_phone;
		this.deli_address = deli_address;
		this.deli_postCode = deli_postCode;
	}

	public int getSeq_deli() {
		return seq_deli;
	}

	public void setSeq_deli(int seq_deli) {
		this.seq_deli = seq_deli;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getDeli_name() {
		return deli_name;
	}

	public void setDeli_name(String deli_name) {
		this.deli_name = deli_name;
	}

	public String getDeli_place() {
		return deli_place;
	}

	public void setDeli_place(String deli_place) {
		this.deli_place = deli_place;
	}

	public String getDeli_phone() {
		return deli_phone;
	}

	public void setDeli_phone(String deli_phone) {
		this.deli_phone = deli_phone;
	}

	public String getDeli_address() {
		return deli_address;
	}

	public void setDeli_address(String deli_address) {
		this.deli_address = deli_address;
	}

	public String getDeli_postCode() {
		return deli_postCode;
	}

	public void setDeli_postCode(String deli_postCode) {
		this.deli_postCode = deli_postCode;
	}

	@Override
	public String toString() {
		return  seq_deli + " : " + user_id + " : " + deli_name + " : "
				+ deli_place + " : " + deli_phone + " : " + deli_address + " : "
				+ deli_postCode;
	}
	
	
}
