<%@ page import="java.io.File"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page import="kr.or.ddit.vo.ProductVO"%>
<%@ page import="kr.or.ddit.dao.ProductRepository"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<%
request .setCharacterEncoding("UTF-8");

String path = "C:\\eclipse_202006\\workspace\\WebMarket\\WebContent\\images";
// String path = "D:\\ddit_workspace\\jsp_workspace\\WebMarket\\WebContent\\images";

DiskFileUpload upload = new DiskFileUpload();
upload.setSizeMax(5000000);
upload.setSizeThreshold(5 * 4096);
upload.setRepositoryPath(path);

List items = upload.parseRequest(request);
Iterator params = items.iterator();

String productId = "";
String name = "";
String unitPrice = "";
String description = "";
String manufacturer = "";
String category = "";
String unitsInStock = "";
String condition = "";

String fileFieldName = "";
String filename = "";
String contentType = "";

long price = 0L;
long stock = 0L;

while(params.hasNext()) { // 다음 항목이 있는지 체킹
	FileItem item = (FileItem) params.next();	// 있으면 그 항목을 가져옴
	if(item.isFormField()) { // 일반 항목일 때
		// item : productId=productId
		String item_name = item.getFieldName(); 	// productId
		if (item_name.equals("productId")) {
			productId = item.getString("UTF-8");
		} else if (item_name.equals("pname")) {
			name = item.getString("UTF-8");
		} else if (item_name.equals("unitPrice")) {
			unitPrice = item.getString("UTF-8"); // 문자
			if (unitPrice.isEmpty()) {	// 가격이 비어있다면
				price = 0;
			} else {
				price = Long.valueOf(unitPrice);
			}
		} else if (item_name.equals("description")) {
			description = item.getString("UTF-8");
		} else if (item_name.equals("manufacturer")) {
			manufacturer = item.getString("UTF-8");
		} else if (item_name.equals("category")) {
			category = item.getString("UTF-8");
		} else if (item_name.equals("unitsInStock")) {
			unitPrice = item.getString("UTF-8"); // 문자
			if (unitPrice.isEmpty()) {	// 가격이 비어있다면
				stock = 0;
			} else {
				stock = Long.valueOf(unitPrice);
			}
		} else if (item_name.equals("condition")) {
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

ProductRepository dao = ProductRepository.getInstance();

ProductVO newProduct = new ProductVO();
newProduct.setProductId(productId);
newProduct.setPname(name);
newProduct.setUnitPrice(price);
newProduct.setDescription(description);
newProduct.setManufacturer(manufacturer);
newProduct.setCategory(category);
newProduct.setUnitsInStock(stock);
newProduct.setCondition(condition);
newProduct.setFilename(filename);

dao.addProduct(newProduct);

response.sendRedirect("products.jsp");
%>
</body>
</html>