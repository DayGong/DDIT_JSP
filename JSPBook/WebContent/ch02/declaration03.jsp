<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<p>${sessionScope.age}</p>
	<%!	//선언문 태그 
		//전역 메소드->소문자처리
		String makeItLower(String data){
			return data.toLowerCase();
		}
	%>
	<% //스크립틀릿
		//sum이라는 전역메소드를 호출(한 개의 파라미터를 전달)
		String result = makeItLower("APPLE");
		//out : JSP에서 제공해주는 기본 객체
		out.print("result : " + result);
	%>
</body>
</html>