<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<%
		out.println("오늘의 날짜 및 시각" + "<br>");
		out.println(java.util.Calendar.getInstance().getTime());
	%>
</body>
</html>