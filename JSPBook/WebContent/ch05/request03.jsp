<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>요청정보 확인</title>
</head>
<body>
	<p>IP주소 : <%=request.getRemoteAddr()%></p>
	<p>요청 파라미터 길이 : <%=request.getContentLength()%></p>
	<p>문자 인코딩 : <%=request.getCharacterEncoding()%></p>
	<p>콘텐츠 유형(MIME) : <%=request.getContentType()%></p>
	<p>요청 프로토콜 : <%=request.getProtocol()%></p>
	<p>요청메소드 : <%=request.getMethod()%></p>
	<p>요청URI 경로 : <%=request.getRequestURI()%></p>
	<p>contextPath : <%=request.getContextPath()%></p>
	<p>서버 이름 : <%=request.getServerName()%></p>
	<p>서버 포트 번호 : <%=request.getServerPort()%></p>
	<p>쿼리스트링(요청파라미터) : <%=request.getQueryString()%></p>
</body>
</html>