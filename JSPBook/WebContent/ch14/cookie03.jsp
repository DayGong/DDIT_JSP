<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Cookie</title>
</head>
<body>
	<%
		// 요청시마다 쿠키를 함께 보냄
		// 쿠키는 request객체에 담김
		Cookie[] cookies = request.getCookies();
		
		// cookies[0] : userID
		// cookies[1] : userPW
		// cookies[2] : JSESSIONID => setMaxAge(0)을 해도 영향이 없음
		for ( int i = 0; i < cookies.length; i++ ) {
			// 쿠키를 삭제
			// 세션의 경우
			// session.removeAttribute("하나씩 제거");
			// session.invalidate(); // 모두 제거
			cookies[i].setMaxAge(0);	// 유지시간을 0초로 설정
			response.addCookie(cookies[i]);	// 쿠키 저장소로 응답해준다
		}
		
		response.sendRedirect("cookie02.jsp");
	%>
</body>
</html>