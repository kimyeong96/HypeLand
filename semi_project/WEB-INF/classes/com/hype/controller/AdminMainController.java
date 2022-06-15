package com.hype.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hype.dao.AdminMainDAO;

@WebServlet("*.ad")
public class AdminMainController extends HttpServlet {

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

		if (uri.equals("/admin.ad")) {
			System.out.println("admin이야");
			AdminMainDAO dao = new AdminMainDAO();
			try {
				// 맴버수
				int memberCnt = dao.MemberCnt();
				System.out.println(memberCnt);

				// 총 매출
				int TotalProfit = dao.TotalProfit();
				System.out.println(TotalProfit);

				// 구매 건수
				int purchaseCnt = dao.PurchaseCnt();
				System.out.println(purchaseCnt);

				// 상품 갯수
				int productCnt = dao.ProductCnt();
				System.out.println(productCnt);

				// 카테고리 갯수
				int cntCategoryTop = dao.cntCategory("TOP");
				int cntCategoryBottom = dao.cntCategory("BOTTOM");
				int cntCategoryAcc = dao.cntCategory("ACCESSORY");
				int cntCategoryBag = dao.cntCategory("BAG");

				// 전체 구매수
				int allBuyQty = dao.allBuyQty();

				request.setAttribute("memberCnt", memberCnt);
				request.setAttribute("TotalProfit", TotalProfit);
				request.setAttribute("purchaseCnt", purchaseCnt);
				request.setAttribute("productCnt", productCnt);

				// 원형 그래프.
				request.setAttribute("cntCategoryTop", cntCategoryTop);
				request.setAttribute("cntCategoryBottom", cntCategoryBottom);
				request.setAttribute("cntCategoryAcc", cntCategoryAcc);
				request.setAttribute("cntCategoryBag", cntCategoryBag);
				request.setAttribute("allBuyQty", allBuyQty);

				
				ArrayList list = dao.dailyTotalProfit();
	            request.setAttribute("list", list);
	            System.out.println(list);
	            
	            request.getRequestDispatcher("/admin/adminMain/adminMain.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

}
