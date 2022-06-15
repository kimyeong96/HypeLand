package com.hype.dto;

public class QnaReplyDTO {
	private int seq_reply;
	private String user_id;
	private int seq_qna;
	private String qna_reply;
	private String reply_date;
	
	public QnaReplyDTO() {}

	public QnaReplyDTO(int seq_reply, String user_id, int seq_qna, String qna_reply, String reply_date) {
		super();
		this.seq_reply = seq_reply;
		this.user_id = user_id;
		this.seq_qna = seq_qna;
		this.qna_reply = qna_reply;
		this.reply_date = reply_date;
	}

	public int getSeq_reply() {
		return seq_reply;
	}

	public void setSeq_reply(int seq_reply) {
		this.seq_reply = seq_reply;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getSeq_qna() {
		return seq_qna;
	}

	public void setSeq_qna(int seq_qna) {
		this.seq_qna = seq_qna;
	}

	public String getQna_reply() {
		return qna_reply;
	}

	public void setQna_reply(String qna_reply) {
		this.qna_reply = qna_reply;
	}

	public String getReply_date() {
		return reply_date;
	}

	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}

	@Override
	public String toString() {
		return "ReplyDTO [seq_reply=" + seq_reply + ", user_id=" + user_id + ", seq_qna=" + seq_qna + ", qna_reply="
				+ qna_reply + ", reply_date=" + reply_date + "]";
	}
	
	
	
	
	
	
	
}
