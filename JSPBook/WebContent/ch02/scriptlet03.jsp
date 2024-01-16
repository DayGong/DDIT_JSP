<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="kr.or.ddit.vo.MemVO"%>
<!-- taglib디렉티브. prefix : 접두어 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<%
	List<MemVO> memVOList = new ArrayList<MemVO>();

	MemVO memVO = new MemVO();
	memVO.setUsername("a001");
	memVO.setPasswored("java");
	memVO.setEnabled("1");
	memVOList.add(memVO);
	
	memVO = new MemVO();
	memVO.setUsername("b001");
	memVO.setPasswored("java");
	memVO.setEnabled("1");
	memVOList.add(memVO);
	
	//memVOList : List<MemVO>
	for(MemVO vo : memVOList){
		out.print("<p>vo : " + vo + "</p>");
	}
%>
<c:set var="memVOList" value="<%=memVOList%>" />
<p>${memVOList}</p>
<table border="1">
	<tr>
		<th>아이디</th><th>비밀번호</th><th>사용여부</th>
	</tr>
	<!-- memVOList : List<MemVO> 
	forEach 태그? 배열(String[], int[][]), Collection(List, Set) 또는 
	Map(HashTable, HashMap, SortedMap)에 저장되어 있는 값들을 
	순차적으로 처리할 때 사용함. 자바의 for, do~while을 대신해서 사용함
	var : 변수
	items : 아이템(배열, Collection, Map)
	varStatus : 루프 정보를 담은 객체 활용
		- index : 루프 실행 시 현재 인덱스(0부터 시작)
		- count : 실행 회수(1부터 시작. 보통 행번호 출력)
	-->
	<c:forEach var="memVO" items="${memVOList}" varStatus="stat">
	<tr>
		<td>${memVO.username}</td><td>${memVO.passwored}</td><td>${memVO.enabled}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>


