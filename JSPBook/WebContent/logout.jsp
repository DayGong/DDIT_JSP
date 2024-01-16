<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%	// 로그아웃: 세션 모두 없애기
	session.invalidate();
	
	// URL 재요청: redirect
	response.sendRedirect("/addProduct.jsp");
%>