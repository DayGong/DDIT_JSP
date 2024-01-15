<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="vo.Book"%>
<%@ page import="dao.BookRepository"%>

<%
	String id = request.getParameter("bookId");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("books.jsp");
		return;
	}
	
	BookRepository dao = BookRepository.getInstance();
	
	Book book = dao.getBookById(id);
	if (book == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	List<Book> cartList = (List<Book>)session.getAttribute("cartlist");
	Book booksQnt = new Book();
	for (int i = 0; i < cartList.size(); i++) {
		booksQnt = cartList.get(i);
		if (booksQnt.getBookId().equals(id)) {
			cartList.remove(booksQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
%>