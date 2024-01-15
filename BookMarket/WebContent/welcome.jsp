<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title></title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%!
		String greeting = "도서 웹 쇼핑몰";
		String tagline = "Welcome to Web Market!";
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	<%--센터에  출력되는  글  --%>
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>