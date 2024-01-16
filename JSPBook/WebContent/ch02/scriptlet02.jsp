<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- 
JSTL : Jsp Standard Tag Library
 -->
<%
	//JSP기본 내장 객체
	pageContext.setAttribute("id", "a001");//동일 jsp내에서 공유
	request.setAttribute("name", "개똥이");//동일 요청에서 공유
	session.setAttribute("age", 23);//동일 웹브라우저
	application.setAttribute("phone", "010-111-2222");//웹브라우저	
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script type="text/javascript">
let boardId = "${param.boardId}";
console.log("boardId : " + boardId);
</script>
</head>
<body>
<!-- /ch02/scriptlet02.jsp?boardId=brd01 -->
<%-- <p><%=request.getParameter("boardId")%></p> --%>
<p>${param.boardId}</p>
<p>${pageContext.request.requestURI}</p>
<p>${pageScope.id}</p>
<p>${requestScope.name}</p>
<p>${sessionScope.age}</p>
<p>${applicationScope.phone}</p>
	<%
		for(int i=0;i<=10;i++){//0~10반복
			//짝수인 경우
			if(i%2==0){
				//JSP기본내장객에칭 out객체의 print메소드를 통해
				//문자열을 화면에 출력
				out.print("<p>" + i + "</p>");
			}
		}
	%>
</body>
</html>


