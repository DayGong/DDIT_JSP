<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<title>주문 완료</title>
</head>
<body>
	<%
		String Shipping_cartId = "";
		String Shipping_name = "";
		String Shipping_shippingDate = "";
		String Shipping_country = "";
		String Shipping_zipCode = "";
		String Shipping_addressName = "";
		
		Cookie[] cookies = request.getCookies();
		
		// 쿠키의 개수만큼 반복
		for ( int i = 0; i < cookies.length; i++ ) {
			Cookie thisCookie = cookies[i];
			
			if ( thisCookie.getName().equals("Shipping_cartId") ) {
				Shipping_cartId = thisCookie.getValue();
			}
			if ( thisCookie.getName().equals("Shipping_name") ) {
				Shipping_name = thisCookie.getValue();
			}
			if ( thisCookie.getName().equals("Shipping_shippingDate") ) {
				Shipping_shippingDate = thisCookie.getValue();
			}
			if ( thisCookie.getName().equals("Shipping_country") ) {
				Shipping_country = thisCookie.getValue();
			}
			if ( thisCookie.getName().equals("Shipping_zipCode") ) {
				Shipping_zipCode = thisCookie.getValue();
			}
			if ( thisCookie.getName().equals("Shipping_addressName") ) {
				Shipping_addressName = thisCookie.getValue();
			}
		}
	%>
	<!-- include 액션 태그 -->
	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	
	<!-- 주문 완료 내용 시작 -->
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문은 <%=Shipping_shippingDate%>에 배송될 예정입니다.</p>
		<p>주문번호 : <%=Shipping_cartId%></p>
	</div>
	
	<div class="container">
		<p><a href="products.jsp" class="btn btn-secondary">&laquo; 상품 목록 </a></p>
	</div>
	<!-- 주문 완료 내용 끝 -->
	
	<jsp:include page="footer.jsp" />
</body>
</html>

<%
// 1) 세션 정리
// session.invalidate(); => 로그아웃 처리되버림(x)
session.removeAttribute("cartlist");	// 장바구니만 제거

// 2) 쿠키 정리
for ( int i = 0; i < cookies.length; i++ ) {
	Cookie thisCookie = cookies[i];
	
	if ( thisCookie.getName().equals("Shipping_cartId") ) {
		thisCookie.setMaxAge(0);
	}
	if ( thisCookie.getName().equals("Shipping_name") ) {
		thisCookie.setMaxAge(0);
	}
	if ( thisCookie.getName().equals("Shipping_shippingDate") ) {
		thisCookie.setMaxAge(0);
	}
	if ( thisCookie.getName().equals("Shipping_country") ) {
		thisCookie.setMaxAge(0);
	}
	if ( thisCookie.getName().equals("Shipping_zipCode") ) {
		thisCookie.setMaxAge(0);
	}
	if ( thisCookie.getName().equals("Shipping_addressName") ) {
		thisCookie.setMaxAge(0);
	}
	
	response.addCookie(thisCookie);
}
%>