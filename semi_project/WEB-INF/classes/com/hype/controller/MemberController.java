package com.hype.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.hype.dao.MemberDAO;
import com.hype.dao.PayDAO;
import com.hype.dao.QnaDAO;
import com.hype.dto.BuyDTO;
import com.hype.dto.CartDTO;
import com.hype.dto.DeliveryDTO;
import com.hype.dto.ImageDTO;
import com.hype.dto.MemberDTO;
import com.hype.dto.OrderDTO;
import com.hype.dto.PayListDTO;
import com.hype.dto.QnaDTO;
import com.hype.dto.ReplyDTO;
import com.hype.utills.EncryptionUtils;

@WebServlet("*.mem")
public class MemberController extends HttpServlet {
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
		response.setContentType("text/jsp; charset=UTF-8");

		String uri = request.getRequestURI();
		System.out.println("요청 uri : " + uri);

		if (uri.equals("/toSignup.mem")) {
			response.sendRedirect("/member/signup.jsp");
		} else if (uri.equals("/checkId.mem")) {
			String user_id = request.getParameter("user_id");
			System.out.println("user_id : " + user_id);

			MemberDAO dao = new MemberDAO();
			try {
				boolean rs = dao.checkId(user_id);

				if (rs) {
					System.out.println("사용가능한 아이디");
					response.getWriter().append(user_id);
				} else {
					System.out.println("이미 사용중인 아이디");
					response.getWriter().append("false");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/checkEmail2.mem")) {
			String user_email = request.getParameter("user_email");
			HttpSession session = request.getSession();
			String user_id = ((MemberDTO) session.getAttribute("loginSession")).getUser_id();
			System.out.println("user_email : " + user_email);

			MemberDAO dao = new MemberDAO();
			try {
				boolean rs = dao.checkEmail(user_email);
				String email = dao.checkEmailById(user_id);
				if (user_email.equals(email)) {
					System.out.println("기존에 등록된 회원의 이메일");
					response.getWriter().append("ok");
				}
				if (rs) {
					System.out.println("사용가능한 이메일");
				} else {
					System.out.println("이미 사용중인 이메일");
					response.getWriter().append("false");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/checkEmail.mem")) {
			String user_email = request.getParameter("user_email");
			HttpSession session = request.getSession();
			System.out.println("user_email : " + user_email);

			MemberDAO dao = new MemberDAO();
			try {
				boolean rs = dao.checkEmail(user_email);
				if (rs) {
					System.out.println("사용가능한 이메일");
				} else {
					System.out.println("이미 사용중인 이메일");
					response.getWriter().append("false");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/signupProc.mem")) {
			String user_id = request.getParameter("user_id");
			String user_password = request.getParameter("user_password");
			String user_name = request.getParameter("user_name");
			String user_date = request.getParameter("user_date");
			String user_postCode = request.getParameter("user_postCode");
			String user_roadAddr = request.getParameter("user_roadAddr");
			String user_detailAddr = request.getParameter("user_detailAddr");
			String user_phone = request.getParameter("user_phone");
			String user_email = request.getParameter("user_email");

			System.out.println(user_id + user_password + user_name + user_date + user_postCode + user_roadAddr
					+ user_detailAddr + " " + user_phone + user_email);

			MemberDAO dao = new MemberDAO();
			try {
				user_password = EncryptionUtils.getSHA512(user_password);
				System.out.println("암호화된 데이터 : " + user_password);

				int rs = dao.signup(new MemberDTO(user_id, user_password, user_name, user_date, user_postCode,
						user_roadAddr, user_detailAddr, user_phone, user_email, null));
				if (rs > 0) {
					response.sendRedirect("/Tohome");
				} else {
					System.out.println("회원가입실패");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/toLogin.mem")) { // 로그인 창
			response.sendRedirect("/member/Login.jsp");

		} else if (uri.equals("/toLoginProc.mem")) { // 로그인 프로세스
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String url = request.getParameter("url");
			System.out.println("접속 id : " + id);
			System.out.println("접속 pw : " + pw);

			System.out.println("접속하기 전url" + url);

			MemberDAO dao = new MemberDAO();

			try {
				if (!pw.equals("admin")) {
					pw = EncryptionUtils.getSHA512(pw);// 암호화
				}

				System.out.println("암호화" + pw); // 지워야함
				MemberDTO dto = dao.login(id, pw);
				System.out.println(dto);

				if (dto != null) {
					if (dto.getUser_blacklist().equals("Y")) {
						System.out.println("블랙리스트로 등록된 사용자입니다.");
						response.getWriter().append("blacklist");
					} else {
						System.out.println("로그인 성공");
						if (id.equals("admin") && pw.equals("admin")) {
							System.out.println("관리자 로그인");
							response.getWriter().append("admin");
						} else {
							HttpSession session = request.getSession();
							session.setAttribute("loginSession", dto);
							response.getWriter().append("loginSuccess");
						}

					}

				} else {
					System.out.println("로그인 실패");
					response.getWriter().append("loginFail");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/logoutProc.mem")) {// 로그아웃 요청
			HttpSession session = request.getSession();
			System.out.println(session.getAttribute("loginSession"));
			// 1. session 객체를 초기화
			session.invalidate();
			response.sendRedirect("/Tohome");

		} else if (uri.equals("/toMypage.mem")) { // 마이페이지로 로그인시에만 가능 안했다면 로그인 팝업
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();

			String user_id = ((MemberDTO) session.getAttribute("loginSession")).getUser_id();

			QnaDAO qnaDao = new QnaDAO();
			MemberDAO memberDao = new MemberDAO();
			int totalCnt = 0;
			int deliveryCnt = 0;
			int deliveryCompletCnt = 0;
			int totalPrice = 0;
			try {
				ArrayList<OrderDTO> orderDTO = qnaDao.selectById(user_id);
				System.out.println(orderDTO);
				if (orderDTO.size() != 0) {
					List<Integer> list = memberDao.myPageCnt(user_id, orderDTO);
					System.out.println(list);
					totalCnt = list.get(0);
					deliveryCnt = list.get(1);
					deliveryCompletCnt = list.get(2);
					totalPrice = list.get(3);
				}

				request.setAttribute("user_id", user_id);
				request.setAttribute("totalCnt", totalCnt);
				request.setAttribute("deliveryCnt", deliveryCnt);
				request.setAttribute("deliveryCompletCnt", deliveryCompletCnt);
				request.setAttribute("totalPrice", totalPrice);
			} catch (Exception e) {
				e.printStackTrace();
			}

			request.getRequestDispatcher("/member/myPage.jsp").forward(request, response);

		} else if (uri.equals("/toCs.mem")) { // 고객센터로
			response.sendRedirect("/member/customerService.jsp");

		} else if (uri.equals("/toWrite.mem")) { // 1:1 문의글로 로그인시에만 가능 로그인 안했다면 로그인 팝업
			response.sendRedirect("/member/qna.jsp");

		} else if (uri.equals("/findId.mem")) { // 아이디 찾기
            request.setCharacterEncoding("utf-8");
            String find_name = request.getParameter("find_name");
            String find_phone = request.getParameter("find_phone");
            System.out.println(find_name + " : " + find_phone);

            MemberDAO dao = new MemberDAO();

            try {
                ArrayList<MemberDTO> list = dao.findId(find_name, find_phone);
                System.out.println("user_id : " + list);
                Gson gson = new Gson();

                if (list.size() == 0) {
                    System.out.println("등록된 아이디가 없습니다.");
                    String fail = gson.toJson(list);
                    response.getWriter().append(fail);
                } else {


                    String result = gson.toJson(list);
                    response.getWriter().append(result);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

		} else if (uri.equals("/findPw.mem")) { // 비밀번호찾기
			String user_id = request.getParameter("findPw_id");
			String user_name = request.getParameter("findPw_name");
			MemberDAO dao = new MemberDAO();
			try {
				int rs = dao.findPw(user_id, user_name);

				if (rs == 1) { // 1이 가입된 아이디 있음
					System.out.println("아이디 존재");
					response.getWriter().append("exist");

				} else if (rs == 0) { // 0 가입된 아이디없음
					System.out.println("아이디 없음");
					response.getWriter().append("no");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/toModifyPw.mem")) { // 비밀번호 수정
			String pw = request.getParameter("modifyPw");
			String user_id = request.getParameter("modifyPw_id");
			MemberDAO dao = new MemberDAO();

			try {
				pw = EncryptionUtils.getSHA512(pw);

				int rs = dao.modifyPw(pw, user_id);

				if (rs != 0) {
					System.out.println("비밀번호 변경완료");
					response.getWriter().append("success");
				} else {
					System.out.println("비밀번호 변경실패");
					response.getWriter().append("fail");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/toSearchSeq.mem")) { // 세션 아이디 값으로 주문번호 조회하기
			HttpSession session = request.getSession();
			String user_id = ((MemberDTO) session.getAttribute("loginSession")).getUser_id();

			QnaDAO dao = new QnaDAO();
			try {
				ArrayList<OrderDTO> seq_order = dao.selectById(user_id);
				System.out.println(seq_order);
				if (seq_order.size() != 0) {
					System.out.println("주문정보조회 성공");
					ArrayList<BuyDTO> list = dao.seq_orderSelectBySeq(seq_order);
					System.out.println(list);
					request.setAttribute("list", list);
				} else {
					System.out.println("주문정보 없음");

				}

				request.getRequestDispatcher("/member/popupOrderseq.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/toCart.mem")) {
			HttpSession session = request.getSession();

			MemberDTO dto = (MemberDTO) session.getAttribute("loginSession");
			MemberDAO dao = new MemberDAO();

			System.out.println("현재 아이디 : " + dto.getUser_id());

			try {
				ArrayList<CartDTO> list = dao.selectAllCart(dto.getUser_id());
				System.out.println(list);

				ArrayList<ImageDTO> imageList = new ArrayList<>(); // 사진뽑기
				for (int i = 0; i < list.size(); i++) {
					ImageDTO imageDto = dao.selectAllImg(list.get(i).getSeq_product());
					imageList.add(imageDto);
				}
				System.out.println(imageList);

				request.setAttribute("imageList", imageList);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/member/cart.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/toDeleteCart.mem")) {
			int seq_cart = Integer.parseInt(request.getParameter("seq_cart"));

			MemberDAO dao = new MemberDAO();

			try {

				int rs = dao.deleteCart(seq_cart);

				if (rs > 0) {
					System.out.println("삭제 완료");
				} else {
					System.out.println("삭제 실패");
				}

				response.sendRedirect("/toCart.mem");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/toDelAllCart.mem")) {
			HttpSession session = request.getSession();

			MemberDTO dto = (MemberDTO) session.getAttribute("loginSession");
			MemberDAO dao = new MemberDAO();

			try {
				int rs = dao.deleteCartAll(dto.getUser_id());

				if (rs > 0) {
					System.out.println(dto.getUser_id() + "님의 모든 상품이 삭제되었습니다.");
				} else {
					System.out.println("삭제 실패");
				}

				response.sendRedirect("/toCart.mem");
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/toDelBySeqCart.mem")) {
			int[] seq_cart = Arrays.stream(request.getParameterValues("seq_cart")).mapToInt(Integer::parseInt)
					.toArray();

			MemberDAO dao = new MemberDAO();

			try {
				int rs = dao.delCartBySelect(seq_cart);

				if (rs > 0) {
					System.out.println("선택 한 상품 삭제 완료");
				} else {
					System.out.println("삭제 실패");
				}

				response.sendRedirect("/toCart.mem");
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/toChangeQty.mem")) {
			int seq_cart = Integer.parseInt(request.getParameter("seq_cart"));
			int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));

			MemberDAO dao = new MemberDAO();
			try {
				int rs = dao.updateQtyCart(cart_quantity, seq_cart);

				if (rs > 0) {
					System.out.println("수량 수정 완료");
				} else {
					System.out.println("수량 수정 실패");
				}

				response.sendRedirect("/toCart.mem");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/toPay.mem")) { // 결제
			int[] seq_cart = Arrays.stream(request.getParameterValues("seq_cart")).mapToInt(Integer::parseInt)
					.toArray(); // 장바구니에서 넘긴 tbl_cart 배열
			HttpSession session = request.getSession();
			String user_id = ((MemberDTO) session.getAttribute("loginSession")).getUser_id();

			MemberDAO memberDao = new MemberDAO();
			PayDAO dao = new PayDAO();
			try {

				ArrayList<DeliveryDTO> deliList = dao.deliSelectById(user_id);
				request.setAttribute("deli_list", deliList);
				ArrayList<PayListDTO> payList = dao.selectBySeq_cart(seq_cart, user_id);
				request.setAttribute("pay_list", payList);
				System.out.println(payList);

				ArrayList<ImageDTO> imageList = new ArrayList<>();
				for (int i = 0; i < payList.size(); i++) {
					ImageDTO imageDto = memberDao.selectAllImg(payList.get(i).getSeq_product());
					imageList.add(imageDto);
				}
				System.out.println(imageList);
				request.setAttribute("imageList", imageList);

				int totalPrice = 0;
				int qty = 0;
				List<Integer> pay_list_seq_cart = new ArrayList<>();

				for (PayListDTO pay : payList) {
					totalPrice += pay.getCart_quantity() * pay.getProduct_price();
					qty += pay.getCart_quantity();
					pay_list_seq_cart.add(pay.getSeq_cart());
				}

				request.setAttribute("seq_cart", pay_list_seq_cart);
				request.setAttribute("total_price", totalPrice);
				request.setAttribute("qty", qty);

			} catch (Exception e) {
				e.printStackTrace();
			}

			request.getRequestDispatcher("/pay/pay.jsp").forward(request, response);

		} else if (uri.equals("/toKakao.mem")) {
			String url = request.getParameter("url");
			String email = request.getParameter("email");
			System.out.println("접속한 카카오 이메일 : " + email);

			MemberDAO dao = new MemberDAO();

			try {
				MemberDTO dto = dao.kakao(email);
				boolean rs = dao.checkId(email);

				if (email != null) { // 로그인 성공
					System.out.println("로그인 성공");
					request.setAttribute("rs", "ok");
					if (rs) {
						System.out.println("DB에 없는 아이디");
						dao.kakaoId(email);
					} else {
						System.out.println("DB에 존재하는 카카오 이메일");
					}

				} else {// 로그인 실패
					System.out.println("로그인 실패");
					request.setAttribute("rs", "no");
				}

				MemberDTO kakaoDto = dao.kakaoBK(email);
				if (kakaoDto.getUser_blacklist().equals("Y")) {
					System.out.println("블랙리스트로 등록된 사용자입니다.");
					request.setAttribute("BK", "BK");
					request.getRequestDispatcher("/home.jsp").forward(request, response);
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("loginSession", dto);
					response.sendRedirect(url);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/toMemberInfo.mem")) {
			String user_id = request.getParameter("user_id");

			System.out.println("user_id : " + user_id);

			MemberDAO dao = new MemberDAO();
			try {
				MemberDTO dto = dao.selectById(user_id);
				String phone1 = dto.getUser_phone().substring(0, 3);
				String phone2 = dto.getUser_phone().substring(3, 7);
				String phone3 = dto.getUser_phone().substring(7);
				String[] email = dto.getUser_email().split("@");
				String email1 = email[0];
				String email2 = email[1];

				request.setAttribute("dto", dto);
				request.setAttribute("phone1", phone1);
				request.setAttribute("phone2", phone2);
				request.setAttribute("phone3", phone3);
				request.setAttribute("email1", email1);
				request.setAttribute("email2", email2);
				request.getRequestDispatcher("/member/modifyMember.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/toModifyMemProc.mem")) {
			HttpSession session = request.getSession();
			MemberDTO dto = (MemberDTO) session.getAttribute("loginSession");

			String user_postCode = request.getParameter("user_postCode");
			String user_roadAddr = request.getParameter("user_roadAddr");
			String user_detailAddr = request.getParameter("user_detailAddr");
			String user_phone = request.getParameter("user_phone");
			String user_email = request.getParameter("user_email");
			String user_id = dto.getUser_id();

			System.out.println(user_id + " : " + user_email + " : " + user_phone);

			MemberDAO dao = new MemberDAO();
			try {
				int rs = dao.modifyMember(new MemberDTO(user_id, null, null, null, user_postCode, user_roadAddr,
						user_detailAddr, user_phone, user_email, null));

				if (rs > 0) {
					System.out.println("회원 정보 수정 완료");
				} else {
					System.out.println("회원 정보 수정 실패");
				}

				response.sendRedirect("/toMypage.mem");
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/toQnaProc.mem")) { // qna 글쓰기
			int seq_order = Integer.parseInt(request.getParameter("seq_order"));
			String user_id = request.getParameter("user_id");
			String qna_type = request.getParameter("qna_type");
			String qna_title = request.getParameter("qna_title");
			String qna_content = request.getParameter("qna_content");

			QnaDAO dao = new QnaDAO();

			try {
				int rs = dao.qnaInsert(seq_order, user_id, qna_type, qna_title, qna_content);
				if (rs > 0) {
					System.out.println("등록 성공");
					response.getWriter().append("1");
				} else {
					System.out.println("등록 실패");
					response.getWriter().append("0");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/toQnaBoard.mem")) {
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			HttpSession session = request.getSession();

			MemberDTO dto = (MemberDTO) session.getAttribute("loginSession");
			MemberDAO dao = new MemberDAO();

			try {
				HashMap map = dao.getPageNavi(curPage, dto.getUser_id());
				ArrayList<QnaDTO> list = dao.qnaById(dto.getUser_id(), curPage * 5 - 4, curPage * 5);
				int[] number = new int[list.size()];
				for (int i = 0; i < list.size(); i++) {
					number[i] = list.get(i).getSeq_qna();
				}
				if (number.length != 0) {
					ArrayList<ReplyDTO> reply = dao.replyByQna(number);
					request.setAttribute("reply", reply);
				}

				System.out.println(map);
//				System.out.println(reply);
				request.setAttribute("list", list);

				request.setAttribute("naviMap", map);
				request.setAttribute("curPage", curPage);
				request.getRequestDispatcher("/member/QnaBoard.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/toSearchProc.mem")) {
			HttpSession session = request.getSession();
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			String searchType = request.getParameter("searchType");
			String searchKeyword = request.getParameter("searchKeyword");

			MemberDTO dto = (MemberDTO) session.getAttribute("loginSession");
			MemberDAO dao = new MemberDAO();

			try {
				HashMap map = dao.getPageNaviBykey(dto.getUser_id(), searchType, searchKeyword, curPage);
				System.out.println(map);
				ArrayList<QnaDTO> list = dao.qnaBySearch(dto.getUser_id(), searchKeyword, searchType, curPage * 5 - 4,
						curPage * 5);
//				System.out.println(list);
				int[] number = new int[list.size()];
				for (int i = 0; i < list.size(); i++) {
					number[i] = list.get(i).getSeq_qna();
				}
				ArrayList<ReplyDTO> reply = dao.replyByQna(number);
//				System.out.println(reply);
				request.setAttribute("list", list);
				request.setAttribute("reply", reply);
				request.setAttribute("naviMap", map);
				request.setAttribute("curPage", curPage);
				request.setAttribute("searchType", searchType);
				request.setAttribute("searchKeyword", searchKeyword);
				request.getRequestDispatcher("/member/QnaBoard.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
