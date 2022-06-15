package com.hype.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.hype.dto.CartDTO;
import com.hype.dto.ImageDTO;
import com.hype.dto.ProductDTO;
import com.hype.dto.RankingDTO;

public class ProductDAO {
	private BasicDataSource bds;

	public ProductDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context) iCtx.lookup("java:comp/env");
			bds = (BasicDataSource) envCtx.lookup("jdbc/bds");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 데이터베이스에서 category로 seq_product 불러오기
	public ArrayList<Integer> selectSeqPbyCate(String category) throws Exception {
		String sql = "select seq_product from tbl_product where category=?";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {

			pstmt.setString(1, category);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<Integer> list = new ArrayList<>();
			while (rs.next()) {
				int seq_product = rs.getInt("seq_product");
				list.add(seq_product);
			}
			return list;
		}
	}

	// 데이터베이스에서 category로 tbl_product 불러오기
	public ArrayList<ProductDTO> selectTblProbyCtg(String category) throws Exception {
		String sql = "select * from tbl_product where category=?  order by 1 desc";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {

			pstmt.setString(1, category);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<ProductDTO> list = new ArrayList<>();
			while (rs.next()) {
				int seq_product = rs.getInt("seq_product");
				String product_code = rs.getString("product_code");
				String product_name = rs.getString("product_name");
				int product_price = rs.getInt("product_price");
				String product_content = rs.getString("product_content");
				list.add(new ProductDTO(seq_product, product_code, category, product_name, product_price,
						product_content));
			}
			return list;
		}
	}

	// 데이터베이스에서 category로 tbl_image에서 사진 불러오기
	public ArrayList<ImageDTO> getTblImgbyCtg(String category) throws Exception {
		String sql = "select * from tbl_image where image_name like '%main%' and seq_product in (select seq_product from tbl_product where category like ?) order by 2 desc";
		// 이거 추가

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {

			pstmt.setString(1, category);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<ImageDTO> list = new ArrayList<>();
			while (rs.next()) {
				int seq_product = rs.getInt("seq_product");
				String image_name = rs.getString("image_name");
				String image_path = rs.getString("image_path");
				list.add(new ImageDTO(image_name, seq_product,image_path));
			}
			return list;
		}
	}

	// 사진 개수 세기
	public int countPro(String category) throws Exception {
		String sql = "select count(*) as cnt from tbl_product where category=?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, category);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("cnt");

			}
			return 0;
		}

	}

	// ranking
	public ArrayList<RankingDTO> ranking() throws Exception {
		String sql = "select row_number() over(order by 2) 순위, 상품명, 총수량 from (select buy_name 상품명, sum(buy_qty) 총수량 from tbl_buy group by buy_name order by 2 desc) where rownum < 9";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			ResultSet rs = pstmt.executeQuery();
			ArrayList<RankingDTO> list = new ArrayList<>();
			while (rs.next()) {
				int rank = rs.getInt("순위");
				String product_name = rs.getString("상품명");
				int product_sum = rs.getInt("총수량");
				list.add(new RankingDTO(rank, product_name, product_sum));
			}
			return list;
		}
	}

	// 데이터베이스에서 상품이름으로 tbl_image에서 사진 불러오기
	public ArrayList<ImageDTO> getTblImgbyProName(String product_name) throws Exception {
		String sql = "select * from tbl_image where seq_product in (select seq_product from tbl_product where product_name=?) and image_name like '%main%' order by 2 desc";
		// and image_name like '%main%' order by 1 desc 이거 추가

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {

			pstmt.setString(1, product_name);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<ImageDTO> list = new ArrayList<>();
			while (rs.next()) {
				int seq_product = rs.getInt("seq_product");
				String image_name = rs.getString("image_name");
				String image_path = rs.getString("image_path");
				list.add(new ImageDTO(image_name, seq_product,image_path));
			}
			return list;
		}
	}

	// 데이터베이스에서 상품이름으로 tbl_product가져오기
	public ArrayList<ProductDTO> selectAllbyName(String product_name) throws Exception {
		String sql = "select * from tbl_product where product_name = ?";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, product_name);

			ResultSet rs = pstmt.executeQuery();

			ArrayList<ProductDTO> list = new ArrayList<>();
			while (rs.next()) {
				int seq_product = rs.getInt("seq_product");
				String product_code = rs.getString("product_code");
				String category = rs.getString("category");
				int product_price = rs.getInt("product_price");
				String product_content = rs.getString("product_content");

				list.add(new ProductDTO(0, product_code, category, product_name, product_price, product_content));

			}
			return list;
		}
	}

	////////////////////////////////////////////
	// 상품 정보 가져오기
	public ArrayList<ProductDTO> selectAll(int num) throws Exception {
		String sql = "select * from tbl_product where seq_product = ?";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, num);

			ResultSet rs = pstmt.executeQuery();

			ArrayList<ProductDTO> list = new ArrayList<>();
			while (rs.next()) {
				int seq_product = rs.getInt("seq_product");
				String product_code = rs.getString("product_code");
				String category = rs.getString("category");
				String product_name = rs.getString("product_name");
				int product_price = rs.getInt("product_price");
				String product_content = rs.getString("product_content");

				list.add(new ProductDTO(seq_product, product_code, category, product_name, product_price, product_content));

			}
			return list;
		}
	}

	// 상품상세페이지 이미지 가져오기
	public ArrayList<ImageDTO> selectAllImgBySeq(int seq_product) throws Exception {
		String sql = "select * from tbl_image where seq_product=? and image_name not in ('bye','bye1')";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {

			pstmt.setInt(1, seq_product);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<ImageDTO> list = new ArrayList<>();
			while (rs.next()) {
				String image_name = rs.getString("image_name");
				String image_path = rs.getString("image_path");
				list.add(new ImageDTO(image_name, seq_product,image_path));
			}
			return list;
		}
	}

	// 장바구니에 넣기
	public int insertCart(CartDTO CartDto) throws Exception {
		String sql = "insert into tbl_cart values(seq_cart.nextval, ?, ?, ?, ?, ?)";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, CartDto.getSeq_product());
			pstmt.setString(2, CartDto.getUser_id());
			pstmt.setString(3, CartDto.getCart_name());
			pstmt.setInt(4, CartDto.getCart_quantity());
			pstmt.setInt(5, CartDto.getCart_price());

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	public boolean selectAllCart(String user_id, int seq_product) throws Exception{
        String sql = "select * from tbl_cart where user_id=? and seq_product=?";

        try(Connection con = bds.getConnection();
           PreparedStatement pstmt = con.prepareStatement(sql)){

            pstmt.setString(1, user_id);
            pstmt.setInt(2, seq_product);

            ResultSet rs = pstmt.executeQuery();

           if (rs.next()) {
               return true;
           }
           return false;
        }
    }
	
	// 해당 유저 장바구니에 상품이 이미 존재할때 수량 업데이트 해주기
    public int updateCart(CartDTO CartDto) throws Exception{
       String sql = "update tbl_cart set cart_quantity = cart_quantity + ? where user_id = ? and seq_product = ?";

       try(Connection con = bds.getConnection();
          PreparedStatement pstmt = con.prepareStatement(sql)){

          pstmt.setInt(1, CartDto.getCart_quantity());
          pstmt.setString(2, CartDto.getUser_id());
          pstmt.setInt(3, CartDto.getSeq_product());

          int rs = pstmt.executeUpdate();
          return rs;
       }
    }

}
