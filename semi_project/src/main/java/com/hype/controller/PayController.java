package com.hype.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hype.dao.MemberDAO;
import com.hype.dao.PayDAO;
import com.hype.dto.BuyDTO;
import com.hype.dto.CartDTO;
import com.hype.dto.ImageDTO;
import com.hype.dto.MemberDTO;
import com.hype.dto.PayListDTO;
import com.hype.dto.ProductDTO;


@WebServlet("*.pay")
public class PayController extends HttpServlet {
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
      
      if (uri.equals("/toPayRegist.pay")) { //  tbl_pay 생성
         int pay_price = Integer.parseInt(request.getParameter("pay_price"));
         
         String[] seq_cart = request.getParameterValues("seq_cart");
         int[] seq_cart2 = new int[seq_cart.length];
         for(int i = 0 ;  i < seq_cart.length ; i++) {
            seq_cart2[i] = Integer.parseInt(seq_cart[i]);
         }
         
         System.out.println("pay_price : " + pay_price);
         System.out.println("seq_cart2 : " + seq_cart2);
         PayDAO dao = new PayDAO();
         
         try {
            ArrayList<CartDTO> list = dao.selectBySeq_cart(seq_cart2);
            System.out.println("list : "+ list);
            int totalPrice = 0;
            for(CartDTO pay :  list) {
               totalPrice +=  pay.getCart_price() * pay.getCart_quantity();
            }
            System.out.println("totalPrice : " + totalPrice);
            
            if(totalPrice == pay_price ) {
               int rs = dao.payInsert(pay_price);
               if(rs > 0 ) {
                  System.out.println("결제 성공");
                  response.getWriter().append("Success");
               }else {
                  System.out.println("결제 실패");
                  response.getWriter().append("fail");
               }
            }
                        
         }catch(Exception e) {
            e.printStackTrace();
         }
                           
      }else if (uri.equals("/toOrderRegist.pay")) { //tbl_order, buy테이블 생성
            
         String[] seq_cart = request.getParameterValues("seq_cart"); // 시퀀스
         
         int[] seq_cart2 = new int[seq_cart.length];
         for(int i = 0 ;  i < seq_cart.length ; i++) {
            seq_cart2[i] = Integer.parseInt(seq_cart[i]);
         }
         
         String user_id = request.getParameter("user_id");
         String order_name = request.getParameter("order_name");
         String phone = request.getParameter("order_phone");
         String order_phone = phone.replaceAll("[^0-9]", "");
         String order_postCode = request.getParameter("order_postCode");
         String order_address = request.getParameter("order_address");
         String order_msg = request.getParameter("order_msg");
         
         PayDAO pay_dao = new PayDAO();
         MemberDAO member_dao = new MemberDAO();
         try {
            int order_rs = pay_dao.orderInsert(user_id, order_name, order_phone, order_postCode, order_address, order_msg); //오더테이블 인서트
            if(order_rs > 0) { // order테이블 인서트 성공시
               System.out.println("tbl_order 저장 성공");
               int seq_order = pay_dao.findSeq_orderBySelect(user_id);//order의 seq_order 찾기
               ArrayList<CartDTO> list = pay_dao.selectBySeq_cart(seq_cart2); // buy에 넣을 물품정보
               
               int buy_rs = pay_dao.buyInsert(seq_order, list); //buy insert
               if(buy_rs == list.size()) {
                  System.out.println("tbl_buy 저장 성공");
                  response.getWriter().append("Success");
               }else {
                  System.out.println("db저장 실패");
                  response.getWriter().append("fail");
               }
            }else {
               System.out.println("db저장 실패");
               response.getWriter().append("fail");
            }
         }catch(Exception e) {
            e.printStackTrace();
         }
         
      }else if (uri.equals("/toPayResult.pay")) {
         int[] seq_cart = Arrays.stream(request.getParameterValues("seq_cart")).mapToInt(Integer::parseInt)
               .toArray();
         System.out.println("받아온 seq_cart : " + seq_cart );
         HttpSession session = request.getSession();
         String user_id = ((MemberDTO) session.getAttribute("loginSession")).getUser_id();
         
         MemberDAO memberDao = new MemberDAO(); 
         PayDAO dao = new PayDAO();
         try {
            ArrayList<PayListDTO> payList = dao.selectBySeq_cart(seq_cart, user_id);
            request.setAttribute("pay_list", payList);
            
            int totalPrice = 0;
            int qty = 0;
            List<Integer> pay_list_seq_cart = new ArrayList<>();
            
            for(PayListDTO pay :  payList) {
               totalPrice +=  pay.getCart_quantity()*pay.getProduct_price();
               qty += pay.getCart_quantity();
               pay_list_seq_cart.add(pay.getSeq_cart());
            }
            
            ArrayList<ImageDTO> imageList = new ArrayList<>();
			for(int i = 0; i < payList.size(); i++) {
				ImageDTO imageDto = memberDao.selectAllImg(payList.get(i).getSeq_product());
				imageList.add(imageDto);
			}
			System.out.println(imageList);
			request.setAttribute("imageList", imageList);
            
            request.setAttribute("seq_cart", pay_list_seq_cart);
            request.setAttribute("total_price", totalPrice);
            request.setAttribute("qty", qty);
            MemberDAO member_dao = new MemberDAO();
            int cart_deleteRs = member_dao.delCartBySelect(seq_cart); // 구매 완료했으니 cart테이블 비워주기
         } catch (Exception e) {
            e.printStackTrace();
         }

         request.getRequestDispatcher("/pay/payResult.jsp").forward(request, response);
         
      }else if(uri.equals("/toOrderList.pay")) {
          HttpSession session = request.getSession();
          System.out.println(session.getAttribute("loginSession"));
          String user_id = ((MemberDTO)session.getAttribute("loginSession")).getUser_id();
          System.out.println(user_id);
          PayDAO dao = new PayDAO();
          MemberDAO memberDao = new MemberDAO();

          try {
              ArrayList<BuyDTO> buyList = dao.selectTblbuyid(user_id);
              
	        int totalPrice = 0;
			int qty = 0;
			
			for(BuyDTO buy :  buyList) {
				totalPrice +=  buy.getBuy_qty()*buy.getBuy_price();
				qty += buy.getBuy_qty();
			}
			String[] str = new String[buyList.size()];
			
			
			for(int i = 0; i < buyList.size(); i++) {
				str[i] = buyList.get(i).getBuy_name();
			}
			
			ArrayList<ProductDTO> productList = new ArrayList<>();
			
			for(int i = 0; i < buyList.size(); i++) {
				ProductDTO productDto = dao.selectByName(str[i]);
				productList.add(productDto);
			}
			
			ArrayList<ImageDTO> imageList = new ArrayList<>();
			
			for(int i = 0; i < buyList.size(); i++) {
				ImageDTO imageDto = memberDao.selectAllImg(productList.get(i).getSeq_product());
				imageList.add(imageDto);
			}
			
			System.out.println(imageList);
	
			request.setAttribute("imageList", imageList);
			request.setAttribute("productList", productList);
			request.setAttribute("total_price", totalPrice);
			request.setAttribute("qty", qty);
			request.setAttribute("buyList", buyList);

          }catch(Exception e) {
              e.printStackTrace();
          }

          request.getRequestDispatcher("/pay/OrderList.jsp").forward(request, response);
      }
  
      
      
   }
}