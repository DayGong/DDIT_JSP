<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<p>이 페이지는 1초마다 새로고침 됩니다.</p>
	<%
		//response.setIntHeader("Refresh", 1);
	%>
	<p>
		<%
			//=new Date().toLocaleString()
		%>
	</p>
	<p id="p1"></p>
	<script type="text/javascript">
		function showTime() {
			let today = new Date();

			console.log("today: " + today);

			// 앞에 0을 붙임
			// 3월은 03이 되지만 12월은 012가 되므로 끝에서 2자리를 잘라내서 12로 맞춰줌 
			let year = today.getFullYear();
			let month = ('0' + (today.getMonth() + 1)).slice(-2);
			let day = ('0' + today.getDate()).slice(-2);

			let dateString = year + "-" + month + "-" + day;

			console.log("dateString: " + dateString);

			let hours = ('0' + today.getHours()).slice(-2);
			let minutes = ('0' + today.getMinutes()).slice(-2);
			let seconds = ('0' + today.getSeconds()).slice(-2);

			let timeString = hours + ":" + minutes + ":" + seconds;

			console.log("timeString: " + timeString);

			// 요소(태그) 선택(select) <p id="p1"></p>
			document.getElementById("p1").innerHTML = dateString + " "
					+ timeString;
		} // end function showTime()
		
		setInterval(showTime, 1000); // 1초마다 함수 호출
	</script>
</body>
</html>