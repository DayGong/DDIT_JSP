<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
	// 요청URI : /deleteCart.jsp?cartId=CF61A1B17D9247CFCA3D6B33E48528A6
	// 요청파라미터 : cartId=CF61A1B17D9247CFCA3D6B33E48528A6
	// 요청방식 : get
	// session.getId() : 세션고유아이디 = 고유장바구니 = 동일웹브라우저 = 1명의고객
	String cartId = request.getParameter("cartId"); // CF61A1B17D9247CFCA3D6B33E48528A6
	
	// cartId가 없네? => cart.jsp로 이동
	if (cartId == null || cartId.trim().equals("")) {
		response.sendRedirect("cart.jsp");
		return;
	}
	
	// 장바구니 비우기
	session.removeAttribute("cartlist");	// 세션 객체 내의 cartlist 속성명에 해당하는 한 건만 삭제
	/* session.invalidate() : 모든 세션을 삭제(로그아웃) */
	
	// redirect : URL 재요청
	response.sendRedirect("cart.jsp");
%>