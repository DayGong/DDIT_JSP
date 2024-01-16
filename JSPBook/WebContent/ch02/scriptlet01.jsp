<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<p>${sessionScope.age}</p>
	<%
		//지역변수
		//선언과 동시에 값을 할당 => 초기화
		int a = 2;
		int b = 3;
		int sum = a + b;
		//out : JSP 기본 내장 객체
		out.print("sum : " + sum);
	%>
</body>
</html>