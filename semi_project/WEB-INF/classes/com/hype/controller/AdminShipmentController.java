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
import com.hype.dao.AdminShipmentDAO;
import com.hype.dto.BuyDTO;
import com.hype.dto.OrderDTO;


@WebServlet("*.sh")
public class AdminShipmentController extends HttpServlet {
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html ; charset=utf-8");
		
		String uri = request.getRequestURI();
		System.out.println("요청 url : " + uri);
		
		if(uri.equals("/shipManage.sh")) { // 왼쪽 네브바에서 배송 정보 변경 클릭시 이 페이지로 이동: 실적적으로 shipManage.sh?curPage=1 임
			System.out.println("shipManage.sh 성공");
			AdminShipmentDAO dao = new AdminShipmentDAO();

			// 일단 무조건 curPage는 1로 받아짐 -> 그 후 페이지네이션 이동시 curPage 변경
			
			 
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			System.out.println(curPage);
			
			try {
				HashMap map = dao.getPageNavi(curPage);
				request.setAttribute("naviMap", map);

				// tbl_order의 모든 데이터들을 가져오고 forward 해주는 작업
				ArrayList<OrderDTO> list = dao.selectAll(curPage*10-9, curPage*10);
				request.setAttribute("list", list);
				
				// 페이지네이션 HashMap도 forward 해줌
				request.getRequestDispatcher("/admin/delivery/shipmentManage.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(uri.equals("/shipModify.sh")) {  // 배송 정보 페이지에서 수정 버튼(연필모양)을 눌렀을 때 이동 페이지
			
			// 배송 정보 페이지에서 수정 버튼(연필모양)을 눌렀을 때 해당 seq_order를 get으로 보낸걸 받아옴
			int seq_order = Integer.parseInt(request.getParameter("seq_order"));
			AdminShipmentDAO dao = new AdminShipmentDAO();
			
			try {
				
				// 해당 seq_order를 통해 해당 상품의 데이터를 dao를 통해 list로 받아옴
				ArrayList<OrderDTO> list = dao.selectAllBySeq(seq_order);
				request.setAttribute("list", list);
				
				// seq_order를 통해 사용자가 구매한 목록을 보여줌 
	            ArrayList<BuyDTO> buyList = dao.selectAllBuyList(seq_order);
	            request.setAttribute("buyList", buyList);
	            
				// 배송 정보 수정페이지로 데이터 뿌리기 
				request.getRequestDispatcher("/admin/delivery/shipmentModify.jsp").forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(uri.equals("/shipmentModifyProc.sh")) { // 배송 정보 수정 페이지에서 수정완료 버튼을 눌렀을 때의 uri
			
			// 배송 정보 수정 페이지의 해당 seq_order를 가져옴
			int seq_order = Integer.parseInt(request.getParameter("seq_order"));
			String order_name = request.getParameter("order_name");
			
			System.out.println("문의 번호, 이름 : " + seq_order + " : " + order_name);
			
			
			// phone 번호가 나누어져 있어서 하나로 모으는 작업 
			String phone1= request.getParameter("phone1");
			String phone2= request.getParameter("phone2");
			String phone3= request.getParameter("phone3");
			String order_phone = phone1+phone2+phone3;
			
			String order_postCode = request.getParameter("postCode");
			
			System.out.println("전화번호, 우편번호 : " + order_phone + " : " + order_postCode);
			
			
			// 주소를 하나로 합치는 작업 
	         String roadAddr = request.getParameter("roadAddr");
	         String order_address = "";
	                  
	         // 상세주소가 없을 때와 있을 때 구분
	         if(request.getParameter("detailAddr").equals("")) { 
	            order_address = roadAddr;
	         }else {
	            order_address = roadAddr + " " + request.getParameter("detailAddr");
	         }
	                  
	         System.out.println("전체주소 : " + order_address);
	         String order_status = request.getParameter("order_status");
	         System.out.println("배송상태 : " + order_status);
	         AdminShipmentDAO dao = new AdminShipmentDAO();

			try { 
				int rs = dao.modify(new OrderDTO(seq_order, null,order_name,order_phone,order_postCode,order_address,null,order_status));
				if(rs > 0) { 
					System.out.println("배송 정보 수정 완료");
					response.sendRedirect("/shipManage.sh?curPage=1"); // 배송 정보 페이지로 이동
				} 
			}catch (Exception e) {
				e.printStackTrace();
			}

			
			
		}else if(uri.equals("/searchProc.sh")) { // 배송 정보 페이지에서 검색했을 때의 uri
			String searchKeyword = request.getParameter("searchKeyword"); // 해당 키워드(배송 상태로 검색한 결과)
			AdminShipmentDAO dao = new AdminShipmentDAO();
			
			try {
				ArrayList<OrderDTO> list = dao.searchByTitle(searchKeyword);
				
				// ajax 이용
				Gson gson = new Gson();
				String rs = gson.toJson(list);
				System.out.println(rs);
				response.setCharacterEncoding("utf-8");
				response.getWriter().append(rs);	
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(uri.equals("/selectedProc.sh")) {
			AdminShipmentDAO dao = new AdminShipmentDAO(); 
			
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			System.out.println(curPage);
			
			String selectedVal = request.getParameter("selectedVal");
			System.out.println(selectedVal);
			
			try {
				ArrayList<OrderDTO> list = dao.selectAllByValue(selectedVal,curPage*10-9, curPage*10);
				request.setAttribute("list", list);
				
				HashMap map = dao.selectedGetPageNavi(curPage,selectedVal);
				request.setAttribute("naviMap", map);

				System.out.println("현재 페이지 : " + curPage);
				System.out.println("startNavi : " + map.get("startNavi"));
				System.out.println("endNavi : " + map.get("endNavi"));
				System.out.println("needPrev 요? " + map.get("needPrev"));
				System.out.println("needNext 필요? " + map.get("needNext"));
				
				request.getRequestDispatcher("/admin/delivery/shipmentManageSelected.jsp").forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
