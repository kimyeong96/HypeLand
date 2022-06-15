package com.hype.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.hype.dao.PayDAO;
import com.hype.dto.DeliveryDTO;
import com.hype.dto.MemberDTO;


@WebServlet("*.deli")
public class DeliveryController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/jsp; charset=UTF-8");

		String uri = request.getRequestURI();
		System.out.println("요청 uri : " + uri);
		
		if (uri.equals("/toSearchDeli.deli")) {  // 예비주소지 검색
			HttpSession session = request.getSession();
			String user_id = ((MemberDTO)session.getAttribute("loginSession")).getUser_id();
			
			PayDAO dao = new PayDAO();
			
			try {
				ArrayList<DeliveryDTO> list = dao.deliSelectById(user_id);
				request.setAttribute("deli_list", list);
				request.getRequestDispatcher("/pay/popupDeliSearch.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if (uri.equals("/toinsertDeli.deli")) { //직접 입력창으로 
			response.sendRedirect("/pay/popupDeliInsert.jsp");
			
		}else if (uri.equals("/toModifyDeli.deli")) { // 수정창으로
			request.setCharacterEncoding("utf-8");
			int seq_deli = Integer.parseInt(request.getParameter("seq_deli"));
			System.out.println("seq_deli : " + seq_deli);
			PayDAO dao = new PayDAO();
			
			try {
				DeliveryDTO dto = dao.deliSelectBySeq(seq_deli);
				if(dto != null) {
					System.out.println(dto);
					request.setAttribute("deli", dto);
					request.getRequestDispatcher("/pay/popupDeilModify.jsp").forward(request, response);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if (uri.equals("/toModifyDeliProc.deli")) { // 수정프로세스
			int seq_deli = Integer.parseInt(request.getParameter("seq_deli"));
			
			String deli_place = request.getParameter("deli_place");
			String deli_name = request.getParameter("deli_name");
			String deli_phone = request.getParameter("deli_phone");
			String deli_postCode = request.getParameter("deli_postCode");
			String deli_address = request.getParameter("deli_address");
			PayDAO dao = new PayDAO();
			
			try {
				int rs = dao.update(new DeliveryDTO(seq_deli,null, deli_place, deli_name,
									deli_phone, deli_postCode, deli_address));

				if(rs > 0) {
					System.out.println("수정성공");
					response.getWriter().append("modifySuccess");
				}else {
					System.out.println("수정실패");
					response.getWriter().append("modifyFail");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if (uri.equals("/toEnrollDeli.deli")) { // 등록창으로
			response.sendRedirect("/pay/popupDeliEnroll.jsp");
			
		}else if (uri.equals("/toinsertDeliProc.deli")) { // 등록프로세스
			HttpSession session = request.getSession();
			String user_id = ((MemberDTO)session.getAttribute("loginSession")).getUser_id();
			String deli_place = request.getParameter("deli_place");
			String deli_name = request.getParameter("deli_name");
			String deli_phone = request.getParameter("deli_phone");
			String deli_postCode = request.getParameter("deli_postCode");
			String deli_address = request.getParameter("deli_address");
			PayDAO dao = new PayDAO();
			
			try {
				int rs = dao.deliInsert(new DeliveryDTO(0,user_id,  deli_name,deli_place,
									deli_phone, deli_address, deli_postCode));

				if(rs > 0) {
					System.out.println("주소지 생성성공");
					response.getWriter().append("enrollSuccess");
				}else {
					System.out.println("주소지 생성실패");
					response.getWriter().append("enrollFail");
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if (uri.equals("/toDeleteProc.deli")) { // 배송지 삭제
			int seq_deli = Integer.parseInt(request.getParameter("seq_deli"));
			PayDAO dao = new PayDAO();
			
			try {
				int rs = dao.delete(seq_deli);
				
				if(rs>0) {
					System.out.println("삭제 성공");
					response.getWriter().append("deleteSuccess");
				}else {
					System.out.println("삭제 실패");
					response.getWriter().append("deleteFail");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if (uri.equals("/toUserInfoSelect.deli")) { // 기본유저 배송지 뽑기 << MemberDAO로 바꿔줄것 나중에
			HttpSession session = request.getSession();
			String user_id = ((MemberDTO)session.getAttribute("loginSession")).getUser_id();
			
			PayDAO dao = new PayDAO();
			
			try {
				MemberDTO dto = dao.selectById(user_id);
				Gson gson = new Gson();
				String result = gson.toJson(dto);
				response.getWriter().append(result);
				
			}catch(Exception e) {
				
			}
		}else if(uri.equals("/toPay.deli")) { // pay창에 ajax로 값 뿌려주기
			int seq_deli = Integer.parseInt(request.getParameter("seq_deli"));
			
			PayDAO dao = new PayDAO();
			
			try {
				DeliveryDTO dto = dao.deliSelectBySeq(seq_deli);
				Gson gson = new Gson();
				String result = gson.toJson(dto);
				response.getWriter().append(result);
				
			}catch(Exception e) {
			}
		}
	}
}
