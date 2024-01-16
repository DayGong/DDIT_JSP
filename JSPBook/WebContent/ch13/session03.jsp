<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Session</title>
</head>
<body>
	<%	// 스크립틀릿
		String name;	// 속성명
		String value;	// 값
		int i = 0;
		
		// 세션 속성을 모두 확인해보자
		Enumeration en = session.getAttributeNames(); // userId, userPW 열거형
		
		out.print("세션 아이디 : " + session.getId() + "<br />");
		
		// 세션 속성 이름이 있을 때까지 반복
		while ( en.hasMoreElements() ) {
			name = en.nextElement().toString();
			value = session.getAttribute(name).toString();	// session.getAttribute("userID")
			
			out.print("설정된 세션 속성 명 [" + i + "] : " + name + "<br />");
			out.print("설정된 세션 속성 명 [" + i + "] : " + value + "<br />");
			
			out.print("<hr />");
			i++;
		}
	
	%>
</body>
</html>