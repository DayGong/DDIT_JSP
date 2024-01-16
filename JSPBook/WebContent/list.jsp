<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="kr.or.ddit.vo.ProductVO"%>
<%@ page import="java.util.List"%>
<%@ page import="kr.or.ddit.dao.ProductRepository"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title></title>
	
	<!-- Custom fonts for this template -->
	<link href="sbadmin2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
		type="text/css">
	<link
		href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
		rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="sbadmin2/css/sb-admin-2.min.css" rel="stylesheet">
	
	<!-- Custom styles for this page -->
	<link href="sbadmin2/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body id="page-top">

<%
	// 싱글톤 객체 생성
	ProductRepository productDAO = ProductRepository.getInstance();
			
	List<ProductVO> listOfProducts = productDAO.getAllProducts();
%>
	<c:set var="listOfProducts" value="<%=listOfProducts%>" />

    <!-- Page Wrapper -->
    <div id="wrapper">
		<%@ include file="list_aside.jsp" %>
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				<%@ include file="list_header.jsp" %>
				
				<!-- 내용 -->
				<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>순번</th>
                                            <th>상품명</th>
                                            <th>가격</th>
                                            <th>제조사</th>
                                            <th>카테고리</th>
                                            <th>상태</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>순번</th>
                                            <th>상품명</th>
                                            <th>가격</th>
                                            <th>제조사</th>
                                            <th>카테고리</th>
                                            <th>상태</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="productVO" items="${listOfProducts}" varStatus="stat">
                                        <tr>
                                            <td>${productVO.productId}</td>
                                            <td>${productVO.pname}</td>
                                            <td>${productVO.unitPrice}</td>
                                            <td>${productVO.manufacturer}</td>
                                            <td>${productVO.category}</td>
                                            <td>${productVO.condition}</td>
                                        </tr>
									</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
				
			</div>

			<%@ include file="list_footer.jsp" %>
			
		</div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="sbadmin2/vendor/jquery/jquery.min.js"></script>
    <script src="sbadmin2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="sbadmin2/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="sbadmin2/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="sbadmin2/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="sbadmin2/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="sbadmin2/js/demo/datatables-demo.js"></script>

</body>
</html>