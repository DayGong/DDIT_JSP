<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<!-- session01.jsp와 session01_process.jsp를 먼저 수행 후 -->
	<!-- 
		session.setAttribute("userID", user_id);   //admin
		session.setAttribute("userPW", user_pw);   //java
	-->
	<!-- p.430 -->
	<h4>-- 세션 삭제 전 --</h4>
	<%
		String user_id = (String) session.getAttribute("userID"); // admin
		String user_pw = (String) session.getAttribute("userPW"); // java
		
		out.print("설정된 세션 명 userID : " + user_id + "<br />"); // admin
		out.print("설정된 세션 명 userPW : " + user_pw + "<br />"); // java
		
		// 잘 안씀
		// session.removeAttribute("userID");
		
		// 잘 씀 : 세션에 저장된 모든 세션 속성 삭제 (로그아웃 시 활용)
		session.invalidate();
	%>
	<h4>-- 세션 삭제 후 --</h4>
	<%
		// request 객체에 포함된 클라이언트 세션이 유효한지 체킹
		if (request.isRequestedSessionIdValid() == true) { // 세션이 유효함
			user_id = (String) session.getAttribute("userID"); // admin
			user_pw = (String) session.getAttribute("userPW"); // java
			
			out.print("설정된 세션 명 userID : " + user_id + "<br />"); // admin
			out.print("설정된 세션 명 userPW : " + user_pw + "<br />"); // java
		} else {	// 세션이 유효하지 않음
			out.print("세션이 유효하지 않습니다.");
		}
	%>
</body>
</html>