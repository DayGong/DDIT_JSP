<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<%
		// 응답 헤더 리턴. 404: HTTP Status 중에서 page notfound
		response.sendError(404, "요청 페이지를 찾을 수 없습니다닷닷");
	%>
</body>
</html>