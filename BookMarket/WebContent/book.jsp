<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="exceptionNoBookId.jsp" %>
<%@ page import="vo.Book"%>
<%@ page import="dao.BookRepository"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>도서 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			console.log("보냄");
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
<%
	String id = request.getParameter("id");

	BookRepository dao = BookRepository.getInstance();
	Book book = dao.getBookById(id);
%>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%!
		String greeting = "도서 정보";
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-6"><img src="/BookMarket/images/<%=book.getFilename()%>"></div>
			<div class="col-md-6">
				<h3>[<%=book.getCategory() %>]<%=book.getName()%></h3>
				<p><%=book.getDescription() %></p>
				<p>
					<b>도서 코드: </b>
					<span class="badge badge-danger">
						<%=book.getBookId()%>
					</span>
				</p>
				<p><b>출판사: </b><%=book.getPublisher() %></p>
				<p><b>저자: </b><%=book.getUnitsInStock() %></p>
				<p><b>재고수: </b><%=book.getTotalPages() %></p>
				<p><b>총 페이지수: </b><%=book.getTotalPages() %></p>
				<p><b>출판일: </b><%=book.getReleaseDate() %></p>
				<h4><%=book.getUnitPrice() %>원</h4>
				<p>
					<form name="addForm" action="addCart.jsp?bookId=<%=book.getBookId()%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()">도서 주문&raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
					<a href="./books.jsp" class="btn btn-secondary">도서 목록&raquo;</a>
				</p>
			</div>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>