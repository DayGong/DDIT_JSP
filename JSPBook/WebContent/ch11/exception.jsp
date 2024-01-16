<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<!-- p.363
	요청URI: exception_process.jsp
	요청파라미터(HTTP파라미터, QueryString): {num1=12, num2=6}
	요청방식: post
	-->
	<form action="exception_process.jsp" method="post">
		<p>숫자 1: <input type="number" name="num1" required/></p>
		<p>숫자 2: <input type="number" name="num2" /></p>
		<p><input type="submit" value="나누기" /></p>
	</form>
</body>
</html>