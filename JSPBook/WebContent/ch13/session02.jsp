<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<%
	// JSP 내장 객체인 session
	// return 타입이 Object
	String user_id = (String) session.getAttribute("userID");
	String user_pw = (String) session.getAttribute("userPW");
	
	out.println("설정된 세션의 속성 값[1] : " + user_id + "<br />");
	out.println("설정된 세션의 속성 값[2] : " + user_pw);
%>
</body>
</html>