<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<%
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
	%>
	<%
		try {
			out.print(num1 + " / " + num2 + " = " + num1 / num2);
		} catch (ArithmeticException e) { // 0으로 나눴을 때 오류 처리
			RequestDispatcher dispatcher =
				request.getRequestDispatcher("tryCatch_error.jsp");
			dispatcher.forward(request, response);
		}
	%>
</body>
</html>