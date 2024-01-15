<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("passwd");

out.print("id : " + id + "<br />");
out.print("password : " + pw + "<br />");

if( id.equals("admin")&&pw.equals("admin1234") ) {
	session.setAttribute("userID", id);
	out.print("로그인 성공");
	
	response.sendRedirect("login_success.jsp");
} else {
	out.print("로그인 실패");
}
%>