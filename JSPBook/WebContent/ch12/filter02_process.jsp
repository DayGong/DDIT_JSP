<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>filter</title>
</head>
<body>
	<!-- 
	요청URI : /ch12/filter02_process.jsp
	요청파라미터 : {id=admin,passwd=java}
	요청방식 : post
	-->
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id"); // admin
		String passwd = request.getParameter("passwd");	// java
	%>
	<p> 입력된 id 값 : <%=id%></p>
	<p> 입력된 passwd 값 : <%=passwd%></p>
   
</body>
</html>