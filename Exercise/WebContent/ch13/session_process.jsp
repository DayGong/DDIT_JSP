<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if ( id.equals("admin") && pw.equals("admin1234") ) {
		session.setAttribute("userID", id);
	}
	
	response.sendRedirect("welcome.jsp");
%>