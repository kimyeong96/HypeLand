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

import com.hype.dto.OrderDTO;
import com.hype.dto.QnaDTO;
import com.hype.dto.QnaReplyDTO;
import com.hype.dto.ReviewDTO;

public class AdminBoardQnaDAO {
	private BasicDataSource bds;

	public AdminBoardQnaDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context) iCtx.lookup("java:comp/env");
			bds = (BasicDataSource) envCtx.lookup("jdbc/bds");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 문의글 전체 가져오기
	public ArrayList<QnaDTO> selectAll(int start, int end) throws Exception {
		String sql = "select * from (select tbl_qna.*, row_number() over(order by seq_qna desc) as num from tbl_qna)"
				+ " where num between ? and ? ";
		try (Connection con = bds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			ResultSet rs = pstmt.executeQuery();
			ArrayList<QnaDTO> list = new ArrayList<>();

			while (rs.next()) {
				int seq_qna = rs.getInt("seq_qna");
				int seq_order = rs.getInt("seq_order");
				String user_id = rs.getString("user_id");
				String qna_type = rs.getString("qna_type");
				String qna_title = rs.getString("qna_title");
				String qna_content = rs.getString("qna_content");
				String qna_date = getStringDate(rs.getDate("qna_date"));
				String qna_status = rs.getString("qna_status");

				list.add(new QnaDTO(seq_qna, seq_order, user_id, qna_type, qna_title, qna_content, qna_status,
						qna_date));
			}
			return list;
		}
	}

	// select된 값들로 데이터 가져오기
	public ArrayList<QnaDTO> selectAllByValue(String selectedVal, int start, int end) throws Exception {
		String sql = "select * from (select rownum as num, tbl_qna.* from tbl_qna where qna_type = ? order by seq_qna desc) where num between ? and ?";

		try (Connection con = bds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, selectedVal);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			ResultSet rs = pstmt.executeQuery();
			ArrayList<QnaDTO> selectedValueList = new ArrayList<>();

			while (rs.next()) {
				int seq_qna = rs.getInt("seq_qna");
				int seq_order = rs.getInt("seq_order");
				String user_id = rs.getString("user_id");
				String qna_type = rs.getString("qna_type");
				String qna_title = rs.getString("qna_title");
				String qna_content = rs.getString("qna_content");
				String qna_status = rs.getString("qna_status");
				String qna_date = getStringDate(rs.getDate("qna_date"));

				selectedValueList.add(new QnaDTO(seq_qna, seq_order, user_id, qna_type, qna_title, qna_content,
						qna_status, qna_date));
			}
			return selectedValueList;
		}
	}

	// 문의 등록페이지에 뿌려줄 데이터
	public ArrayList<QnaDTO> registerBySeq(int seq_qna) throws Exception {
		String sql = "select * from tbl_qna where seq_qna = ?";

		try (Connection con = bds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, seq_qna);

			ResultSet rs = pstmt.executeQuery();
			ArrayList<QnaDTO> list = new ArrayList<>();

			while (rs.next()) {
				int seq_order = rs.getInt("seq_order");
				String user_id = rs.getString("user_id");
				String qna_type = rs.getString("qna_type");
				String qna_title = rs.getString("qna_title");
				String qna_content = rs.getString("qna_content");
				String qna_status = rs.getString("qna_content");
				String qna_date = getStringDate(rs.getDate("qna_date"));

				list.add(new QnaDTO(seq_qna, seq_order, user_id, qna_type, qna_title, qna_content, qna_status,
						qna_date));
			}
			return list;
		}
	}

	// 문의 등록페이지에 뿌려줄 댓글들
	public ArrayList<QnaReplyDTO> qnaReplyBySeq(int seq_qna) throws Exception {
		String sql = "select * from tbl_reply where seq_qna = ? order by reply_date asc";

		try (Connection con = bds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, seq_qna);

			ResultSet rs = pstmt.executeQuery();
			ArrayList<QnaReplyDTO> list = new ArrayList<>();

			while (rs.next()) {
				int seq_reply = rs.getInt("seq_reply");
				String user_id = rs.getString("user_id");
				String qna_reply = rs.getString("qna_reply");
				String reply_date = getStringDate(rs.getDate("reply_date"));

				list.add(new QnaReplyDTO(seq_reply, user_id, seq_qna, qna_reply, reply_date));
			}
			return list;
		}
	}

	// 댓글 등록
	public int insert(QnaReplyDTO dto) throws Exception {
		String sql = "insert into tbl_reply values(seq_reply.nextval, 'admin', ?, ?, sysdate)";
		try (Connection con = bds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, dto.getSeq_qna());
			pstmt.setString(2, dto.getQna_reply());

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	// 댓글 등록 하면 해당 문의번호의 답변 상태 update
	public int updateReplyStatus(int seq_qna) throws Exception {
		String sql = "update tbl_qna set qna_status = '답변완료' where seq_qna = ?";

		try (Connection con = bds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, seq_qna);
			int rs = pstmt.executeUpdate();
			return rs;

		}
	}

	// 댓글 삭제
	public int deleteReply(int seq_reply) throws Exception {
		String sql = "delete from tbl_reply where seq_reply = ?";
		try (Connection con = bds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, seq_reply);
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	// 게시글 삭제
	public int deleteQnaBoard(int seq_qna) throws Exception {
		String sql = "delete from tbl_qna where seq_qna = ?";
		try (Connection con = bds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, seq_qna);
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	// 날짜 타입 변경
	public String getStringDate(Date date) {
		// 1900년 02월 02일 00시 00분 00초
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return sdf.format(date);
	}

	// 페이지네이션 Map
	public HashMap<String, Object> getPageNavi(int curPage) throws Exception {
		String sql = "select count(*) as totalCnt from tbl_qna";

		try (Connection con = bds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql)) {

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

	// 선택된 페이지네이션 Map
	public HashMap<String, Object> selectedGetPageNavi(int curPage, String selectedVal) throws Exception {
		String sql = "select count(*) as totalCnt from tbl_qna where qna_type = ?";

		try (Connection con = bds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, selectedVal);

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
