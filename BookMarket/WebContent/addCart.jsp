<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="vo.Book"%>
<%@ page import="dao.BookRepository"%>

<%
	String id = request.getParameter("bookId");
	if (id == null || id.trim().equals("") ) {
		response.sendRedirect("books.jsp");
		return;
	}
	
	BookRepository dao = BookRepository.getInstance();
	
	Book book = dao.getBookById(id);
	if (book == null) {
		response.sendRedirect("exceptionNoBookId.jsp");
	}
	
	List<Book> booksList = dao.getAllBooks();
	Book books = new Book();
	for (int i =0; i < booksList.size(); i++) {
		books = booksList.get(i);
		if (books.getBookId().equals(id)) {
			break;
		}
	}
	
	List<Book> list = (List<Book>)session.getAttribute("cartlist");
	if (list == null) {
		list = new ArrayList<Book>();
		session.setAttribute("cartlist", list);
	}
	
	int cnt = 0;
	Book booksQnt = new Book();
	for (int i = 0; i < list.size(); i++) {
		booksQnt = list.get(i);
		if (booksQnt.getBookId().equals(id)) {
			cnt++;
			long orderQuantity = booksQnt.getQuantity() + 1;
			booksQnt.setQuantity(orderQuantity);
		}
	}
	
	if (cnt == 0) {
		books.setQuantity(1);
		list.add(books);
	}
	
	response.sendRedirect("/BookMarket/book.jsp?id=" + id);
%>