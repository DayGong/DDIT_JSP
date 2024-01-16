<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header 시작 -->
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<!-- container : 내 안에 내용 있다 -->
	<div class="container">
		<div class="navbar-header" style="width:100%;">
			<div style="float:left;">
				<a class="navbar-brand" href="welcome.jsp">Home</a>
			</div>
			<div style="float:right;">
				${param.productId}
				<!-- request.getRemoteUser() : 로그인 한 사용자 아이디 -->
				<c:set var="remoteUser" value="<%=request.getRemoteUser()%>" />
				<c:if test="${remoteUser != null}">
					<a href="/logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
				</c:if>
			</div>
		</div>
	</div>
</nav>
<!--  header 끝 -->