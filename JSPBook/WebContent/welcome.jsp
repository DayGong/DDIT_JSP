<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>Welcome</title>
<script type="text/javascript">
function gogo(){
	let today = new Date();//object
	
	console.log("today : " + today);
	
	let year = today.getFullYear();//연도
	// 2월 -> 02월
	let month = ('0' + (today.getMonth()+1)).slice(-2);//월
	// 9일 -> 09일
	let day = ('0' + today.getDate()).slice(-2);//일
	
	let hours   = ('0' + today.getHours()).slice(-2);//시
	let minutes = ('0' + today.getMinutes()).slice(-2);//분
	let seconds = ('0' + today.getSeconds()).slice(-2);//초
	
	//json오브젝트
	let date = {
		"year":year,"month":month,"day":day,
		"hours":hours,"minutes":minutes,"seconds":seconds
	};
	//date : {"year":2023,"month":"12","day":"27"
	//   	,"hours":"10","minutes":"25","seconds":"45"}
	console.log("date : " + JSON.stringify(date));
	
	let dateString = year  + "-" + month   + "-" + day;
	let timeString = hours + ":" + minutes + ":" + seconds;
	//select
	document.getElementById("idH4").innerHTML = dateString + " " + timeString;
}

//1초마다 gogo함수를 요청
setInterval(gogo,1000);
</script>
</head>
<body>

<%@ include file="menu.jsp" %>

<%!//선언문(전역변수)
	String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.";
	String tagline = "Welcome to 남의양 Market!";
%>
<div class="jumbotron">
	<!-- container : 내용이 들어감 -->
	<div class="container">
		<h1 class="display-3"><%=greeting%></h1>
	</div>
</div>
<div class="container">
	<!-- 내용을 중간 정렬 -->
	<div class="text-center">
		<h3><%=tagline%></h3>
		<p>현재 접속 시각 : <h4 id="idH4"></h4></p>
	</div>
</div>
 
<%@ include file="footer.jsp" %>

</body>
</html>