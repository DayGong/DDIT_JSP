<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="vo.Book"%>
<%@ page import="dao.BookRepository"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title></title>
</head>
<body>
	<%
		BookRepository dao = BookRepository.getInstance();
		List<Book> listOfBooks = dao.getAllBooks();
	%>
	<c:set var="listOfBooks" value="<%=listOfBooks%>" />
<%-- 	<p>${listOfBooks}</p> --%>
	<%@ include file="menu.jsp"%>
	<%!
		String greeting = "도서 목록";
	%>
	<div class="jumbotron">
		<!-- container : 내용이 들어감 -->
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	<div class="container">
		<c:forEach var="bookVO" items="${listOfBooks}" varStatus="stat">
			<div class="row">
				<div class="col-md-2">
					<img src="/BookMarket/images/${bookVO.filename}"
						style="width: 100%; height: 100%;">
				</div>
				<div class="col-md-8">
					<h2>[${bookVO.category}]${bookVO.name}</h2> 
					<p>${bookVO.description}</p>
					<br>
					<p>${bookVO.author}|${bookVO.publisher}|${bookVO.unitPrice}</p>
				</div>
				<div class="col-md-2">
					<a href="book.jsp?id=${bookVO.bookId}" class="btn btn-secondary" role="button">
						상세 정보
					</a>
				</div>
			</div>
			<hr>
		</c:forEach>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<a href="addBook.jsp" class="btn btn-primary">등록</a>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>