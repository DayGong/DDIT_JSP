<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<title>Validation</title>
<script type="text/javascript">
	function checkform() {
		let id = document.loginForm.id.value;
		let passwd = document.loginForm.passwd.value;
		
		let id2 = $("input[name='id']").val();
		let passwd2 = $("input[name='passwd']").val();
		
		// JSON Object
		let data = {"id":id,"passwd":passwd,"id2":id2,"passwd2":passwd2};
		
		console.log("id: ", id);
		console.log("passwd: " + passwd);
		
		console.log("data: ", data);
		console.log("data: " + JSON.stringify(data));
	}
</script>
</head>
<body>
<!-- body와 body 사이를 document라고 함 -->
	<form name="loginForm">
		<p>아이디: <input type="text" name="id" required /></p>
		<p>비밀번호: <input type="password" name="passwd" required /></p>
		<!-- checkform() : 핸들러 함수 -->
		<p><input type="button" value="전송" onclick="checkform()" /></p>
	</form>
</body>
</html>