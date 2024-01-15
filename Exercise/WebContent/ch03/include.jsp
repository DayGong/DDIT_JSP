<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<%@ include file="header.jsp" %>

현재 시간: <%= java.util.Calendar.getInstance().getTime() %>
</body>
</html>