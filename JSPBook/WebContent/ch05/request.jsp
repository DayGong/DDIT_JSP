<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Objects(내장 객체)</title>
</head>
<body>
<!-- 
요청 URI: /ch05/process.jsp
요청 파라미터: {name=개똥이}
요청 방식: post
 -->
<form action="/ch05/process.jsp" method="post">
	<p>
		이름: <input type="text" name="name" required placeholder="이름을 작성해주세요" />
		<input type="submit" value="전송" />
	</p>
</form>
</body>
</html>