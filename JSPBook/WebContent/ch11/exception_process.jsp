<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page errorPage="exception_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<!-- p.363
	요청URI: exception_process.jsp
	요청파라미터(HTTP파라미터, QueryString): {num1=12, num2=6}
	요청방식: post
	-->
	<%
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		int i_num1 = Integer.parseInt(num1);
		int i_num2 = Integer.parseInt(num2);
	%>
	<%	// 스크립틀릿. 12 / 6 = 2
		out.print(num1 + " / " + num2 + " = " + String.valueOf(i_num1 / i_num2) );	
	%>
	<!-- 
	0과 #으로 숫자를 자리를 지정하여 표현합니다.
	0은 자리에 수가 없으면 0으로 표시하며 #은 자리에 수가 없으면 공란으로 표시합니다.
	-->
	<p>${param.num1} / ${param.num2} = 
	<fmt:formatNumber value="${ param.num1 / param.num2 }" pattern="#" /> </p>
</body>
</html>