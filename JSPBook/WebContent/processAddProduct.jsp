<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.dao.ProductRepository"%>
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

// 이미지 파일업로드 처리
String path = "C:\\eclipse_202006\\workspace\\JSPBook\\WebContent\\images";
// 파일업로드 처리용 클래스
DiskFileUpload upload = new DiskFileUpload();
upload.setSizeMax(5000000); //5MB
upload.setSizeThreshold(5 * 4096);	// 5MB
upload.setRepositoryPath(path);	// 임시 저장경로(생략 가능)
// request 객체에 있는 모든 요청 파라미터를 분석하여 List타입의 items 변수에 저장
List items = upload.parseRequest(request);
Iterator params = items.iterator();	// 열거형으로 처리


// 파라미터 데이터 타입은 String
// enctype="multipart/form-data"로 한 경우 request.getParameter 사용 불가
String productId = "";
String pname = "";
String unitPrice = "";
String description = "";
String manufacturer = "";
String category = "";
String unitsInStock = "";
String condition = "";

// uploadFile=파일객체
String fileFieldName = "";	// uploadFile
String filename = "";		// 파일의 명
String contentType = "";	// 파일의 MIME타입

long price = 0L;
long stock = 0L;

while(params.hasNext()) { // 다음 항목이 있는지 체킹
	FileItem item = (FileItem) params.next();	// 있으면 그 항목을 가져옴
	if(item.isFormField()) { // 일반 항목일 때
		// item : productId=productId
		String name = item.getFieldName(); 	// productId
		if (name.equals("productId")) {
			productId = item.getString("UTF-8");
		} else if (name.equals("pname")) {
			pname = item.getString("UTF-8");
		} else if (name.equals("unitPrice")) {
			unitPrice = item.getString("UTF-8"); // 문자
			if (unitPrice.isEmpty()) {	// 가격이 비어있다면
				price = 0;
			} else {
				price = Long.valueOf(unitPrice);
			}
		} else if (name.equals("description")) {
			description = item.getString("UTF-8");
		} else if (name.equals("manufacturer")) {
			manufacturer = item.getString("UTF-8");
		} else if (name.equals("category")) {
			category = item.getString("UTF-8");
		} else if (name.equals("unitsInStock")) {
			unitPrice = item.getString("UTF-8"); // 문자
			if (unitPrice.isEmpty()) {	// 가격이 비어있다면
				stock = 0;
			} else {
				stock = Long.valueOf(unitPrice);
			}
		} else if (name.equals("condition")) {
			condition = item.getString("UTF-8");
		}
		
	} else { // 파일 항목일 때
		// item: uploadFile=파일객체
		fileFieldName = item.getFieldName(); // uploadFile
		filename = item.getName(); // c:\\Users\\test\\개똥이.jpg
		long fileSize = item.getSize(); // 파일 크기
		contentType = item.getContentType(); //images/jpeg
		
		filename = filename.substring(filename.lastIndexOf("\\")+1);	// 개똥이.jpg
		// 설계
		File file = new File(path + "/" + filename); // 복사할 위치\\개똥이.jpg
		// 복사 처리
		item.write(file);
	}
}

ProductVO productVO = new ProductVO();
productVO.setProductId(productId);
productVO.setPname(pname);
productVO.setUnitPrice(price);	// 형변환된 price
productVO.setDescription(description);
productVO.setManufacturer(manufacturer);
productVO.setCategory(category);
productVO.setUnitsInStock(stock); // 형변환된 stock
productVO.setCondition(condition);
productVO.setFilename(filename);

out.print("productVO: " + productVO);

// 싱글톤 객체로 생성(상품 입력 -> 목록에서도 보이게 됨)
ProductRepository dao = ProductRepository.getInstance();
// 새로운 상품 등록
dao.addProduct(productVO);

List<ProductVO> productVOList = dao.getAllProducts();
out.print("<p>productVOList: " + productVOList + "</p>");

// 목록으로 이동(URL을 재요청)
 response.sendRedirect("products.jsp");
%>