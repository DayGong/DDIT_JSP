<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page isErrorPage="true" %>
<!-- 
isErrorPage 속성 
: 현재 JSP 페이지를 오류 페이지로 호출하는 page 디렉티브 태그의 속성.
   이때 오류 페이지에서 exception 내장 객체를 사용할 수 있음
-->
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<p>오류가 발생했습니다</p>
	<!-- 오류 이벤트의 toString()을 호출하여 간단한 오류 메시지 확인 -->
	<p>예외 유형: <%=exception.toString()%></p>
	<!-- 오류 메시지의 발생 근원지를 찾아 단계별로 오류 출력 -->
	<%//=exception.printStackTrace() %>
	<!-- 예외 객체 타입 출력 -->
	<p>예외 유형: <%=exception.getClass().getName()%></p>
	<!-- 오류 이벤트와 함께 들어오는 메시지 출력 -->
	<p>오류 메시지: <%=exception.getMessage()%></p>
</body>
</html>