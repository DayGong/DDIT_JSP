<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<%
		String id = request.getParameter("id"); 
		String passwd = request.getParameter("passwd");
	%>
	<p>입력된 id 값 : <%=id %></p>
	<p>입력된 passwd 값 : <%=passwd %></p>
</body>
</html>