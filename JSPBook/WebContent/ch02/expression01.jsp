<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>표현문</title>
</head>
<body>
	<p>Today's date : <%=new Date()%></p>
<c:set var="today" value="<%=new Date()%>" />
	<p>Today's date : ${today}</p>
	<p>Today's date : <fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></p>
</body>
</html>






