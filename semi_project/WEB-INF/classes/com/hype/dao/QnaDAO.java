package com.hype.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.hype.dto.BuyDTO;
import com.hype.dto.OrderDTO;

public class QnaDAO {
private BasicDataSource bds;
   
   public QnaDAO() {
      try {
         Context iCtx = new InitialContext();
         Context envCtx = (Context)iCtx.lookup("java:comp/env");
         bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   public String getStringDate(Date date) {
      // 1900년 02월 02일
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
      return sdf.format(date);
   }
   
   public ArrayList<BuyDTO> seq_orderSelectBySeq(ArrayList<OrderDTO> dto) throws Exception{ // 회원아이디로 주문번호찾기
      String[] str = new String[dto.size()];
      for (int i = 0; i < dto.size(); i++) {
         str[i] = "?";
      }
      String allStr = String.join(",", str);
      String sql = "select * from tbl_buy where seq_order in";
      sql += "(" + allStr + ")";
      
      try(Connection con = bds.getConnection();
         PreparedStatement pstmt = con.prepareStatement(sql)){
         
         for (int i = 0; i < dto.size(); i++) {
            pstmt.setInt(i+1, dto.get(i).getSeq_order());
         }
         
         ResultSet rs = pstmt.executeQuery();
         ArrayList<BuyDTO> list = new ArrayList<>();
         
         while(rs.next()) {
            int seq_buy = rs.getInt("seq_buy");
            int seq_order = rs.getInt("seq_order");
            String buy_name = rs.getString("buy_name");
            int buy_price = rs.getInt("buy_price");
            int buy_qty  = rs.getInt("buy_qty");
            String buy_create = getStringDate(rs.getDate("buy_create"));
            
            list.add(new BuyDTO(seq_buy,seq_order,buy_name, buy_qty, buy_price, buy_create));
         }
         return list;
      }
   }
   
   
   public int qnaInsert(int seq_order, String id, String type, String title, String content) throws Exception{ //문의글 작성
	      String sql = "insert into tbl_qna "
	            + "values(seq_qna.nextval, ?, ?, ?, ?, ?, default, sysdate)";
	      
	      
	      try(Connection con = bds.getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql)){
	         
	         pstmt.setInt(1, seq_order);
	         pstmt.setString(2, id);
	         pstmt.setString(3, type);
	         pstmt.setString(4, title);
	         pstmt.setString(5, content);
	         
	         int rs = pstmt.executeUpdate();
	         return rs;
	      }
	   }
   
   public ArrayList<OrderDTO> selectById(String id)  throws Exception{ // 위치변경요망
      String sql = "select * from tbl_order where user_id = ?";
            
      try(Connection con = bds.getConnection();
         PreparedStatement pstmt = con.prepareStatement(sql)){
         
         pstmt.setString(1, id);
         
         ResultSet rs = pstmt.executeQuery();
         ArrayList<OrderDTO> list = new ArrayList<>();
         
         while(rs.next()) {
            int seq_order = rs.getInt("seq_order");
            
            list.add(new OrderDTO(seq_order,null ,null ,null ,null ,null ,null ,null));
         }
         return list;
      }
   }
   
}