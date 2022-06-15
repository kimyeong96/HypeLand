package com.hype.dto;

public class ImageDTO {
	private String image_name;
	private int seq_product;
	private String image_path;
	
	public ImageDTO() {};
	public ImageDTO(String image_name, int seq_product, String image_path) {
		super();
		this.image_name = image_name;
		this.seq_product = seq_product;
		this.image_path = image_path;
	}

	public String getImage_name() {
		return image_name;
	}

	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	public int getSeq_product() {
		return seq_product;
	}
	public void setSeq_product(int seq_product) {
		this.seq_product = seq_product;
	}
	public String getImage_path() {
		return image_path;
	}

	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}

	@Override
	public String toString() {
		return "ImageDTO [image_name=" + image_name + ", seq_product=" + seq_product + ", image_path=" + image_path
				+ "]";
	}
	
	
}
