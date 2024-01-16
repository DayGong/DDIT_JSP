<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>서비스문제발생</title>
</head>
<body>
<!-- header 시작 -->
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<!-- container : 내 안에 내용 있다 -->
	<div class="container">
		<div class="navbar-header" style="width:100%;">
			<div style="float:left;">
				<a class="navbar-brand" href="welcome.jsp">Home</a>
			</div>
		</div>
	</div>
</nav>
<!--  header 끝 -->

<!-- exception JSP 내장 객체를 사용하려면 isErrorPage="true"여야 함 -->
<!-- 오류 타입 -->
<p>오류 타입 : <%=exception.getClass().getName()%></p>
<!-- 오류 메시지 -->
<p>오류 메시지 : <%=exception.getMessage()%></p>
<p>
	<img src="/images/jeju.jpg" />
</p>

<!-- footer 시작 -->
<footer class="container">
	<p>&copy; NEYMarket</p>
</footer>
<!-- footer 끝 -->

</body>
</html>




