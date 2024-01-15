<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag</title>
</head>
<body>
	<%@ page buffer="16kb" %>
	Today is: <%= new java.util.Date() %>
</body>
</html>