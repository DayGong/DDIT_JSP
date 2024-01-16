<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Security</title>
</head>
<body>
	<h3>인증 성공!</h3>
	<p>사용자명: <%=request.getRemoteUser()%></p>
	<p>인증방법: <%=request.getAuthType()%></p>
	<p>인증한 사용자명이 role(역할) "tomcat"에 속하는 사용자인가요?
		<%=request.isUserInRole("tomcat")%><!-- true -->
	</p>
	<p>인증한 사용자명이 role(역할) "role1"에 속하는 사용자인가요?
		<%=request.isUserInRole("role1")%><!-- false -->
	</p>
</body>
</html>