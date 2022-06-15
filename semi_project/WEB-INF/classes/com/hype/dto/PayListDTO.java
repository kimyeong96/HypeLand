package com.hype.dto;

public class PayListDTO {
   private int seq_product;
   private String product_name;
   private String product_code;
   private int product_price;
   private String category;
   private String product_content;
   private int seq_cart;
   private int cart_quantity;
   
   
   public PayListDTO() {}
   
   public PayListDTO(int seq_product, String product_name, String product_code, int product_price, String category,
         String product_content, int seq_cart,int cart_quantity) {
      this.seq_product = seq_product;
      this.product_name = product_name;
      this.product_code = product_code;
      this.product_price = product_price;
      this.category = category;
      this.product_content = product_content;
      this.seq_cart = seq_cart;
      this.cart_quantity = cart_quantity;
   }


   public int getSeq_product() {
      return seq_product;
   }

   public void setSeq_product(int seq_product) {
      this.seq_product = seq_product;
   }

   public String getProduct_name() {
      return product_name;
   }

   public void setProduct_name(String product_name) {
      this.product_name = product_name;
   }

   public String getProduct_code() {
      return product_code;
   }

   public void setProduct_code(String product_code) {
      this.product_code = product_code;
   }

   public int getProduct_price() {
      return product_price;
   }

   public void setProduct_price(int product_price) {
      this.product_price = product_price;
   }

   public String getCategory() {
      return category;
   }

   public void setCategory(String category) {
      this.category = category;
   }

   public String getProduct_content() {
      return product_content;
   }

   public void setProduct_content(String product_content) {
      this.product_content = product_content;
   }

   public int getSeq_cart() {
      return seq_cart;
   }

   public void setSeq_cart(int seq_cart) {
      this.seq_cart = seq_cart;
   }

   public int getCart_quantity() {
      return cart_quantity;
   }

   public void setCart_quantity(int cart_quantity) {
      this.cart_quantity = cart_quantity;
   }

   @Override
   public String toString() {
      return  seq_product + " : " + product_name + " : "
            + product_code + " : " + product_price + " : " + category + " : "
            + product_content + " : " + seq_cart + " : "  + cart_quantity  ;
   }
   
   
   
   
}