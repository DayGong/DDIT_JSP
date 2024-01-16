<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Cookie</title>
</head>
<body>
	<!-- 
	요청URI : cookie01_process.jsp
	요청파라미터 : {id=admin,passwd=1234}
	요청방식 : post
   -->
	<form action="cookie01_process.jsp" method="post">
		<p>아이디: <input type="text" name="id" required
				placeholder="아이디를 입력해주세요" /></p>
		<p>비밀번호: <input type="password" name="passwd" required
				placeholder="비밀번호를 입력해주세요" /></p>
		<p><input type="submit" value="전송" /></p>
	</form>
</body>
</html>