package com.hype.dto;

public class CartDTO {
   private int seq_cart;
   private int seq_product;
   private String user_id;
   private String cart_name;
   private int cart_quantity;
   private int cart_price;
   
   public CartDTO() {}
   
   public CartDTO(int seq_cart, int seq_product, String user_id, String cart_name, int cart_quantity, int cart_price) {
      super();
      this.seq_cart = seq_cart;
      this.seq_product = seq_product;
      this.user_id = user_id;
      this.cart_name = cart_name;
      this.cart_quantity = cart_quantity;
      this.cart_price = cart_price;
   }

   public int getSeq_cart() {
      return seq_cart;
   }

   public void setSeq_cart(int seq_cart) {
      this.seq_cart = seq_cart;
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

   public String getCart_name() {
      return cart_name;
   }

   public void setCart_name(String cart_name) {
      this.cart_name = cart_name;
   }

   public int getCart_quantity() {
      return cart_quantity;
   }

   public void setCart_quantity(int cart_quantity) {
      this.cart_quantity = cart_quantity;
   }

   public int getCart_price() {
      return cart_price;
   }

   public void setCart_price(int cart_price) {
      this.cart_price = cart_price;
   }


   @Override
   public String toString() {
      return seq_cart + " : " + seq_product + " : " + user_id
            + " : " + cart_name + " : " + cart_quantity + " : " + cart_price;
   }
   
   
   
   
}
