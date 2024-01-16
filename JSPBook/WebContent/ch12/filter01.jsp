<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>filter</title>
</head>
<body>
	<!-- 
	요청URI : /ch12/filter01_process.jsp
	요청파라미터 : {name=개똥이}
	요청방식 : post
	-->
	<form action="/ch12/filter01_process.jsp" method="post">
		<p>이름 : <input type="text" name="name"></p>
		<p><input type="submit" value="전송"> </p>
	</form>
</body>
</html>