package com.hype.dto;

public class OrderReviewDTO {

	private int seq_order;
	private String user_id;
	private String buy_name;
	public OrderReviewDTO(int seq_order, String user_id, String buy_name) {
		super();
		this.seq_order = seq_order;
		this.user_id = user_id;
		this.buy_name = buy_name;
	}
	public int getSeq_order() {
		return seq_order;
	}
	public void setSeq_order(int seq_order) {
		this.seq_order = seq_order;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBuy_name() {
		return buy_name;
	}
	public void setBuy_name(String buy_name) {
		this.buy_name = buy_name;
	}
	
	
	
}
