<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<!-- 
	요청URI : request01_process.jsp
	요청파라미터 : {id=a001, passwd=java}
	요청방식 : post
	
	client ----------------요청------------------server
			| 요청 헤더 | : 호스트명, 설정된 언어와 같은 데이터 이외의 정보
			-----------
			| 요청 바디 | : 데이터(요청파라미터)
	-->
	<%
		request.setCharacterEncoding("utf-8");
	
		String userId = request.getParameter("id");
		String password = request.getParameter("passwd");
		
		// 헤더에 있는 host라는 name에 매핑되어있는 값을 보기
		String hostValue = request.getHeader("host");
		// 헤더에 있는 accept-language라는 name에 매핑되어있는 값 보기
		String alValue = request.getHeader("accept-language");
		
		// 모든 헤더의 이름을 가져와보자 => 리턴타입 : Enumeration(열거형)
		Enumeration en = request.getHeaderNames();
		// 값이 있을 때만 반복
		while(en.hasMoreElements()) {
			//현재 헤더 이름을 가져옴(Object(컵) -> String(텀블러)으로 downcasting)
			String headerName = (String)en.nextElement();
			String headerValue = request.getHeader(headerName);
			out.print("<p>" + headerName + " : " + headerValue + "</p>");
		}
	%>
	<p>아이디: <%=userId%></p>
	<p>비밀번호: <%=password%></p>
	<p>호스트명: <%=hostValue%></p>
	<p>설정된 언어: <%=alValue%></p>
</body>
</html>