<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Filter</title>
</head>
<body>
<%
	/*
	요청URI : filter02_process.jsp
	요청파라미터 : {id=admin,passwd=java}
	요청방식 : post
	*/
%>
	<form action="/ch12/filter02_process.jsp">
		<p>아이디: <input type="text" name="id" /></p>
		<p>비밀번호: <input type="password" name="passwd" /></p>
		<p><input type="submit" value="전송" /></p>
	</form>
</body>
</html>