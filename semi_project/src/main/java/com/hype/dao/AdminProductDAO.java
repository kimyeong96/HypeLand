package com.hype.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.hype.dto.ImageDTO;
import com.hype.dto.ProductDTO;

public class AdminProductDAO {
	private BasicDataSource bds;
	public AdminProductDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int productInsert(ProductDTO dto) throws Exception{
		String sql = "insert into tbl_product values(SEQ_PRODUCT.nextval,?,?,?,?,?)";
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, dto.getProduct_code());
			pstmt.setString(2, dto.getCategory());
			pstmt.setString(3, dto.getProduct_name());
			pstmt.setInt(4, dto.getProduct_price());
			pstmt.setString(5, dto.getProduct_content());
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	public boolean checkProductCode(String product_code) throws Exception{
		String sql ="select count(*) from tbl_product where product_code=?";
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, product_code);
			ResultSet rs = pstmt.executeQuery();
			
			int result = 0;
			if(rs.next()) {
				result = rs.getInt(1);
			}
			if(result == 0) {
				return true;
			}else {
				return false;
			}
		}
	}
	public int getNewSeq() throws Exception{
		String sql = "select seq_product.nextval from dual";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int seq_board = rs.getInt(1);
			return seq_board;			
		}
	}
	
	public ArrayList<ProductDTO> selectByCode(String searchWord, int start, int end) throws Exception{
		String spl="select * from (select tbl_product.*, row_number() over(order by seq_product desc) as num from tbl_product where product_code like '%'||?||'%') where num between ? and ?";
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(spl);){
			
			pstmt.setString(1, searchWord);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
			while(rs.next()) {
				int seq_product = rs.getInt("seq_product");
				String category = rs.getString("category");
				String product_name = rs.getString("product_name");
				int product_price = rs.getInt("product_price");
				String product_code = rs.getString("product_code");
				list.add(new ProductDTO(seq_product,product_code,category,product_name, product_price,null));
			}
			return list;
		}
	}
	
	public ArrayList<ProductDTO> selectAll(int start, int end) throws Exception{
		String sql ="select * from (select tbl_product.*, row_number() over(order by seq_product desc) as num from tbl_product) where num between ? and ?";
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<ProductDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq_product = rs.getInt("seq_product");
				String category = rs.getString("category");
				String product_code = rs.getString("product_code");
				String product_name = rs.getString("product_name");
				int product_price = rs.getInt("product_price");
				list.add(new ProductDTO(seq_product,product_code,category,product_name, product_price,null));
			}
			return list;
		}
	}
	public ProductDTO selectBySeq(int seq_product) throws Exception{
		String sql = "SELECT * FROM tbl_product WHERE seq_product = ?";

		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){

			pstmt.setInt(1, seq_product);
			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
				String category = rs.getString("category");
				String product_name = rs.getString("product_name");
				int product_price = rs.getInt("product_price");
				String product_code = rs.getString("product_code");
				String product_content = rs.getString("product_content");
				
				ProductDTO dto = new ProductDTO(seq_product,product_code,category, product_name, product_price, product_content);
				return dto;
			}
			return null;
		}
	}
	public ArrayList<ImageDTO> selectBySeqImage(int seq_product) throws Exception{
		String sql = "select * from tbl_image where seq_product=?";

		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){

			pstmt.setInt(1, seq_product);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<ImageDTO> list = new ArrayList<>();
			while(rs.next()) {
				String image_name = rs.getString("image_name");
				String image_path = rs.getString("image_path");
				list.add( new ImageDTO(image_name, seq_product,image_path));
				
			}
			return list;
		}
	}
	public int modify(ProductDTO dto) throws Exception{
		String sql ="update tbl_product set category = ?, product_name=?, product_price=?,product_code=?,product_content=? where seq_product=?";
		try (Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(6, dto.getSeq_product());
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getProduct_name());
			pstmt.setInt(3, dto.getProduct_price());
			pstmt.setString(4, dto.getProduct_code());
			pstmt.setString(5, dto.getProduct_content());
			
			int rs = pstmt.executeUpdate();
			return rs;	
		}
	}
	// 수정된 가격 카트테이블에 업데이트
	public int updateCart(int seq_product, String product_name, int product_price) throws Exception {
	      String sql = "update tbl_cart set cart_name = ?, cart_price = ? where seq_product=?";
	      
	      try(Connection con = bds.getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql)) {
	         
	         pstmt.setString(1, product_name);
	         pstmt.setInt(2, product_price);
	         pstmt.setInt(3, seq_product);
	         
	         
	         int rs = pstmt.executeUpdate();
	         return rs;
	      }
	   }
	public int delete(int seq_product) throws Exception{
		String sql = "delete from tbl_product where seq_product = ?";
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setInt(1, seq_product);
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	public HashMap<String, Object> getSearchPageNavi(int curPage, String searchWord) throws Exception{
		String sql = "select count(*) as totalCount from tbl_product where product_code like '%'||?||'%'";
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, searchWord);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			int totalCount = rs.getInt("totalCount");
			int recordCountInPage = 10;
			int naviCountInpage = 5;
			int totalPageCount = 0;
			
			if(totalCount % recordCountInPage > 0) {
				totalPageCount = totalCount / recordCountInPage +1;
			} else {
				totalPageCount = totalCount / recordCountInPage;
			}
			
			if(curPage < 1) {
				curPage = 1;
			} else if(curPage > totalPageCount) {
				curPage = totalPageCount;
			}
			
			int startNavi = ((curPage - 1) / naviCountInpage) * naviCountInpage + 1;
			int endNavi = startNavi + naviCountInpage - 1;
			
			if(totalPageCount < endNavi) {
				endNavi = totalPageCount;
			}
			
			boolean Prev = true;
			boolean Next = true;
			
			if(startNavi == 1) {
				Prev = false;
			}
			if(endNavi == totalPageCount) {
				Next = false;
			}
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("startNavi", startNavi);
			map.put("endNavi", endNavi);
			map.put("Prev", Prev);
			map.put("Next", Next);
			return map;
		}
	}
	public HashMap<String, Object> getPageNavi(int curPage) throws Exception{
		String sql = "select count(*) as totalCount from tbl_product";
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			int totalCount = rs.getInt("totalCount");
			int recordCountInPage = 10;
			int naviCountInpage = 5;
			int totalPageCount = 0;
			
			if(totalCount % recordCountInPage > 0) {
				totalPageCount = totalCount / recordCountInPage +1;
			} else {
				totalPageCount = totalCount / recordCountInPage;
			}
			
			if(curPage < 1) {
				curPage = 1;
			} else if(curPage > totalPageCount) {
				curPage = totalPageCount;
			}
			
			int startNavi = ((curPage - 1) / naviCountInpage) * naviCountInpage + 1;
			int endNavi = startNavi + naviCountInpage - 1;
			
			if(totalPageCount < endNavi) {
				endNavi = totalPageCount;
			}
			
			boolean Prev = true;
			boolean Next = true;
			
			if(startNavi == 1) {
				Prev = false;
			}
			if(endNavi == totalPageCount) {
				Next = false;
			}
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("startNavi", startNavi);
			map.put("endNavi", endNavi);
			map.put("Prev", Prev);
			map.put("Next", Next);
			return map;
		}
	}	
}
