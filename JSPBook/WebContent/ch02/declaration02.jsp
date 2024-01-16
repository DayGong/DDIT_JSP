<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<%!	//선언문 태그 
		//전역 메소드
		//int : 리턴 타입(정수 타입), a랑 b : 정수타입 매개변수
		int sum(int a, int b){
			return a + b;
		}
		
	%>
	<% //스크립틀릿
		//sum이라는 전역메소드를 호출(두 개의 파라미터를 전달)
		int result = sum(2,3);
		//out : JSP에서 제공해주는 기본 객체
		out.print("result : " + result);
	%>
</body>
</html>