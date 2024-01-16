<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	// /ch03/include01_footer.jsp?memId=개똥이
	String memId = request.getParameter("memId") == null? "" 
			: request.getParameter("memId");
	memId = URLDecoder.decode(memId);	// 한글 처리
%>

Copyright <%=memId%>