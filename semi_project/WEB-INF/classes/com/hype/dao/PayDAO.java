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
import com.hype.dto.CartDTO;
import com.hype.dto.DeliveryDTO;
import com.hype.dto.ImageDTO;
import com.hype.dto.MemberDTO;
import com.hype.dto.PayListDTO;
import com.hype.dto.ProductDTO;

public class PayDAO {
	private BasicDataSource bds;

	public PayDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context) iCtx.lookup("java:comp/env");
			bds = (BasicDataSource) envCtx.lookup("jdbc/bds");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<DeliveryDTO> deliSelectById(String id) throws Exception{
		String sql = "select * from tbl_deli where user_id = ?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<DeliveryDTO> list = new ArrayList<>(); 
			
			while(rs.next()) {
				int seq_deli = rs.getInt("seq_deli");
				String user_id = rs.getString("user_id");
				String deli_name = rs.getString("deli_name");
				String deli_place = rs.getString("deli_place");
				String deli_phone = rs.getString("deli_phone");
				String deli_address = rs.getString("deli_address");
				String deli_postCode = rs.getString("deli_postCode");
				list.add(new DeliveryDTO(seq_deli, user_id, deli_name, deli_place,
						deli_phone, deli_address, deli_postCode));
			}
			return list;
		}
	}
	
	public DeliveryDTO deliSelectBySeq(int seq) throws Exception{
		String sql = "select * from tbl_deli where seq_deli = ? order by 1";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, seq);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int seq_deli = rs.getInt("seq_deli");
				String user_id = rs.getString("user_id");
				String deli_name = rs.getString("deli_name");
				String deli_place = rs.getString("deli_place");
				String deli_phone = rs.getString("deli_phone");
				String deli_address = rs.getString("deli_address");
				String deli_postCode = rs.getString("deli_postCode");
				
				return new DeliveryDTO(seq_deli, user_id, deli_name, deli_place,
						deli_phone, deli_address, deli_postCode);
			}else {
				return null;
			}
			
		}
	}
	
	public int update(DeliveryDTO dto) throws Exception{
		String sql = "update tbl_deli set deli_name = ? , deli_place = ?"
				+ " ,deli_phone = ? , deli_address = ? ,  deli_postCode = ? where seq_deli =? ";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, dto.getDeli_name());
			pstmt.setString(2, dto.getDeli_place());
			pstmt.setString(3, dto.getDeli_phone());
			pstmt.setString(4, dto.getDeli_postCode());
			pstmt.setString(5, dto.getDeli_address());
			pstmt.setInt(6, dto.getSeq_deli());
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	public int deliInsert(DeliveryDTO dto) throws Exception{
		String sql = "insert into tbl_deli values(seq_deli.nextval, ?"
				+ ", ?, ?, ?, ? ,?)";
		
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
				pstmt.setString(1, dto.getUser_id());
				pstmt.setString(2, dto.getDeli_name());
				pstmt.setString(3, dto.getDeli_place());
				pstmt.setString(4, dto.getDeli_postCode());
				pstmt.setString(5, dto.getDeli_address());
				pstmt.setString(6, dto.getDeli_phone());
				
				int rs = pstmt.executeUpdate();
				return rs;
			}
	}
	
	public int delete(int seq_deli) throws Exception{
		String sql = "delete from tbl_deli where seq_deli = ?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, seq_deli);
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	public MemberDTO selectById(String id) throws Exception{
		String sql = "select * from tbl_member where user_id = ?";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String user_name = rs.getString("user_name");
				String user_date = rs.getString("user_date");
				String user_postCode = rs.getString("user_postCode");
				String user_rodAddr = rs.getString("user_roadAddr");
				String user_detailAddr = rs.getString("user_detailAddr");
				String user_phone = rs.getString("user_phone");
				String user_email = rs.getString("user_email");
				String user_blacklist = rs.getString("user_blacklist");

				return new MemberDTO(id, null, user_name, user_date, user_postCode, user_rodAddr, user_detailAddr,
						user_phone, user_email, user_blacklist);
			} else {
				return null;
			}
		 }
      }
	
	public ArrayList<PayListDTO> selectBySeq_cart(int[] cart_list,String id) throws Exception{ //장바구니 번호, 유저 아이디로 결제창에 뿌리기
	      String[] str  = new String[cart_list.length];
	      
	      for(int i = 0 ; i <cart_list.length; i ++) {
	         str[i] = "?";
	      }
	      String allStr = String.join(",", str);
	      
	      String sql = "select a.* ,b.seq_cart ,b.cart_quantity  \r\n"
	            + "from tbl_product a inner join tbl_cart b on b.seq_product = a.seq_product where b.seq_cart in ";
	      
	      String sql_where = "and b.user_id = ?";
	      sql += "(" + allStr + ") " +sql_where;
	      
	      ArrayList<PayListDTO> pay_list = new ArrayList<>();
	      
	      try(Connection con = bds.getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql)){
	         
	         
	         for (int i = 0; i < cart_list.length; i++) {
	            pstmt.setInt(i + 1, cart_list[i]);
	            
	            if(i == cart_list.length-1) {
	               pstmt.setString(i+2, id);
	            }
	         }
	         
	         ResultSet rs = pstmt.executeQuery();
	         while(rs.next()) {
	            int seq_product = rs.getInt("seq_product");
	            String product_name = rs.getString("product_name");
	            String product_code = rs.getString("product_code");
	            int product_price = rs.getInt("product_price");
	            String category = rs.getString("category");
	            String product_content = rs.getString("product_content");
	            int seq_cart = rs.getInt("seq_cart");
	            int cart_quantity = rs.getInt("cart_quantity");
	            
	            pay_list.add(new PayListDTO (seq_product, product_name, product_code, product_price
	                  , category , product_content,seq_cart, cart_quantity));
	         }
	         return pay_list;
	      }
	      
	   }
	public ArrayList<CartDTO> selectBySeq_cart(int[] seq ) throws Exception{ // cartDTO 수정해야함
		String[] str = new String[seq.length];

		for (int i = 0; i < seq.length; i++) {
			str[i] = "?";
		}
		String allStr = String.join(",", str);
		String sql = "select * from tbl_cart where seq_cart in";
		sql += "(" + allStr + ")";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			for (int i = 0; i < seq.length; i++) {
				pstmt.setInt(i + 1, seq[i]);
			}
			
			ResultSet rs = pstmt.executeQuery();
//			DecimalFormat decFormat = new DecimalFormat("###,###");
			ArrayList<CartDTO> list = new ArrayList<>();
			
			while(rs.next()) {
				int seq_cart = rs.getInt("seq_cart");
				int seq_product = rs.getInt("seq_product");
				String user_id = rs.getString("user_id");
				String cart_name = rs.getString("cart_name");
				int cart_quantity = rs.getInt("cart_quantity");
				int cart_price = rs.getInt("cart_price");
				list.add(new CartDTO(seq_cart,seq_product,user_id, cart_name, cart_quantity, cart_price ));
			}
			return list;
		}
	}
	
	
	
	public int payInsert(int price) throws Exception {
		String sql = "insert into tbl_pay values(seq_pay.nextval, ?, '결제완료',sysdate )";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setInt(1, price);
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	public int orderInsert(String user_id, String order_name, String order_phone, String order_postCode, String order_address, String order_msg) throws Exception{
		String sql = "insert into tbl_order values(seq_order.nextval, ?, ?, ?, ?, ?, ?, default)";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
				
				pstmt.setString(1, user_id);
				pstmt.setString(2, order_name);
				pstmt.setString(3, order_phone);
				pstmt.setString(4, order_postCode);
				pstmt.setString(5, order_address);
				pstmt.setString(6, order_msg);
				
				int rs = pstmt.executeUpdate();
				return rs;
		}
	}
	
	public int findSeq_orderBySelect(String id) throws Exception{
		String sql = "select * from tbl_order where user_id = ? order by 1 desc";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			int seq_order = 0;
			if(rs.next()) {
				seq_order = rs.getInt("seq_order");
			}
			return seq_order;
		}
	}
	
	public int buyInsert(int seq, ArrayList<CartDTO> list) throws Exception{
		String sql = "insert into tbl_buy values(seq_buy.nextval, ?, ?, ?, ?, sysdate)";
		int rs = 0;
		for(int i = 0 ; i < list.size() ; i++) {
			try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
				pstmt.setInt(1, seq);
				pstmt.setString(2, list.get(i).getCart_name());
				pstmt.setInt(3, list.get(i).getCart_quantity());
				pstmt.setInt(4, list.get(i).getCart_price());
				
				rs += pstmt.executeUpdate();
			}
		}
		return rs;
	}
	
	public ArrayList<BuyDTO> selectTblbuyid(String user_id) throws Exception{ 
        String sql = "select * from tbl_buy where seq_order in(select seq_order from tbl_order where user_id = ?) order by 2 desc";

        try(Connection con = bds.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql)){

            pstmt.setString(1, user_id);

            ResultSet rs = pstmt.executeQuery();
            ArrayList<BuyDTO> list = new ArrayList<>();

            while(rs.next()) {
                int seq_buy = rs.getInt("seq_buy");
                int seq_order = rs.getInt("seq_order");
                String buy_name = rs.getString("buy_name");
                int buy_qty  = rs.getInt("buy_qty");
                int buy_price = rs.getInt("buy_price");
                String buy_create = getStringDate(rs.getDate("buy_create"));

                list.add(new BuyDTO(seq_buy,seq_order,buy_name,buy_qty,buy_price, buy_create));
            }
            return list;
        }

    }
	
	public String getStringDate(Date date) {
        // 1900-02-02
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }
	
	public ProductDTO selectByName(String name) throws Exception {
		String sql = "select * from tbl_product where product_name =? ";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, name);
			
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				int seq_product = rs.getInt(1);
				String product_code = rs.getString(2);
				String category = rs.getString(3);
				String product_name = rs.getString(4);
				int product_price = rs.getInt(5);
				String product_content = rs.getString(6);
				
				return new ProductDTO(seq_product, product_code, category, product_name, product_price, product_content);
			}
			return null;

		}
	}
	
	
	
	
}
