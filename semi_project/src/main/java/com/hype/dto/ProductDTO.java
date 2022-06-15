package com.hype.dto;

public class ProductDTO {

	private int seq_product;
	private String product_code;
	private String category;
	private String product_name;
	private int product_price;
	private String product_content;

	public ProductDTO() {
		super();
	}
	public ProductDTO(int seq_product, String product_code, String category, String product_name, int product_price,
			String product_content) {
		super();
		this.seq_product = seq_product;
		this.product_code = product_code;
		this.category = category;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_content = product_content;
	}
	public int getSeq_product() {
		return seq_product;
	}
	public void setSeq_product(int seq_product) {
		this.seq_product = seq_product;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	@Override
	public String toString() {
		return "ProductDTO [seq_product=" + seq_product + ", product_code=" + product_code + ", category=" + category
				+ ", product_name=" + product_name + ", product_price=" + product_price + ", product_content="
				+ product_content + "]";
	}


}
