<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="kr.or.ddit.vo.ProductVO"%>
<%@ page import="kr.or.ddit.dao.ProductRepository"%>

<%
	String id = request.getParameter("productId");
	if (id == null || id.trim().equals("") ) {
		response.sendRedirect("products.jsp");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	ProductVO productVO = dao.getProductById(id);
	if (productVO == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	List<ProductVO> goodsList = dao.getAllProducts();
	ProductVO goods = new ProductVO();
	for (int i =0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getProductId().equals(id)) {
			break;
		}
	}
	
	List<ProductVO> list = (List<ProductVO>)session.getAttribute("cartlist");
	if (list == null) {
		list = new ArrayList<ProductVO>();
		session.setAttribute("cartlist", list);
	}
	
	int cnt = 0;
	ProductVO goodsQnt = new ProductVO();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	if (cnt == 0) {
		goods.setQuantity(1);
		list.add(goods);
	}
	
	response.sendRedirect("product.jsp?productId=" + id);
%> 