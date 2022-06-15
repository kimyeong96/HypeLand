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

import com.hype.dto.BlackListDTO;
import com.hype.dto.MemberDTO;

public class AdminMemberDAO {

	private BasicDataSource bds;

	public AdminMemberDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context) iCtx.lookup("java:comp/env");
			bds = (BasicDataSource) envCtx.lookup("jdbc/bds");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MemberDTO> selectAll(int start, int end) throws Exception {
		String sql = "select * from (select tbl_member.*, row_number() over(order by user_id desc) as num from tbl_member) where num between ? and ?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			ResultSet rs = pstmt.executeQuery();
			ArrayList<MemberDTO> list = new ArrayList<>();
			while (rs.next()) {
				String user_id = rs.getString("user_id");
				String user_password = rs.getString("user_password");
				String user_name = rs.getString("user_name");
				String user_date = getStringDate(rs.getDate("user_date"));
				String user_postCode = rs.getString("user_postCode");
				String user_roadAddr = rs.getString("user_roadAddr");
				String user_detailAddr = rs.getString("user_detailAddr");
				String user_phone = rs.getString("user_phone");
				String user_email = rs.getString("user_email");
				String user_blacklist = rs.getString("user_blacklist");
				list.add(new MemberDTO(user_id, user_password, user_name, user_date, user_postCode, user_roadAddr,
						user_detailAddr, user_phone, user_email, user_blacklist));
			}
			return list;
		}
	}

	public ArrayList<MemberDTO> selectById(String searchWord, int start, int end) throws Exception {
		String spl = "select * from (select tbl_member.*, row_number() over(order by user_id desc) as num from tbl_member where user_id like '%'||?||'%') where num between ? and ?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(spl);) {

			pstmt.setString(1, searchWord);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			ResultSet rs = pstmt.executeQuery();
			ArrayList<MemberDTO> list = new ArrayList<>();
			while (rs.next()) {
				String user_id = rs.getString("user_id");
				String user_password = rs.getString("user_password");
				String user_name = rs.getString("user_name");
				String user_date = getStringDate(rs.getDate("user_date"));
				String user_postCode = rs.getString("user_postCode");
				String user_roadAddr = rs.getString("user_roadAddr");
				String user_detailAddr = rs.getString("user_detailAddr");
				String user_phone = rs.getString("user_phone");
				String user_email = rs.getString("user_email");
				String user_blacklist = rs.getString("user_blacklist");
				list.add(new MemberDTO(user_id, user_password, user_name, user_date, user_postCode, user_roadAddr,
						user_detailAddr, user_phone, user_email, user_blacklist));
			}
			return list;
		}
	}

	public int modify(MemberDTO dto) throws Exception {
		String sql = "update tbl_member set user_blacklist=? where user_id=?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {

			pstmt.setString(2, dto.getUser_id());
			pstmt.setString(1, dto.getUser_blacklist());

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	public MemberDTO modifyById(String user_id) throws Exception {
		String sql = "SELECT * FROM tbl_member WHERE user_id = ?";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {

			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				String user_password = rs.getString("user_password");
				String user_name = rs.getString("user_name");
				String user_date = getStringDate(rs.getDate("user_date"));
				String user_postCode = rs.getString("user_postCode");
				String user_roadAddr = rs.getString("user_roadAddr");
				String user_detailAddr = rs.getString("user_detailAddr");
				String user_phone = rs.getString("user_phone");
				String user_email = rs.getString("user_email");
				String user_blacklist = rs.getString("user_blacklist");

				MemberDTO dto = new MemberDTO(user_id, user_password, user_name, user_date, user_postCode,
						user_roadAddr, user_detailAddr, user_phone, user_email, user_blacklist);
				return dto;
			}
			return null;
		}
	}

	public int delete(String user_id) throws Exception {
		String sql = "delete from tbl_member where user_id =?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, user_id);

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	// 해당 아이디 블랙리스트 이유 출력
	public ArrayList<BlackListDTO> selectBlackReason(String user_id) throws Exception {
		String sql = "select * from tbl_blacklist where user_id= ? order by 3 desc";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, user_id);

			ResultSet rs = pstmt.executeQuery();
			ArrayList<BlackListDTO> list = new ArrayList<>();

			while (rs.next()) {
				String black_reason = rs.getString("black_reason");
				String black_date = getStringDate(rs.getDate("black_date"));

				list.add(new BlackListDTO(user_id, black_reason, black_date));
			}
			return list;
		}

	}

	// 해당 아이디 블랙리스트 이유 삽입
	public int insertBlacklist(String user_id, String black_reason) throws Exception {
		String sql = "insert into tbl_blacklist values(?,?,sysdate)";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_id);
			pstmt.setString(2, black_reason);

			int rs = pstmt.executeUpdate();
			return rs;
		}

	}

	// 날짜 타입 변경
	public String getStringDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		return sdf.format(date);
	}

	public HashMap<String, Object> getSearchPageNavi(int curPage, String searchWord) throws Exception {
		String sql = "select count(*) as totalCount from tbl_member where user_id like '%'||?||'%'";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {

			pstmt.setString(1, searchWord);
			ResultSet rs = pstmt.executeQuery();

			rs.next();

			int totalCount = rs.getInt("totalCount");
			int recordCountInPage = 10;
			int naviCountInpage = 5;
			int totalPageCount = 0;

			if (totalCount % recordCountInPage > 0) {
				totalPageCount = totalCount / recordCountInPage + 1;
			} else {
				totalPageCount = totalCount / recordCountInPage;
			}

			if (curPage < 1) {
				curPage = 1;
			} else if (curPage > totalPageCount) {
				curPage = totalPageCount;
			}

			int startNavi = ((curPage - 1) / naviCountInpage) * naviCountInpage + 1;
			int endNavi = startNavi + naviCountInpage - 1;

			if (totalPageCount < endNavi) {
				endNavi = totalPageCount;
			}

			boolean Prev = true;
			boolean Next = true;

			if (startNavi == 1) {
				Prev = false;
			}
			if (endNavi == totalPageCount) {
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

	public HashMap<String, Object> getPageNavi(int curPage) throws Exception {
		String sql = "select count(*) as totalCount from tbl_member";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {

			ResultSet rs = pstmt.executeQuery();

			rs.next();

			int totalCount = rs.getInt("totalCount");
			int recordCountInPage = 10;
			int naviCountInpage = 5;
			int totalPageCount = 0;

			if (totalCount % recordCountInPage > 0) {
				totalPageCount = totalCount / recordCountInPage + 1;
			} else {
				totalPageCount = totalCount / recordCountInPage;
			}

			if (curPage < 1) {
				curPage = 1;
			} else if (curPage > totalPageCount) {
				curPage = totalPageCount;
			}

			int startNavi = ((curPage - 1) / naviCountInpage) * naviCountInpage + 1;
			int endNavi = startNavi + naviCountInpage - 1;

			if (totalPageCount < endNavi) {
				endNavi = totalPageCount;
			}

			boolean Prev = true;
			boolean Next = true;

			if (startNavi == 1) {
				Prev = false;
			}
			if (endNavi == totalPageCount) {
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
