<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script type="text/javascript">
	function checkForm() {
		// Java Server Page -> Java를 추출
		let str = document.frm.title.value;
		let result = str.substring(0,4);
		
		console.log("result: " + result);
		
		// 정규표현식 선언
		let regExp = /Java/i;	// i: 대, 소문자 구별 X
		regExp.exec(str);
	}
</script>
</head>
<body>
	<!-- p.271 -->
	<form name="frm">
		<p>이름: <input type="text" name="title" value = "Java Server Page" required /></p>
		<p><input type="button" value="전송" onclick="checkForm()" /></p>
	</form>
</body>
</html>