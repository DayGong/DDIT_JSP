<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>

<%@ include file="menu.jsp" %>

<div class="jumbotron">
	<!-- container : 내용이 들어감 -->
	<div class="container">
		<h1 class="display-3">로그인</h1>
	</div>
</div>

<div class="container" align="center">
	<div class="col-md-4 col-md-offset-4">
		<h3 class="form-signin-heading">Please sign in</h3>
		<!-- /login.jsp?error=1 -->
		<c:if test="${param.error != null}">
			<div class="alert alert-danger">
				아이디와 비밀번호를 확인해주세요!
			</div>
		</c:if>
		<form class="form-sigin" action="j_security_check" method="post">
			<div class="form-group">
				<label for="inputUserName" class="sr-only">User Name</label>
				<input type="text" class="form-control" placeholder="ID"
					name="j_username" required autofocus />
			</div>
			<div class="form-group">
				<label for="inputPassword" class="sr-only">Password</label>
				<input type="password" class="form-control" placeholder="Password"
					name="j_password" required /></div>
			<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>
		</form>
	</div>
</div>
 
<%@ include file="footer.jsp" %>

</body>
</html>