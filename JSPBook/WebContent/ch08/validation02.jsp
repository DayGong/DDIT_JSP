<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script type="text/javascript">
	function checkform() {
		let form = document.loginForm;
		if(form.id.value == "") {
			alert("아이디를 입력해주세요");
			form.id.focus();		// 커서가 위치함
			return false;			// 함수 종료
		} else if(form.passwd.value == "") {
			alert("비밀번호를 입력해주세요");
			form.passwd.focus();	// 커서가 위치함
			return;					// 함수 종료
		}
		// 위의 분기문을 잘 통과하면
		form.submit();				// URL 요청
	}
</script>
</head>
<body>
	<!-- 
	요청URI : validation02_process.jsp
	요청파라미터 : {id=a001,passwd=java}
	요청방식 : post
    -->
	<form name="loginForm" action="validation02_process.jsp" method="post">
		<p>아이디: <input type="text" name="id" required /></p>
		<p>비밀번호: <input type="password" name="passwd" required /></p>
		<!-- checkform() : 핸들러 함수 -->
		<p><input type="button" value="전송" onclick="checkform()" /></p>
	</form>
</body>
</html>