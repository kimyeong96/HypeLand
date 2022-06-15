package com.hype.dto;

public class PayDTO {
   private int seq_pay;
   private int pay_price;
   private String order_status;
   private String pay_date;
   
   public PayDTO(int seq_pay, int pay_price, String order_status, String pay_date) {
      super();
      this.seq_pay = seq_pay;
      this.pay_price = pay_price;
      this.order_status = order_status;
      this.pay_date = pay_date;
   }

   public int getSeq_pay() {
      return seq_pay;
   }

   public void setSeq_pay(int seq_pay) {
      this.seq_pay = seq_pay;
   }

   public int getPay_price() {
      return pay_price;
   }

   public void setPay_price(int pay_price) {
      this.pay_price = pay_price;
   }

   public String getOrder_status() {
      return order_status;
   }

   public void setOrder_status(String order_status) {
      this.order_status = order_status;
   }

   public String getPay_date() {
      return pay_date;
   }

   public void setPay_date(String pay_date) {
      this.pay_date = pay_date;
   }

   @Override
   public String toString() {
      return "PayDTO [seq_pay=" + seq_pay + ", pay_price=" + pay_price + ", order_status=" + order_status
            + ", pay_date=" + pay_date + "]";
   }
   
   
   
}