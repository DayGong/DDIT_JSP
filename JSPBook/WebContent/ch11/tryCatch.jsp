<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<!-- 
	요청 URI: tryCatch_process.jsp
	요청 파라미터: {num1=12, num2=6}
	요청 방식: post
	-->
	<form action="tryCatch_process.jsp" method="post">
		<p>숫자1: <input type="text" name="num1" /></p>
		<p>숫자2: <input type="text" name="num2" /></p>
		<p><input type="submit" value="나누기" /></p>
	</form>
</body>
</html>