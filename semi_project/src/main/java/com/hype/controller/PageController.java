package com.hype.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hype.dao.MemberDAO;
import com.hype.dao.ProductDAO;
import com.hype.dao.ReviewDAO;
import com.hype.dto.CartDTO;
import com.hype.dto.ImageDTO;
import com.hype.dto.MemberDTO;
import com.hype.dto.OrderReviewDTO;
import com.hype.dto.ProductDTO;
import com.hype.dto.RankingDTO;
import com.hype.dto.ReviewDTO;

@WebServlet("*.page")
public class PageController extends HttpServlet {
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
		System.out.println("요청 uri : " + uri);
		request.setCharacterEncoding("utf-8");

		// 옷 나열 페이지로 이동 김예원
		if (uri.equals("/ToPage.page")) {
			String category = request.getParameter("category");
			request.setAttribute("category", category);
			ProductDAO dao = new ProductDAO();

			try {
				request.setAttribute("category", category);
				/* 캐러셀 */
				ArrayList<RankingDTO> rankList = dao.ranking();

				String product_name = null;
				ArrayList<ImageDTO> rimgList = new ArrayList<>();
				ArrayList<ProductDTO> pList = new ArrayList<>();

				for (RankingDTO dto : rankList) {
					product_name = dto.getProduct_name();
					rimgList.addAll(dao.getTblImgbyProName(product_name));
					pList.addAll(dao.selectAllbyName(product_name));
				}
				request.setAttribute("rimgList", rimgList);
				request.setAttribute("pList", pList);

				/* 3열 사진 */
				int cnt = dao.countPro(category);
				// request cnt
				request.setAttribute("cnt", cnt);

				// category로 tbl_image 얻어오기
				ArrayList<ImageDTO> imgList = dao.getTblImgbyCtg(category);
				System.out.println(imgList.toString());

				// category로 tbl_product 받아오기
				ArrayList<ProductDTO> proList = dao.selectTblProbyCtg(category);
				System.out.println(proList.toString());

				// request proList
				request.setAttribute("proList", proList);
				// request imgList
				request.setAttribute("imgList", imgList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("user/product/page.jsp").forward(request, response);
		}

		// 김형석
		else if(uri.equals("/reviewWrite.page")) { // 리뷰 등록하기
	         HttpSession session = request.getSession();
	         String user_id = ((MemberDTO) session.getAttribute("loginSession")).getUser_id();
	      
	         int seq_product = Integer.parseInt(request.getParameter("seq_product"));
	         String review_content = request.getParameter("review_content");
	           int review_rate = Integer.parseInt(request.getParameter("review_rate"));
	            
	           System.out.println(seq_product);
	           ReviewDAO ReviewDao = new ReviewDAO();
	           ProductDAO productDAO = new ProductDAO();
	           try {
	        	  ArrayList<ProductDTO> product = productDAO.selectAll(seq_product); 
	              System.out.println("product : "+product);
	              ArrayList<OrderReviewDTO> checkId = ReviewDao.checkId(user_id, product.get(0).getProduct_name());
	              
	              if(checkId.size() != 0) {
	                 int rs = ReviewDao.insertReview(new ReviewDTO(0, seq_product, user_id, review_content, null, review_rate));
	                 response.getWriter().append("true");
	              }else {
	                 response.getWriter().append("false");
	              }
	               
	            }catch(Exception e) {
	               e.printStackTrace();
	            }
//	            request.getRequestDispatcher("user/product/detailPage.jsp").forward(request, response);
	      } else if (uri.equals("/detailPage.page")) { // 상세페이지 정보 및 사진 불러오기
			int seq_product = Integer.parseInt(request.getParameter("seq_product"));
			/* int curPage = Integer.parseInt(request.getParameter("curPage")); */
			try {
				// 상품 정보 불러오기
				ProductDAO productDAO = new ProductDAO();
				ArrayList<ProductDTO> productDTO = productDAO.selectAll(seq_product);
				request.setAttribute("productDTO", productDTO.get(0));
				// 상품 사진 불러오기
				ArrayList<ImageDTO> imageList = productDAO.selectAllImgBySeq(seq_product);
				request.setAttribute("imageList", imageList);
				// 리뷰 정보 불러오기
				ReviewDAO ReviewDAO = new ReviewDAO();
				request.setAttribute("reviewCount", ReviewDAO.countReview(seq_product)); // 리뷰개수
				request.setAttribute("sumReview", ReviewDAO.sumReview(seq_product)); // 별점 더하기
			
				ArrayList<ReviewDTO> ReviewContent = ReviewDAO.selectBySeq(seq_product); // 리뷰 정보 가져오기
				if (ReviewContent.size() == 0) {
					request.setAttribute("reviewSize", 0);
				} else {
					request.setAttribute("ReviewContent", ReviewContent);
				}

				request.setAttribute("seq_product", seq_product);
			} catch (Exception e) {
				e.printStackTrace();
			}

			request.getRequestDispatcher("user/product/detailPage.jsp").forward(request, response);
		} else if (uri.equals("/addToCart.page")) {
			// 장바구니 담기
			HttpSession session = request.getSession();
            String user_id = ((MemberDTO) session.getAttribute("loginSession")).getUser_id();

            int seq_product = Integer.parseInt(request.getParameter("seq_product"));
            int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));
            ProductDAO productDAO = new ProductDAO();

            try {
                ProductDTO product = productDAO.selectAll(seq_product).get(0); 
                boolean add = productDAO.selectAllCart(user_id, seq_product);
                System.out.println(add);
                if(!add) {
                    productDAO.insertCart(new CartDTO(0, seq_product, user_id, product.getProduct_name(),
                            cart_quantity, product.getProduct_price()));
                }else {
                    productDAO.updateCart(new CartDTO(0, seq_product, user_id, null,
                            cart_quantity, 0));
                }


            } catch (Exception e) {
                e.printStackTrace();
            }
		}else if(uri.equals("/TosearchMap.page")){
            response.sendRedirect("/searchMap.jsp");
        }else if(uri.equals("/ToCompany.page")){
            response.sendRedirect("/user/product/company.jsp");
        }else if (uri.equals("/toCart.page")) {
            HttpSession session = request.getSession();

            MemberDTO dto = (MemberDTO) session.getAttribute("loginSession");
            MemberDAO dao = new MemberDAO();

            int seq_product = Integer.parseInt(request.getParameter("seq_product"));
            int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));
            ProductDAO productDAO = new ProductDAO();

            System.out.println("현재 아이디 : " + dto.getUser_id());

            try {

                ProductDTO product = productDAO.selectAll(seq_product).get(0); 
                boolean add = productDAO.selectAllCart(dto.getUser_id(), seq_product);
                System.out.println(add);
                if(!add) { //카드에 동일한물건이 없을때
                    productDAO.insertCart(new CartDTO(0, seq_product, dto.getUser_id(), product.getProduct_name(),
                            cart_quantity, product.getProduct_price()));
                }else { //있어서 수량만 늘려줄때
                    productDAO.updateCart(new CartDTO(0, seq_product, dto.getUser_id(), null,
                            cart_quantity, 0));
                }
                response.getWriter().append("success");
                ArrayList<CartDTO> list = dao.selectAllCart(dto.getUser_id());
                System.out.println(list);

                ArrayList<ImageDTO> imageList = new ArrayList<>(); // 사진뽑기
                for(int i = 0; i < list.size(); i++) {
                    ImageDTO imageDto = dao.selectAllImg(list.get(i).getSeq_product());
                    imageList.add(imageDto);
                }

                request.setAttribute("imageList", imageList);
                request.setAttribute("list", list);


            } catch (Exception e) {
                e.printStackTrace();
            }
        }
	}
}
