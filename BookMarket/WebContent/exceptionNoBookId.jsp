<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>도서 아이디 오류</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">해당 도서가 존재하지 않습니다.</h2>
		</div>
	</div>
	<div class="container">
		<p><%=request.getRequestURL()%>?<%=request.getQueryString()%></p>
		<p><a href="books.jsp" class="btn btn-secondary">도서 목록&raquo;</a>
	</div>
</body>
</html>