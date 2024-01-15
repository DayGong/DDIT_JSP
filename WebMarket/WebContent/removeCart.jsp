<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="kr.or.ddit.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
	String id = request.getParameter("productId");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	ProductVO productVO = dao.getProductById(id);
	if (productVO == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	List<ProductVO> cartList = (ArrayList<ProductVO>)session.getAttribute("cartlist");
	ProductVO goodsQnt = new ProductVO();
	for (int i = 0; i < cartList.size(); i++) {
		goodsQnt = cartList.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
%>