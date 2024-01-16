<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String name 		 = request.getParameter("inputName");
String description 	 = request.getParameter("inputDescription");
String status 		 = request.getParameter("inputStatus");
String clientCompany = request.getParameter("inputClientCompany");
String projectLeader = request.getParameter("inputProjectLeader");
%>
<p>name 		: <%=name%></p>
<p>description 	: <%=description%> 	</p>
<p>status 		: <%=status%>	</p>
<p>clientCompany: <%=clientCompany%></p>
<p>projectLeader: <%=projectLeader%></p>
</body>
</html>