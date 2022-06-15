package com.hype.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.hype.dto.ImageDTO;
import com.hype.dto.ReviewDTO;

public class AdminBoardReviewDAO {
	private BasicDataSource bds;

	public AdminBoardReviewDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 전체 리뷰 보여주기 
		public ArrayList<ReviewDTO> selectAll(int start, int end) throws Exception {
			String sql = "select * from (select tbl_review.*, row_number() over(order by seq_review desc) as num from tbl_review)"
					+ " where num between ? and ?";

			try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
				
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				ResultSet rs = pstmt.executeQuery();
				ArrayList<ReviewDTO> list = new ArrayList<>();
				
				while(rs.next()) {
					int seq_review = rs.getInt("seq_review");
					int seq_product = rs.getInt("seq_product");
					String user_id = rs.getString("user_id");
					String review_content = rs.getString("review_content");
					String review_date = getStringDate(rs.getDate("review_date"));
					int review_rate = rs.getInt("review_rate");
					list.add(new ReviewDTO(seq_review,seq_product,user_id,review_content,review_date,review_rate));
				}
				return list;
			}
		}
	
	// seq_review로 검색된 해당 내용 가져오기 
	public ArrayList<ReviewDTO> selectContentBy(int seq_review) throws Exception{
		String sql = "select * from tbl_review where seq_review = ?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setInt(1, seq_review);
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<ReviewDTO> reviewList = new ArrayList<>();
			
			while(rs.next()) {
				int seq_product = rs.getInt("seq_product");
				String user_id = rs.getString("user_id");
				String review_content = rs.getString("review_content");
				String review_date = getStringDate(rs.getDate("review_date"));
				int review_rate = rs.getInt("review_rate");
				reviewList.add(new ReviewDTO(seq_review, seq_product, user_id, review_content, review_date, review_rate));
			}
			
			return reviewList;
		}
	}
	// 상품번호로 이미지 가져오기
	public ArrayList<ImageDTO> selectImageBy(int seq_product) throws Exception{
		String sql = "select * from tbl_image where seq_product = ?";
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, seq_product);
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<ImageDTO> imageList = new ArrayList<ImageDTO>();
			while(rs.next()) {
				String image_name = rs.getString("image_name");
				String image_path = rs.getString("image_path");
				imageList.add(new ImageDTO(image_name, seq_product,image_path));
			}
			return imageList;
		}
	}
		
	// seq_review로 해당 리뷰 삭제
	public int delete(int seq_review) throws Exception {
		String sql = "delete from tbl_review where seq_review = ?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setInt(1, seq_review);
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
		
	
	// 아이디로 정보 검색어로 찾기 
			public ArrayList<ReviewDTO> searchByKeyword(String searchKeyword, int start, int end) throws Exception{
				String sql = "select * from (select rownum as num, tbl_review.* from tbl_review where user_id = ? order by seq_review desc) where num between ? and ?";
				try(Connection con = bds.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql)){

					pstmt.setString(1, searchKeyword);
					pstmt.setInt(2, start);
					pstmt.setInt(3, end);
					
					
					ResultSet rs = pstmt.executeQuery();
					ArrayList<ReviewDTO> list = new ArrayList<>();
					while(rs.next()) {
						int seq_review = rs.getInt("seq_review");
						int seq_product = rs.getInt("seq_product");
						String user_id = rs.getString("user_id");
						String review_content = rs.getString("review_content");
						String review_date = rs.getString("review_date");
						int review_rate = rs.getInt("review_rate");
						list.add(new ReviewDTO(seq_review, seq_product, user_id, review_content, review_date, review_rate));
					}
					return list;
				}
			}
	
	
		
	// 날짜 타입 변경
	public String getStringDate(Date date) {
			// 1900년 02월 02일 00시 00분 00초
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			return sdf.format(date);
	}
	
	
	
	// 전체 조회 페이지네이션 Map
		public HashMap<String, Object> getPageNavi(int curPage) throws Exception{
			String sql = "select count(*) as totalCnt from tbl_review";
			
			try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
				
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				
				int totalCnt = rs.getInt("totalCnt"); 
				int recordCntPerPage = 10; 
				int naviCntPerPage = 5; 
				int pageTotalCnt = 0; 
				
				
				if(totalCnt % recordCntPerPage > 0) { 
					pageTotalCnt = totalCnt / recordCntPerPage + 1;
				}else {
					pageTotalCnt = totalCnt / recordCntPerPage;
				}
				
				if(curPage < 1) { 
					curPage = 1; 
				}else if(curPage > pageTotalCnt) { 
					curPage = pageTotalCnt; 
				}					
				
				
				int startNavi = ((curPage-1) / naviCntPerPage) * naviCntPerPage + 1;
				int endNavi = startNavi + naviCntPerPage - 1;
				
				
				if(pageTotalCnt < endNavi) { 
					endNavi = pageTotalCnt; 
				}
				
				
				boolean needPrev = true; 
				boolean needNext = true; 
				
				if(startNavi == 1) {
					needPrev = false;
				}
				if(endNavi == pageTotalCnt) {
					needNext = false;
				}
				
				HashMap<String, Object> map = new HashMap<>();
				map.put("startNavi", startNavi);
				map.put("endNavi", endNavi);
				map.put("needPrev", needPrev);
				map.put("needNext", needNext);
				
				return map;
			}
		}
	
		// 선택 조회 페이지네이션 Map
		// 선택된 페이지네이션 Map
				public HashMap<String, Object> searchedGetPageNavi(int curPage, String searchKeyword) throws Exception {
					String sql = "select count(*) as totalCnt from tbl_review where user_id = ?";

					try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
						
						pstmt.setString(1, searchKeyword);
						
						ResultSet rs = pstmt.executeQuery();
						rs.next();

						int totalCnt = rs.getInt("totalCnt");
						int recordCntPerPage = 10;
						int naviCntPerPage = 5;
						int pageTotalCnt = 0;

						if (totalCnt % recordCntPerPage > 0) {
							pageTotalCnt = totalCnt / recordCntPerPage + 1;
						} else {
							pageTotalCnt = totalCnt / recordCntPerPage;
						}

						if (curPage < 1) {
							curPage = 1;
						} else if (curPage > pageTotalCnt) {
							curPage = pageTotalCnt;
						}

						int startNavi = ((curPage - 1) / naviCntPerPage) * naviCntPerPage + 1;
						int endNavi = startNavi + naviCntPerPage - 1;

						if (pageTotalCnt < endNavi) {
							endNavi = pageTotalCnt;
						}

						boolean needPrev = true;
						boolean needNext = true;

						if (startNavi == 1) {
							needPrev = false;
						}
						if (endNavi == pageTotalCnt) {
							needNext = false;
						}

						HashMap<String, Object> map = new HashMap<>();
						map.put("startNavi", startNavi);
						map.put("endNavi", endNavi);
						map.put("needPrev", needPrev);
						map.put("needNext", needNext);

						return map;
					}
				}

}
