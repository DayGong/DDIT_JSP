<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<!--
	요청 URI: session01_process.jsp
	요청 파라미터(HTTP 파라미터, QueryString): {id=a001,passwd=java}
	요청 방식: post
	-->
	<form action="session01_process.jsp" method="post">
		<p>아이디: <input type="text" name="id" /></p>
		<p>비밀번호: <input type="password" name="passwd" /></p>
		<p><input type="submit" value="전송" /></p>
	</form>
</body>
</html>