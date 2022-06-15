package com.hype.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hype.dao.AdminBoardQnaDAO;
import com.hype.dto.QnaDTO;
import com.hype.dto.QnaReplyDTO;

@WebServlet("*.qna")
public class AdminBoardQnaController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html ; charset=utf-8");

		String uri = request.getRequestURI();
		System.out.println("요청 uri : " + uri);

		if (uri.equals("/boardQna.qna")) { // 문의관리 페이지

			int curPage = Integer.parseInt(request.getParameter("curPage"));
			System.out.println(curPage);

			AdminBoardQnaDAO dao = new AdminBoardQnaDAO();

			try {
				ArrayList<QnaDTO> list = dao.selectAll(curPage * 10 - 9, curPage * 10);
				System.out.println("asdqwezxc"+list);
				HashMap map = dao.getPageNavi(curPage);
				request.setAttribute("naviMap", map);
				
				System.out.println("현재 페이지 : " + curPage);
				System.out.println("startNavi : " + map.get("startNavi"));
				System.out.println("endNavi : " + map.get("endNavi"));
				System.out.println("needPrev 요? " + map.get("needPrev"));
				System.out.println("needNext 필요? " + map.get("needNext"));

				request.setAttribute("list", list);
				request.setAttribute("curPage", curPage);
				request.getRequestDispatcher("/admin/board/boardManage.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/selectedProc.qna")) { // 문의 종류에서 선택된것
			AdminBoardQnaDAO dao = new AdminBoardQnaDAO();

			String selectedVal = request.getParameter("selectedVal");
			System.out.println(selectedVal);

			// 현재 페이지 받기
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			System.out.println(curPage);


				try {
					ArrayList<QnaDTO> list = dao.selectAllByValue(selectedVal, curPage*10-9, curPage*10);
					request.setAttribute("list", list);
					
					HashMap map = dao.selectedGetPageNavi(curPage, selectedVal);
					request.setAttribute("naviMap", map);

					System.out.println("현재 페이지 : " + curPage);
					System.out.println("startNavi : " + map.get("startNavi"));
					System.out.println("endNavi : " + map.get("endNavi"));
					System.out.println("needPrev 요? " + map.get("needPrev"));
					System.out.println("needNext 필요? " + map.get("needNext"));
					
					request.setAttribute("curPage", curPage);

					request.getRequestDispatcher("/admin/board/boardManageSelected.jsp").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}

		} else if (uri.equals("/boardQnaRegister.qna")) { // 문의 상세페이지(댓글 목록 보여주고, 글 내용 보여주고)
			System.out.println("등록이야");
			int seq_qna = Integer.parseInt(request.getParameter("seq_qna"));
			System.out.println(seq_qna);

			AdminBoardQnaDAO dao = new AdminBoardQnaDAO();
			try {
				ArrayList<QnaDTO> list = dao.registerBySeq(seq_qna);
				ArrayList<QnaReplyDTO> replyList = dao.qnaReplyBySeq(seq_qna);

				request.setAttribute("list", list);
				request.setAttribute("replyList", replyList);
				request.getRequestDispatcher("/admin/board/boardManageRegister.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (uri.equals("/registerReplyQna.qna")) { // 댓글 등록

			// BoardQnaDAO에서 값 받아오기
			// 관리자가 쓴 댓글 내용
			String adminReply = request.getParameter("adminReply");
			System.out.println("adminReply : " + adminReply);

			// 해당 QnA 글 번호
			int seq_qna = Integer.parseInt(request.getParameter("seq_qna"));
			System.out.println("seq_qna : " + seq_qna);

			AdminBoardQnaDAO dao = new AdminBoardQnaDAO();

			try {
				//게시글 답변 했을 때 답변 상태 update
				
				 
				int rs = dao.insert(new QnaReplyDTO(0, null, seq_qna, adminReply, null));
				int replyRs = dao.updateReplyStatus(seq_qna); 
				if (rs > 0 && replyRs >0) { // 모든 댓글 데이터를 보내줌
					System.out.println("댓글 등록 성공");
					ArrayList<QnaReplyDTO> replyList = dao.qnaReplyBySeq(seq_qna);
					Gson gson = new Gson();
					String result = gson.toJson(replyList);
					response.getWriter().append(result);

				} else {
					System.out.println("댓글 등록 실패");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/deleteReplyQna.qna")) { // 댓글 삭제

			// 댓글 번호
			int seq_reply = Integer.parseInt(request.getParameter("seq_reply"));
			System.out.println(seq_reply);

			// QnA 글 번호
			int seq_qna = Integer.parseInt(request.getParameter("seq_qna"));
			System.out.println(seq_qna);

			AdminBoardQnaDAO dao = new AdminBoardQnaDAO();

			try {
				int rs = dao.deleteReply(seq_reply);
				if (rs > 0) {
					System.out.println("댓글 삭제 완료");
					ArrayList<QnaReplyDTO> replyList = dao.qnaReplyBySeq(seq_qna);
					Gson gson = new Gson();
					String result = gson.toJson(replyList);
					response.getWriter().append(result);
				} else {
					response.getWriter().append("fail");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/deleteQnaBoard.qna")) {// QnA 게시물 자체를 삭제

			// QnA 글 번호
			int seq_qna = Integer.parseInt(request.getParameter("seq_qna"));
			System.out.println("/deleteQnaBoard.qna : seq_qna " + seq_qna);

			AdminBoardQnaDAO dao = new AdminBoardQnaDAO();
			try {
				int rs = dao.deleteQnaBoard(seq_qna);

				if (rs > 0) {
					System.out.println("QnA 게시글 삭제 완료");

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
