package com.hype.dto;

public class QnaDTO {
	private int seq_qna;
	private int seq_order;
	private String user_id;
	private String qna_type;
	private String qna_title;
	private String qna_content;
	private String qna_status;
	private String qna_date;
	
	public QnaDTO() {}

	public QnaDTO(int seq_qna, int seq_order, String user_id, String qna_type, String qna_title, String qna_content,
			String qna_status, String qna_date) {
		super();
		this.seq_qna = seq_qna;
		this.seq_order = seq_order;
		this.user_id = user_id;
		this.qna_type = qna_type;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_status = qna_status;
		this.qna_date = qna_date;
	}

	public int getSeq_qna() {
		return seq_qna;
	}

	public void setSeq_qna(int seq_qna) {
		this.seq_qna = seq_qna;
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

	public String getQna_type() {
		return qna_type;
	}

	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_status() {
		return qna_status;
	}

	public void setQna_status(String qna_status) {
		this.qna_status = qna_status;
	}

	public String getQna_date() {
		return qna_date;
	}

	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}

	@Override
	public String toString() {
		return seq_qna + " : " + seq_order + " : " + user_id + " : "
				+ qna_type + " : " + qna_title + " : " + qna_content + " : " + qna_status
				+ " : " + qna_date;
	}
	
	
}
