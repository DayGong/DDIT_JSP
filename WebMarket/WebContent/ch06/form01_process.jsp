<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="kr.or.ddit.vo.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<!-- 
?id=a001&passwd=java&name=김은대
&phone1=010&phone2=123&phone3=1234
&gender=남성&hobby=독서,영화&city=대전광역시
&food=sundai
-->
<%
	request.setCharacterEncoding("utf-8");

	String 		id 		= request.getParameter("id");				// a001
	String 		passwd 	= request.getParameter("passwd");			// java
	String 		name 	= request.getParameter("name");				// 김은대
	String 		phone1 	= request.getParameter("phone1");			// 010
	String 		phone2 	= request.getParameter("phone2");			// 123
	String 		phone3 	= request.getParameter("phone3");			// 1234
	String 		gender 	= request.getParameter("gender");			// 남성
	String[] 	hobby 	= request.getParameterValues("hobby");		// [독서,영화]
	String 		city 	= request.getParameter("city");				// 대전광역시
	String 		food 	= request.getParameter("food");				// sundai
	
	MemberVO memberVO = new MemberVO();
	memberVO.setId(id);
	memberVO.setPasswd(passwd);
	memberVO.setName(name);
	memberVO.setPhone(phone1 + phone2 + phone3);
	memberVO.setGender(gender);
	memberVO.setHobby(hobby);
	memberVO.setCity(city);
	memberVO.setFood(food);
	out.print("<p>" + memberVO + "</p>");
%>
<p>id     : <%=id    %></p>
<p>passwd : <%=passwd%></p>
<p>name   : <%=name  %></p>
<p>phone1 : <%=phone1%></p>
<p>phone2 : <%=phone2%></p>
<p>phone3 : <%=phone3%></p>
<p>gender : <%=gender%></p>
<p>hobby  :
<% 
	for(String h : hobby) {
		out.print("<p>" + h + "</p>");
	}
%>
</p>
<p>city   : <%=city  %></p>
<p>food   : <%=food  %></p>

</body>
</html>