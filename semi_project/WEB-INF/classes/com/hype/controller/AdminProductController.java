package com.hype.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hype.dao.AdminImageDAO;
import com.hype.dao.AdminProductDAO;
import com.hype.dto.ImageDTO;
import com.hype.dto.ProductDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.pc")
public class AdminProductController extends HttpServlet {

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

		if (uri.equals("/selectProduct.pc")) {
			System.out.println("나왔옹");
			String product_code = request.getParameter("product_code");
			System.out.println(product_code);
			AdminProductDAO dao = new AdminProductDAO();
			try {
				boolean rscode = dao.checkProductCode(product_code);
				System.out.println(rscode);
				if (rscode) {
					response.getWriter().append("true");
					
				} else {
					response.getWriter().append("false");
				}

			}catch(Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/insert.pc")) { // 상품등록
			String category = request.getParameter("category");
			String product_name = request.getParameter("product_name");
			int product_price = Integer.parseInt(request.getParameter("product_price"));
			String product_code = request.getParameter("product_code");
			String product_content = request.getParameter("product_content");
			String filepath = request.getServletContext().getRealPath("clothesImages");

			System.out.println(category + " : " + product_price + " : " + product_name + " : " + product_code + " : "
					+ product_content);

			AdminProductDAO dao = new AdminProductDAO();

			try {
				int rs = dao.productInsert(
						new ProductDTO(0, product_code, category, product_name, product_price, product_content));

				if (rs > 0) {
					System.out.println("저장성공");
					response.sendRedirect("/modify.pc?curPage=1");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/modify.pc")) { // 상품 조회
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			System.out.println(curPage);
			AdminProductDAO dao = new AdminProductDAO();
			try {
				HashMap map = dao.getPageNavi(curPage);

				ArrayList<ProductDTO> list = dao.selectAll(curPage * 10 - 9, curPage * 10);
				request.setAttribute("list", list);
				request.setAttribute("naviMap", map);
				request.setAttribute("curPage", curPage);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/admin/product/productModify.jsp").forward(request, response);
		} else if (uri.equals("/search.pc")) {
			String searchWord = request.getParameter("searchWord");
			int curPage = Integer.parseInt(request.getParameter("curPage"));

			AdminProductDAO dao = new AdminProductDAO();

			try {
				HashMap map = dao.getSearchPageNavi(curPage, searchWord);
				ArrayList<ProductDTO> list = dao.selectByCode(searchWord, curPage * 10 - 9, curPage * 10);

				request.setAttribute("list", list);
				request.setAttribute("searchWord", searchWord);
				request.setAttribute("naviMap", map);
				request.setAttribute("curPage", curPage);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/admin/product/searchModify.jsp").forward(request, response);
		} else if (uri.equals("/productmodify.pc")) {
			System.out.println("요청완료");
			int seq_product = Integer.parseInt(request.getParameter("seq_product"));
			AdminProductDAO dao = new AdminProductDAO();
			try {
				ProductDTO dto = dao.selectBySeq(seq_product);
				ArrayList<ImageDTO> list = dao.selectBySeqImage(seq_product);
				request.setAttribute("dto", dto);
				request.setAttribute("list", list);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/admin/product/productModifyDetail.jsp").forward(request, response);
		} else if (uri.equals("/productmodifyDetail.pc")) {
			System.out.println("요청완료");

			String filepath = "\\resource\\imagesClothes\\";
			System.out.println(filepath);
			File dir = new File(filepath);
			if (dir.mkdirs()) {
				System.out.println("디렉토리 생성 성공");
			} else {
				System.out.println("데렉토리 생성 실패");
			}
			
			int maxSize = 1024 * 1024 * 10;
			AdminProductDAO dao = new AdminProductDAO();
			AdminImageDAO daoImage = new AdminImageDAO();
			try {
				MultipartRequest multi = new MultipartRequest(request, filepath, maxSize, "utf-8",
						new DefaultFileRenamePolicy());

				int seq_product = Integer.parseInt(multi.getParameter("seq_product"));
				String category = multi.getParameter("category");
				String product_name = multi.getParameter("product_name");
				int product_price = Integer.parseInt(multi.getParameter("product_price"));
				String product_code = multi.getParameter("product_code");
				String product_content = multi.getParameter("product_content");

				String[] imageName = multi.getParameterValues("imageName");
				
	            if(imageName != null) {
	               imageName = multi.getParameterValues("imageName");
	            }else {
	               imageName = multi.getParameterValues("bye");
	            }
				try {
					int rs = dao.modify(new ProductDTO(seq_product, product_code, category, product_name, product_price,
							product_content));
					int rsImage=0;
						for(String image_name : imageName) {
							daoImage.insert(new ImageDTO(image_name, seq_product, filepath));
							rsImage++;			
					}
					if (rs > 0 && rsImage > 0) {
						response.sendRedirect("/modify.pc?curPage=1");
					}
					// 카트 update 
		               int cartRs = dao.updateCart(seq_product, product_name, product_price);
		               if(cartRs > 0) {
		                  System.out.println("카트 업데이트 완료");
		               }
				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/deleteProduct.pc")) {
			int seq_product = Integer.parseInt(request.getParameter("seq_product"));
			System.out.println(seq_product);
			AdminProductDAO dao = new AdminProductDAO();
			try {
				int rs = dao.delete(seq_product);
				if (rs > 0) {
					response.sendRedirect("/modify.pc?curPage=1");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
