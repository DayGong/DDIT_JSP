<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<!-- 
요청 URI: /ch05/process.jsp
요청 파라미터: {name=개똥이}
요청 방식: post
 -->
	<%
		request.setCharacterEncoding("utf-8");
		
		// request내장 객체가 {name=개똥이} 요청 파라미터를 갖고 있음
		String name = request.getParameter("name");
	%>
	
	<!-- 표현문 -->
	<p>이름: <%= name %></p>
	<p>요청 정보 길이 : <%= request.getContentLength() %></p>
	<p>클라이언트 전송 방식 : <%= request.getMethod() %></p>
	<p>요청 URI : <%= request.getRequestURI() %></p>
	<p>서버 이름 : <%= request.getServerName() %></p>
	<p>서버 포트 : <%= request.getServerPort() %></p>
</body>
</html>