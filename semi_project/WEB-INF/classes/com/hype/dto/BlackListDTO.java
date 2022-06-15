package com.hype.dto;

public class BlackListDTO {
    private String user_id;
    private String black_reason;
    private String black_date;

    public BlackListDTO() {
        super();
    }

    public BlackListDTO(String user_id, String black_reason, String black_date) {
        super();
        this.user_id = user_id;
        this.black_reason = black_reason;
        this.black_date = black_date;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getBlack_reason() {
        return black_reason;
    }

    public void setBlack_reason(String black_reason) {
        this.black_reason = black_reason;
    }

    public String getBlack_date() {
        return black_date;
    }

    public void setBlack_date(String black_date) {
        this.black_date = black_date;
    }

    @Override
    public String toString() {
        return "BlackListDTO [user_id=" + user_id + ", black_reason=" + black_reason + ", black_date=" + black_date
                + "]";
    }

}