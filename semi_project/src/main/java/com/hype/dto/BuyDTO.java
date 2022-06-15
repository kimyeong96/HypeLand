package com.hype.dto;

public class BuyDTO {
	private int seq_buy;
	private int seq_order;
	private String buy_name;
	private int buy_qty;
	private int buy_price;
	private String buy_create;
	
	public BuyDTO() {}
	
	public BuyDTO(int seq_buy, int seq_order, String buy_name, int buy_qty, int buy_price, String buy_create) {
		super();
		this.seq_buy = seq_buy;
		this.seq_order = seq_order;
		this.buy_name = buy_name;
		this.buy_qty = buy_qty;
		this.buy_price = buy_price;
		this.buy_create = buy_create;
	}

	public int getSeq_buy() {
		return seq_buy;
	}

	public void setSeq_buy(int seq_buy) {
		this.seq_buy = seq_buy;
	}

	public int getSeq_order() {
		return seq_order;
	}

	public void setSeq_order(int seq_order) {
		this.seq_order = seq_order;
	}

	public String getBuy_name() {
		return buy_name;
	}

	public void setBuy_name(String buy_name) {
		this.buy_name = buy_name;
	}
	

	public int getBuy_qty() {
		return buy_qty;
	}

	public void setBuy_qty(int buy_qty) {
		this.buy_qty = buy_qty;
	}

	public int getBuy_price() {
		return buy_price;
	}

	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}

	public String getBuy_create() {
		return buy_create;
	}

	public void setBuy_create(String buy_create) {
		this.buy_create = buy_create;
	}

	@Override
	public String toString() {
		return seq_buy + " : " + seq_order + " : " + buy_name + " : "
				+ buy_qty + " : " + buy_price + " : " + buy_create;
	}
	

	
	
	
	
	
	
}
