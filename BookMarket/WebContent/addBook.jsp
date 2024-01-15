<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/BookMarket/resources/css/bootstrap.min.css">
<script type="text/javascript" src="/BookMarket/resources/js/validation.js"></script>
<title>도서 등록</title>
</head>
<body>
<%@ include file="menu.jsp" %>

<div class="jumbotron">
	<!-- container : 내용이 들어감 -->
	<div class="container">
		<h1 class="display-3">도서 등록</h1>
	</div>
</div>
<div class="container">
	<form name="addBookForm" action="/BookMarket/processAddBook.jsp" 
		class="form-horizontal" method="post" enctype="multipart/form-data">
		<!-- 폼데이터 -->
		<div class="form-group row">
			<label class="col-sm-2">도서코드</label>
			<div class="col-sm-3">
				<input type="text" name="bookId" class="form-control" required
					placeholder="도서코드"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">도서명</label>
			<div class="col-sm-3">
				<input type="text" name="name" class="form-control" required
					placeholder="도서명"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">가격</label>
			<div class="col-sm-3">
				<input type="number" name="unitPrice" class="form-control" required
					placeholder="가격"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">저자</label>
			<div class="col-sm-3">
				<input type="text" name="author" class="form-control" required
					placeholder="저자"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">출판사</label>
			<div class="col-sm-3">
				<input type="text" name="publisher" class="form-control" required
					placeholder="출판사"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">출판일</label>
			<div class="col-sm-3">
				<input type="text" name="releaseDate" class="form-control" required
					placeholder="출판일"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">총 페이지 수</label>
			<div class="col-sm-3">
				<input type="number" name="totalPages" class="form-control" required
					placeholder="총 페이지 수"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상세정보</label>
			<div class="col-sm-3">
				<textarea name="description" class="form-control" required
					placeholder="상세정보"></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">분류</label>
			<div class="col-sm-3">
				<input type="text" name="category" class="form-control" required
					placeholder="분류"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">재고수</label>
			<div class="col-sm-3">
				<input type="number" name="unitsInStock" class="form-control" required
					placeholder="재고수"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상태</label>
			<div class="col-sm-3">
				<input type="radio" id="condition1" name="condition" 
					value="New"/><label for="condition1">신규도서</label>
				<input type="radio" id="condition2" name="condition" 
					value="Old"/><label for="condition2">중고도서</label>
				<input type="radio" id="condition3" name="condition" 
					value="E-Book"/><label for="condition3">E-Book</label>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이미지</label>
			<div class="col-sm-5">
				<input type="file" name="uploadFile" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-primary" onclick="checkAddBook()" value="등록" />
			</div>
		</div>
	</form>
</div>
 
<%@ include file="footer.jsp" %>
</body>
</html>