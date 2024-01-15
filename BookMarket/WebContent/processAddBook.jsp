<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="dao.BookRepository"%>
<%@page import="vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String path = "C:\\eclipse_202006\\workspace\\BookMarket\\WebContent\\images";
// String path = "D:\\ddit_workspace\\jsp_workspace\\BookMarket\\WebContent\\images";

DiskFileUpload upload = new DiskFileUpload();
upload.setSizeMax(5000000);
upload.setSizeThreshold(5 * 4096);
upload.setRepositoryPath(path);

List items = upload.parseRequest(request);
Iterator params = items.iterator();

String bookId = "";
String name = "";
String unitPrice = "";
String description = "";
String author = "";
String publisher = "";
String category = "";
String unitsInStock = "";
String totalPages = "";
String releaseDate = "";
String condition = "";

String fileFieldName = "";
String filename = "";

int price = 0;
long stock = 0L;
long pages = 0L;

while(params.hasNext()) {
	FileItem item = (FileItem) params.next();
	if (item.isFormField()) {
		String fname = item.getFieldName();
		if (fname.equals("bookId")) {
			bookId = item.getString("utf-8");
		} else if (fname.equals("name")) {
			name = item.getString("utf-8");
		} else if (fname.equals("unitPrice")) {
			unitPrice = item.getString("utf-8");
			if (unitPrice.isEmpty()) {
				price = 0;
			} else {
				price = Integer.parseInt(unitPrice);
			}
		} else if (fname.equals("description")) {
			description = item.getString("UTF-8");
		} else if (fname.equals("author")) {
			author = item.getString("UTF-8");
		} else if (fname.equals("publisher")) {
			publisher = item.getString("UTF-8");
		} else if (fname.equals("category")) {
			category = item.getString("UTF-8");
		} else if (fname.equals("unitsInStock")) {
			unitsInStock = item.getString("utf-8");
			if (unitsInStock.isEmpty()) {
				stock = 0;
			} else {
				stock = Long.valueOf(unitsInStock);
			}
		} else if (fname.equals("totalPages")) {
			totalPages = item.getString("utf-8");
			if (totalPages.isEmpty()) {
				pages = 0;
			} else {
				pages = Long.valueOf(totalPages);
			}
		} else if (fname.equals("releaseDate")) {
			releaseDate = item.getString("UTF-8");
		} else if (fname.equals("condition")) {
			condition = item.getString("UTF-8");
		}
	} else {
		fileFieldName = item.getFieldName();
		filename = item.getName();
		
		filename = filename.substring(filename.lastIndexOf("\\") + 1);
		File file = new File(path + "/" + filename);
		item.write(file);
	}
}

Book bookVO = new Book();
bookVO.setBookId(bookId);
bookVO.setName(name);
bookVO.setUnitPrice(price);
bookVO.setDescription(description);
bookVO.setAuthor(author);
bookVO.setPublisher(publisher);
bookVO.setCategory(category);
bookVO.setUnitsInStock(stock);
bookVO.setTotalPages(pages);
bookVO.setReleaseDate(releaseDate);
bookVO.setCondition(condition);
bookVO.setFilename(filename);

// out.print("bookVO: " + bookVO);

BookRepository dao = BookRepository.getInstance();
dao.addBook(bookVO);

response.sendRedirect("/BookMarket/books.jsp");
%>