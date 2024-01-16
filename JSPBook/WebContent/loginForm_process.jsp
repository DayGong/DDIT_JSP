<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

out.print("username : " + username + "<br />");
out.print("password : " + password + "<br />");

if(username.equals("admin")&&password.equals("1234")){
	session.setAttribute("userID", username);
	out.print("로그인 성공");
	
	response.sendRedirect("/login_success.jsp");
}else{
	out.print("로그인 실패");
}
%>