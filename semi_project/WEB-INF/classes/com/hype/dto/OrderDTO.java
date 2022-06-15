package com.hype.dto;

public class OrderDTO {
   private int seq_order;
    private String user_id;
    private String order_name;
    private String order_phone;
    private String order_postCode;
    private String order_address;
    private String order_msg;
    private String order_status;
    
   
   public OrderDTO() {}

   public OrderDTO(int seq_order, String user_id, String order_name, String order_phone, String order_postCode,
         String order_address, String order_msg, String order_status) {
      super();
      this.seq_order = seq_order;
      this.user_id = user_id;
      this.order_name = order_name;
      this.order_phone = order_phone;
      this.order_postCode = order_postCode;
      this.order_address = order_address;
      this.order_msg = order_msg;
      this.order_status = order_status;
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

   public String getOrder_name() {
      return order_name;
   }

   public void setOrder_name(String order_name) {
      this.order_name = order_name;
   }

   public String getOrder_phone() {
      return order_phone;
   }

   public void setOrder_phone(String order_phone) {
      this.order_phone = order_phone;
   }

   public String getOrder_postCode() {
      return order_postCode;
   }

   public void setOrder_postCode(String order_postCode) {
      this.order_postCode = order_postCode;
   }

   public String getOrder_address() {
      return order_address;
   }

   public void setOrder_address(String order_address) {
      this.order_address = order_address;
   }

   public String getOrder_msg() {
      return order_msg;
   }

   public void setOrder_msg(String order_msg) {
      this.order_msg = order_msg;
   }

   public String getOrder_status() {
      return order_status;
   }

   public void setOrder_status(String order_status) {
      this.order_status = order_status;
   }

   @Override
   public String toString() {
      return "OrderDTO [seq_order=" + seq_order + ", user_id=" + user_id + ", order_name=" + order_name
            + ", order_phone=" + order_phone + ", order_postCode=" + order_postCode + ", order_address="
            + order_address + ", order_msg=" + order_msg + ", order_status=" + order_status + "]";
   }   
}
