<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="kr.or.ddit.vo.ProductVO"%>
<%@ page import="kr.or.ddit.dao.ProductRepository"%>
<%
	// removeCart.jsp?productId=1235
	String productId = request.getParameter("productId");	// P1235
	
	// 만약에 /removeCart.jsp 또는 removeCart.jsp?id=Z1234 
	// products.jsp로 이동
	if (productId == null || productId.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}
	
	// 상품저장소 클래스 => 싱글톤 객체 생성(메모리에 1회 생성. 공유해서 사용)
	ProductRepository dao = ProductRepository.getInstance();
	// 상품검색메소드(select * from productrepository where id='Z1234';)
	ProductVO productVO = dao.getProductById(productId);
	if (productVO == null) { // DB에 해당 상품 자체가 없음
		response.sendRedirect("exceptionNoProductId.jsp");
		return;
	}
	
	// 세션의 장바구니(세션) 목록에서 P1234이 있는지 체크한 후 
	// 만약에 있다면 장바구니에서 제외처리
	// cartlist라는 세션명으로 생성
	// session.setAttribute("cartlist", list);
	List<ProductVO> list = (List<ProductVO>)session.getAttribute("cartlist");
	
	for (int i = 0; i < list.size(); i++) {
		if (list.get(i).getProductId().equals(productId)) {
			// list : List<ProductVO>
			// list.get(i) : ProductVO
			// remove(Object)
			list.remove(list.get(i));
		}
	}
	
	// 장바구니 확인
	/* for (ProductVO pVO : list) {
		out.print("pVO : " +pVO);
		out.print("<hr />");
	} */
	
	response.sendRedirect("cart.jsp");
%>