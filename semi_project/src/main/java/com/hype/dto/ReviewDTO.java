package com.hype.dto;

public class ReviewDTO {
	private int seq_review;
	private int seq_product;
	private String user_id;
	private String review_content;
	private String review_date;
	private int review_rate;
	
	public ReviewDTO() {}
	public ReviewDTO(int seq_review, int seq_product, String user_id, String review_content, String review_date,
			int review_rate) {
		super();
		this.seq_review = seq_review;
		this.seq_product = seq_product;
		this.user_id = user_id;
		this.review_content = review_content;
		this.review_date = review_date;
		this.review_rate = review_rate;
	}
	public int getSeq_review() {
		return seq_review;
	}
	public void setSeq_review(int seq_review) {
		this.seq_review = seq_review;
	}
	public int getSeq_product() {
		return seq_product;
	}
	public void setSeq_product(int seq_product) {
		this.seq_product = seq_product;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public int getReview_rate() {
		return review_rate;
	}
	public void setReview_rate(int review_rate) {
		this.review_rate = review_rate;
	}
	@Override
	public String toString() {
		return "ReviewDTO [seq_review=" + seq_review + ", seq_product=" + seq_product + ", user_id=" + user_id
				+ ", review_content=" + review_content + ", review_date=" + review_date + ", review_rate=" + review_rate
				+ "]";
	}
	
	
	
	
}
