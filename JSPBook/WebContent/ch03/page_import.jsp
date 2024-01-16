<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>Directives Tag</title>
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
	document.getElementById("span1").innerHTML = dateString + " " + timeString;
}

//1초마다 gogo함수를 요청
setInterval(gogo,1000);
</script>
</head>
<body>

<!-- header 시작 -->
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<!-- container : 내 안에 내용 있다 -->
	<div class="container">
		<div class="navbar-header" style="width:100%;">
			<div style="float:left;">
				<a class="navbar-brand" href="welcome.jsp">Home</a>
			</div>
		</div>
	</div>
</nav>
<!--  header 끝 -->

	Today is <span id="span1"><%=new java.util.Date()%></span>
	
<!-- footer 시작 -->
<footer class="container">
	<p>&copy; NEYMarket</p>
</footer>
<!-- footer 끝 -->
</body>
</html>