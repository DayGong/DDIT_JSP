<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@ page import="java.util.List"%>
<%@ page import="kr.or.ddit.dao.ProductRepository"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>상품 목록</title>
</head>
<body>
<%
	// 싱글톤 객체 생성
	ProductRepository productDAO = ProductRepository.getInstance();
	/*
		listOfProducts.add(phone);
	    listOfProducts.add(notebook);
	    listOfProducts.add(tablet);
	*/
	List<ProductVO> listOfProducts = productDAO.getAllProducts();
	
	// JSP 내장객체인 out객체 사용
	/* out.print("listOfProducts: " + listOfProducts); */
%>
<c:set var="listOfProducts" value="<%=listOfProducts%>" />
<%@ include file="menu.jsp" %>

<div class="jumbotron">
	<!-- container : 내용이 들어감 -->
	<div class="container">
		<h1 class="display-3">상품 목록</h1>
	</div>
</div>
<div class="container">
	<!-- 내용을 중간 정렬 -->
	<div class="row" align="center">
		<!-- 열별 처리(반복 대상) 
		listOfProducts : List<ProductVO>
		-->
		<!-- 
		var는 임의의 이름
		varStatus는 stat.index = index stat.count = 1부터 카운트 -->
		<c:forEach var="productVO" items="${listOfProducts}" varStatus="stat">
			<div class="col-md-4">
				<img src="/images/${productVO.filename}" style="width:100%;"/>
				<h3>${productVO.pname}</h3>
				<p>${productVO.description}</p>
				<p>${productVO.unitPrice}</p>
				<p>
				<!-- 
				요청URI : /product.jsp?productId=P1235
				요청파라미터 : productId=P1235
				요청방식 : get
				-->
					<a href="/product.jsp?productId=${productVO.productId}" 
						class="btn btn-secondary" role="button">상세정보</a>
				</p>
			</div>
		</c:forEach>
	</div>
	<div class="form-group row">
		<div class="col-sm-offset-2 col-sm-10">
			<a href="addProduct.jsp" class="btn btn-primary">등록</a>
		</div>
	</div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>