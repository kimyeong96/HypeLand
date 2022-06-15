package com.hype.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.hype.dto.PayDTO;

public class AdminMainDAO {
	private BasicDataSource bds;

	public AdminMainDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context) iCtx.lookup("java:comp/env");
			bds = (BasicDataSource) envCtx.lookup("jdbc/bds");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원수 출력
	public int MemberCnt() throws Exception {
		String sql = "select count(*) as totalCnt from tbl_member";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			ResultSet rs = pstmt.executeQuery();

			int totalCnt = 0;

			if (rs.next()) {
				totalCnt = rs.getInt("totalCnt");
			}
			return totalCnt;
		}
	}

	// 매출 출력
	public int TotalProfit() throws Exception {
		String sql = "select sum(pay_price) as totalProfit from tbl_pay";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			ResultSet rs = pstmt.executeQuery();

			int totalProfit = 0;

			if (rs.next()) {
				totalProfit = rs.getInt("totalProfit");
			}
			return totalProfit;
		}
	}

	// 구매 건수
	public int PurchaseCnt() throws Exception {
		String sql = "select count(*) as purchaseCnt from tbl_pay";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			ResultSet rs = pstmt.executeQuery();

			int purchaseCnt = 0;

			if (rs.next()) {
				purchaseCnt = rs.getInt("purchaseCnt");
			}
			return purchaseCnt;
		}
	}

	// 상품 갯수
	public int ProductCnt() throws Exception {
		String sql = "select count(*) as productCnt from tbl_product";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			ResultSet rs = pstmt.executeQuery();

			int productCnt = 0;

			if (rs.next()) {
				productCnt = rs.getInt("productCnt");
			}
			return productCnt;
		}
	}

	// 카테고리 상품 데이터 가져오기
	public int cntCategory(String data) throws Exception {
		String sql = "select category, sum(buy_qty) as cntCategory from tbl_product inner join tbl_buy on(product_name=buy_name) where category = ? group by category";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, data);
			ResultSet rs = pstmt.executeQuery();

			int cntCategory = 0;

			if (rs.next()) {
				cntCategory = rs.getInt("cntCategory");
			}
			return cntCategory;
		}
	}

	// 날짜별 매출 뽑아오기
	public ArrayList dailyTotalProfit() throws Exception {
		String sql = "select to_char(pay_date, 'yyyy-mm-dd') as day, sum(pay_price) as totalPrice from tbl_pay group by to_char(pay_date,'yyyy-mm-dd') order by 1";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			ResultSet rs = pstmt.executeQuery();

			ArrayList list = new ArrayList();

			while (rs.next()) {
				int totalPrice = rs.getInt("totalPrice");
				String day = getStringDate(rs.getDate("day"));
				list.add(new PayDTO(0, totalPrice, null, day));
			}
			return list;
		}
	}

	// 날짜 타입 변경
	public String getStringDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM월 dd일");
		return sdf.format(date);
	}

	// 모든 상품개수 가져오기
	public int allBuyQty() throws Exception {
		String sql = "select sum(buy_qty) as allBuyQty from tbl_buy";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			ResultSet rs = pstmt.executeQuery();

			int allBuyQty = 0;

			if (rs.next()) {
				allBuyQty = rs.getInt("allBuyQty");
			}
			return allBuyQty;
		}
	}

}
