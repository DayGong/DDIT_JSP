<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script type="text/javascript" src="/js/validation.js"></script>
<title>Welcome</title>
</head>
<body>

<%@ include file="menu.jsp" %>

<div class="jumbotron">
	<!-- container : 내용이 들어감 -->
	<div class="container">
		<h1 class="display-3">상품 등록</h1>
	</div>
</div>
<div class="container">
	<form name="newProduct" action="processAddProduct.jsp" class="form-horizontal" 
		method="post" enctype="multipart/form-data">
		<!-- 폼데이터 -->
		<div class="form-group row">
			<label class="col-sm-2">상품 코드</label>
			<div class="col-sm-3">
				<input type="text" id="productId" name="productId" class="form-control" required
					placeholder="상품 코드"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상품 명</label>
			<div class="col-sm-3">
				<input type="text" id="pname" name="pname" class="form-control" required
					placeholder="상품 명"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">가격</label>
			<div class="col-sm-3">
				<input type="number" id="unitPrice" name="unitPrice" class="form-control" required
					placeholder="가격"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상세 정보</label>
			<div class="col-sm-3">
				<textarea name="description" class="form-control" required
					placeholder="상세 정보"></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">제조사</label>
			<div class="col-sm-3">
				<input type="text" name="manufacturer" class="form-control" required
					placeholder="제조사"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">분류</label>
			<div class="col-sm-3">
				<select name="category" class="form-control">
					<option value="">선택해주세요</option>
					<option value="Smart Phone">Smart Phone</option>
					<option value="Notebook">Notebook</option>
					<option value="Tablet">Tablet</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">재고수</label>
			<div class="col-sm-3">
				<input type="number" id="unitsInStock" name="unitsInStock" class="form-control" required
					placeholder="재고수"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상태</label>
			<div class="col-sm-3">
				<input type="radio" id="condition1" name="condition" 
					value="New"/><label for="condition1">신규 제품</label>
				<input type="radio" id="condition2" name="condition" 
					value="Old"/><label for="condition2">중고 제품</label>
				<input type="radio" id="condition3" name="condition" 
					value="Refurblished"/><label for="condition3">재생 제품</label>
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
				<input type="button" class="btn btn-primary" value="등록"
					onclick="CheckAddProduct()" />
			</div>
		</div>
	</form>
</div>
 
<%@ include file="footer.jsp" %>

</body>
</html>