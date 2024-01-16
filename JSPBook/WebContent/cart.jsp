<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="kr.or.ddit.vo.ProductVO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>

<%@ include file="menu.jsp" %>
<%
	// 세션의 고유 아이디(장바구니 번호). 하나의 웹브라우저
	String cartId = session.getId();

	// 장바구니(세션) => 세션명 : cartlist
	// List<ProductVO> list = (List<ProductVO>) session.getAttribute("cartlist");
%>
<c:set var="cartId" value="<%=cartId%>" />
<c:set var="list" value="${sessionScope.cartlist}" />
<%-- <p>${sessionScope.cartlist}</p> --%>
<!-- <hr /> -->
<div class="jumbotron">
	<!-- container : 내용이 들어감 -->
	<div class="container">
		<h1 class="display-3">장바구니</h1>
	</div>
</div>
<div class="container">
	<div class="row">
			<table width="100%">
				<tr>
					<td align="left">
						<!-- cart=장바구니=session=웹브라우저=sessionId -->
						<a href="deleteCart.jsp?cartId=${cartId}" class="btn btn-danger">삭제하기</a>
					</td>
					<td align="right">
						<a href="shippingInfo.jsp?cartId=${cartId}" class="btn btn-success">주문하기</a>
					</td>
				</tr>
			</table>
		</div>
	<!-- 장바구니 출력 시작 --> 
	<!-- padding-top : 영역의 위쪽 여백 -->
	<div style="padding-top: 50px;">
		<table class="table table-hover">
			<tr>
				<th>상품</th><th>가격</th><th>수량</th><th>금액</th><th>비고</th>
			</tr>
			<!-- 장바구니가 비어있다면 -->
			<c:if test="${fn:length(list) == 0}">
			<tr style="text-align: center;">
				<td colspan="5" style="text-align: center;">장바구니에 상품이 없습니다.</td>
			</tr>
			</c:if>
			<c:if test="${fn:length(list) > 0}">
				<!-- 
				forEach 태그? 배열(String[], int[][]), Collection(List, Set) 또는 
				Map(HashTable, HashMap, SortedMap)에 저장되어 있는 값들을 
				순차적으로 처리할 때 사용함. 자바의 for, do~while을 대신해서 사용함
				var : 변수
				items : 아이템(배열, Collection, Map)
				varStatus : 루프 정보를 담은 객체 활용
				- index : 루프 실행 시 현재 인덱스(0부터 시작)
				- count : 실행 회수(1부터 시작. 보통 행번호 출력)
				-->
				<!-- list : List<ProductVO> -->
				<c:set var="amt" value="0" />
				<c:forEach var="productVO" items="${list}" varStatus="stat">
					<c:set var="amt" value="${amt + productVO.unitPrice*productVO.quantity}" />
					<tr>
						<td>${productVO.productId}-${productVO.pname}</td>
						<td><fmt:formatNumber value="${productVO.unitPrice}" pattern="#,###" /></td>
						<td>${productVO.quantity}</td>
						<td>
							<fmt:formatNumber value="${productVO.unitPrice*productVO.quantity}" pattern="#,###.0" />
						</td>
						<td>
							<a href="removeCart.jsp?productId=${productVO.productId}" class="badge badge-danger">삭제</a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><fmt:formatNumber value="${amt}" pattern="#,###" /></th>
					<th></th>
				</tr>
			</c:if>
		</table>
		<a href="products.jsp" class="btn btn-secondary">&laquo;쇼핑 계속하기</a>
	</div>
	<!-- 장바구니 출력 끝 -->
</div>
 
<%@ include file="footer.jsp" %>

</body>
</html>