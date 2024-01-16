<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>filter</title>
</head>
<body>
	<!-- 
	요청URI : /ch12/filter01_process.jsp
	요청파라미터 : {name=개똥이}
	요청방식 : post
	-->
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name"); //개똥이라는 문자열을 받아서
	%>
	<p> 입력된 name 값 : <%=name%></p>
   
</body>
</html>