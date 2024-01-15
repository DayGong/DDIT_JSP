<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/Exercise/css/bootstrap.min.css">
<script type="text/javascript" src="/Exercise/js/jquery.min.js"></script>
<title>Welcome</title>
</head>
<body>

<%@ include file="menu.jsp" %>

<%!//선언문(전역변수)
	String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.";
	String tagline = "Welcome to 남의양 Market!";
%>
<div class="jumbotron">
	<!-- container : 내용이 들어감 -->
	<div class="container">
		<h1 class="display-3"><%=greeting%></h1>
	</div>
</div>
<div class="container">
	<!-- 내용을 중간 정렬 -->
	<div class="text-center">
		<h3><%=tagline%></h3>
		<%
			Date day = new java.util.Date();
			String am_pm;
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds();
			if (hour / 12 == 0) {
				am_pm = "AM";
			} else {
				am_pm = "PM";
				hour = hour - 12;
			}
			String CT = hour + ":" + minute + ":" + second + " " + am_pm;
			out.println("현재 접속 시각: " + CT + "\n");
		%>
	</div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>