<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Session</title>
</head>
<body>
<%
	String userId = (String) session.getAttribute("userID");

	System.out.println("userId => " + userId);

	if ( userId == null || userId.equals("") ) {
		response.sendRedirect("session_out.jsp");
	}
%>
<h1><%=userId%>님 반갑습니다.</h1>
<a href="session_out.jsp" value="로그아웃">로그아웃</a>
</body>
</html>