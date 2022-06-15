package com.hype.dto;

public class RankingDTO {
	private int rank;
	private String product_name;
	private int product_sum;
	
	public RankingDTO() {}
	public RankingDTO(int rank, String product_name, int product_sum) {
		super();
		this.rank = rank;
		this.product_name = product_name;
		this.product_sum = product_sum;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_sum() {
		return product_sum;
	}
	public void setProduct_sum(int product_sum) {
		this.product_sum = product_sum;
	}
	@Override
	public String toString() {
		return "RankingDTO [rank=" + rank + ", product_name=" + product_name + ", product_sum=" + product_sum + "]";
	}
	
	
}
