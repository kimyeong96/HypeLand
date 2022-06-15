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
import com.hype.dao.AdminMemberDAO;
import com.hype.dto.BlackListDTO;
import com.hype.dto.MemberDTO;

@WebServlet("*.amem")
public class AdminMemberController extends HttpServlet {

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

		String uri = request.getRequestURI();
		System.out.println(uri);
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		if (uri.equals("/select.amem")) {// 회원 조회
			System.out.println("요청완료");
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			AdminMemberDAO dao = new AdminMemberDAO();
			try {
				HashMap map = dao.getPageNavi(curPage);

				ArrayList<MemberDTO> list = dao.selectAll(curPage * 10 - 9, curPage * 10);
				request.setAttribute("list", list);
				request.setAttribute("naviMap", map);
				request.setAttribute("curPage", curPage);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/admin/member/memberManage.jsp").forward(request, response);
		} else if (uri.equals("/search.amem")) {
			System.out.println("하이루~");
			String searchWord = request.getParameter("searchWord");
			int curPage = Integer.parseInt(request.getParameter("curPage"));

			AdminMemberDAO dao = new AdminMemberDAO();
			try {
				HashMap map = dao.getSearchPageNavi(curPage, searchWord);
				ArrayList<MemberDTO> list = dao.selectById(searchWord,curPage * 10 - 9, curPage * 10);
				
				request.setAttribute("list", list);
				request.setAttribute("searchWord", searchWord);
				request.setAttribute("naviMap", map);
				request.setAttribute("curPage", curPage);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/admin/member/memberSearchManage.jsp").forward(request, response);
		}else if(uri.equals("/membermodify.amem")) {
			String user_id = request.getParameter("user_id");
			AdminMemberDAO dao = new AdminMemberDAO();
			try {
				MemberDTO dto = dao.modifyById(user_id);
				request.setAttribute("dto", dto);
			}catch(Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/admin/member/memberManageModify.jsp").forward(request, response);
		}else if(uri.equals("/membermodifydetail.amem")) {
			String user_id = request.getParameter("user_id");
			String user_blacklist = request.getParameter("user_blacklist");
			String black_reason;
	         if(request.getParameter("black_reason") == "" ) {
	            black_reason = "블랙리스트에서 해방";
	         }else {
	            black_reason = request.getParameter("black_reason");
	         }
			AdminMemberDAO dao = new AdminMemberDAO();
			try {
				// 블랙리스트 넣기 
	            int blackInsertResult = dao.insertBlacklist(user_id, black_reason);
	            if (blackInsertResult > 0) {
	               System.out.println("블랙리스트 사유 삽입 완료");
	            }
				int rs = dao.modify(new MemberDTO(user_id,null,null,null,null,null,null,null,null,user_blacklist));
				if(rs > 0) {
					response.sendRedirect("/select.amem?curPage=1");
					
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(uri.equals("/memberBlacklist.amem")) {
	         String user_id = request.getParameter("user_id");
	         System.out.println("블랙리스트 아이디 : " + user_id);
	         
	         AdminMemberDAO dao = new AdminMemberDAO();
	         try {
	            ArrayList<BlackListDTO> blackList = dao.selectBlackReason(user_id);
	            System.out.println("asdasdsadasd : "+blackList);
	            Gson gson = new Gson();
	            String rs = gson.toJson(blackList);
	            System.out.println(rs);
	            response.setCharacterEncoding("utf-8");
	            response.getWriter().append(rs);   
	         
	         } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	      }else if(uri.equals("/memberdelete.amem")) {
			String user_id = request.getParameter("user_id");
			AdminMemberDAO dao = new AdminMemberDAO();
			try {
				int rs = dao.delete(user_id);
				if(rs > 0) {
					response.sendRedirect("/select.amem?curPage=1");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

	}
}
